#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/time.h>
#include <x86intrin.h>
#include <omp.h>

#define PRINT_MATRICES 0
#define MIN 0.0
#define MAX 1.0
#define MEM_ALIGN  32       // required alignment for _mm256 loads/stores
#define MM256_STRIDE 4      // Task 1.7: doubles per AVX2 register

// allow compile-time override via -DUNROLL=N, -DOMP_THREADS=N, -DBLOCK_SIZE=N
#ifndef UNROLL
#define UNROLL 4            // Task 1.4: loop unroll factor, keep as power of 2
#endif
#ifndef OMP_THREADS
#define OMP_THREADS 4       // Task 1.5: thread count for multicore multiply
#endif
#ifndef BLOCK_SIZE
#define BLOCK_SIZE 32       // Task 1.6: cache block size in elements
#endif

// method IDs passed via argv[5]
#define METHOD_BASELINE  0
#define METHOD_UNROLLED  1
#define METHOD_MULTICORE 2
#define METHOD_BLOCKED   3
#define METHOD_SIMD      4
#define METHOD_COMBINED  5  // Part II

void print_help_and_exit(char **argv) {
    printf("usage: %s <L> <M> <N> <seed> <method>\n", argv[0]);
    printf("  method: 0=baseline 1=unrolled 2=multicore 3=blocked 4=simd 5=combined\n");
    exit(0);
}

void print_matrix(double **mat, int rows, int cols) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++)
            printf("%f ", mat[i][j]);
        printf("\n");
    }
}

double drand(double min, double max) {
    double r = (double)rand() / RAND_MAX;
    return r * (max - min) + min;
}

// Task 1.2: baseline triple-nested loop, no optimisation
void matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    for (int i = 0; i < L; i++)
        for (int j = 0; j < N; j++)
            for (int k = 0; k < M; k++)
                C[i][j] += A[i][k] * B[k][j];
}

// Task 1.4: manual loop unrolling across the j dimension
void unrolled_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    for (int i = 0; i < L; i++) {
        for (int j = 0; j < N; j += UNROLL) {
            double C_temp[UNROLL];
            for (int u = 0; u < UNROLL; u++)
                C_temp[u] = C[i][j + u];
            for (int u = 0; u < UNROLL; u++)
                for (int k = 0; k < M; k++)
                    C_temp[u] += A[i][k] * B[k][j + u];
            for (int u = 0; u < UNROLL; u++)
                C[i][j + u] = C_temp[u];
        }
    }
}

// Task 1.5: parallelise outer loop across OMP_THREADS cores
void multicore_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    #pragma omp parallel for
    for (int i = 0; i < L; i++)
        for (int j = 0; j < N; j++)
            for (int k = 0; k < M; k++)
                C[i][j] += A[i][k] * B[k][j];
}

// Task 1.6: inner block computation, keeps data in L1 cache
static void do_block(int si, int sj, int sk, double **A, double **B, double **C) {
    for (int i = si; i < si + BLOCK_SIZE; i++) {
        for (int j = sj; j < sj + BLOCK_SIZE; j++) {
            double c_ij = C[i][j];
            for (int k = sk; k < sk + BLOCK_SIZE; k++)
                c_ij += A[i][k] * B[k][j];
            C[i][j] = c_ij;
        }
    }
}

// Task 1.6: tile the iteration space into BLOCK_SIZE x BLOCK_SIZE blocks
void blocked_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    for (int sj = 0; sj < L; sj += BLOCK_SIZE)
        for (int si = 0; si < N; si += BLOCK_SIZE)
            for (int sk = 0; sk < M; sk += BLOCK_SIZE)
                do_block(si, sj, sk, A, B, C);
}

// Task 1.7: AVX2 SIMD, processes MM256_STRIDE doubles per iteration
void subword_parallelism_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    for (int i = 0; i < L; i++) {
        for (int j = 0; j < N; j += MM256_STRIDE) {
            __m256d c0 = _mm256_load_pd(&C[i][j]);
            for (int k = 0; k < M; k++) {
                c0 = _mm256_add_pd(c0,
                     _mm256_mul_pd(_mm256_load_pd(&B[k][j]),
                                   _mm256_broadcast_sd(&A[i][k])));
            }
            _mm256_store_pd(&C[i][j], c0);
        }
    }
}

// Part II: combines blocking + SIMD + OMP for maximum throughput
void combined_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    #pragma omp parallel for schedule(dynamic)
    for (int si = 0; si < L; si += BLOCK_SIZE) {
        for (int sk = 0; sk < M; sk += BLOCK_SIZE) {
            for (int sj = 0; sj < N; sj += BLOCK_SIZE) {
                int i_end = si + BLOCK_SIZE < L ? si + BLOCK_SIZE : L;
                int k_end = sk + BLOCK_SIZE < M ? sk + BLOCK_SIZE : M;
                int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
                for (int i = si; i < i_end; i++) {
                    for (int k = sk; k < k_end; k++) {
                        __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
                        int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
                        for (int j = sj; j < j_vec_end; j += MM256_STRIDE) {
                            __m256d c = _mm256_load_pd(&C[i][j]);
                            __m256d b = _mm256_load_pd(&B[k][j]);
                            _mm256_store_pd(&C[i][j], _mm256_add_pd(c, _mm256_mul_pd(b, a_ik)));
                        }
                        // scalar tail for columns not divisible by MM256_STRIDE
                        for (int j = j_vec_end; j < j_end; j++)
                            C[i][j] += A[i][k] * B[k][j];
                    }
                }
            }
        }
    }
}

void free_matrices(double **A, double **B, double **C, int L, int M, int N) {
    for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
    for (int i = 0; i < M; i++)   free(B[i]);
    free(A); free(B); free(C);
}

int main(int argc, char **argv) {
    int L, M, N, seed, method;
    double **A, **B, **C;
    struct timeval start, stop, total;

    if (argc != 6) {
        printf("ERROR: incorrect number of arguments\n");
        print_help_and_exit(argv);
    }

    L      = atoi(argv[1]);
    M      = atoi(argv[2]);
    N      = atoi(argv[3]);
    seed   = atoi(argv[4]);
    method = atoi(argv[5]);
    srand(seed);

    if (!L || !M || !N) {
        printf("ERROR: invalid arguments\n");
        print_help_and_exit(argv);
    }

    omp_set_num_threads(OMP_THREADS);

    A = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
    for (int i = 0; i < L; i++)
        A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));

    B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
    for (int i = 0; i < M; i++)
        B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));

    for (int i = 0; i < L; i++)
        for (int j = 0; j < M; j++)
            A[i][j] = drand(MIN, MAX);
    for (int i = 0; i < M; i++)
        for (int j = 0; j < N; j++)
            B[i][j] = drand(MIN, MAX);

    C = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
    for (int i = 0; i < L; i++) {
        C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
        for (int j = 0; j < N; j++) C[i][j] = 0.0;
    }

    if (PRINT_MATRICES) {
        printf("\nA:\n"); print_matrix(A, L, M);
        printf("\nB:\n"); print_matrix(B, M, N);
        printf("\nC:\n"); print_matrix(C, L, N);
    }

    gettimeofday(&start, NULL);

    switch (method) {
        case METHOD_BASELINE:  matrix_multiply(A, B, C, L, M, N);                    break;
        case METHOD_UNROLLED:  unrolled_matrix_multiply(A, B, C, L, M, N);            break;
        case METHOD_MULTICORE: multicore_matrix_multiply(A, B, C, L, M, N);           break;
        case METHOD_BLOCKED:   blocked_matrix_multiply(A, B, C, L, M, N);             break;
        case METHOD_SIMD:      subword_parallelism_matrix_multiply(A, B, C, L, M, N); break;
        case METHOD_COMBINED:  combined_matrix_multiply(A, B, C, L, M, N);            break;
        default:
            printf("ERROR: unknown method %d\n", method);
            print_help_and_exit(argv);
    }

    gettimeofday(&stop, NULL);
    timersub(&stop, &start, &total);

    if (PRINT_MATRICES) { printf("\nC output:\n"); print_matrix(C, L, N); }

    printf("L = %d, M = %d, N = %d, METHOD = %d, EXEC TIME: %ld.%06ld\n",
           L, M, N, method, total.tv_sec, total.tv_usec);

    free_matrices(A, B, C, L, M, N);
    return 0;
}
