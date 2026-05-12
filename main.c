#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/time.h>
#include <x86intrin.h>
#include <omp.h>

#define PRINT_MATRICES 0 // Determines whether to print matrices
#define MIN 0.0 // Min value in matrix
#define MAX 1.0 // Max value in matrix
#define MM256_STRIDE 4 // Number of doubles operated on simultaneously in AVX instructions
#define MEM_ALIGN 32 // Memory alignment required for _mm256 instructions

#ifndef UNROLL
#define UNROLL 4 // Number of times to unroll loop in unrolled_matrix_multiply()
#endif
#ifndef OMP_THREADS
#define OMP_THREADS 4 // Number of threads to use with omp pragma
#endif
#ifndef BLOCK_SIZE
#define BLOCK_SIZE 32 // Block size when using blocked_matrix_multiply()
#endif

// method IDs passed via argv[5]
#define METHOD_BASELINE  0
#define METHOD_UNROLLED  1
#define METHOD_MULTICORE 2
#define METHOD_BLOCKED   3
#define METHOD_SIMD      4
#define METHOD_COMBINED  5

void print_help_and_exit(char **argv) {
    printf("usage: %s <L> <M> <N> <seed> <method>\n", argv[0]);
    printf("  method: 0=baseline 1=unrolled 2=multicore 3=blocked 4=simd 5=combined\n");
    exit(0);
}

void print_matrix(double **mat, int rows, int cols) {
    for(int i=0; i<rows; i++) {
        for(int j=0; j<cols; j++){
            printf("%f ", mat[i][j]);
        }
        printf("\n");
    }
}

double drand(double min, double max) {
    double random_double = (double) rand() / RAND_MAX;
    random_double = (random_double * (max - min)) + min;
    return random_double;
}

/* Multiply two matrices
 * size of A is LxM
 * size of B is MxN
 * C should be allocated of size LxN
 */
void matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    /* iterate over the rows of A */
    for(int i=0; i<L; i++) {
        /* Iterate over the columns of B */
        for(int j=0; j<N; j++) {
            /* Iterate over the rows of B */
            for(int k=0; k<M; k++){
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

/* Multiply two matrices using loop unrolling
 * size of A is LxM
 * size of B is MxN
 * C should be allocated of size LxN
 */
void unrolled_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    /* iterate over the rows of A */
    for(int i=0; i<L; i++) {
        /* Iterate over the columns of B */
        for(int j=0; j<N; j+=UNROLL) {
            double C_temp[UNROLL];
            for (int u=0; u<UNROLL; u++){
                C_temp[u] = C[i][j+u];
            }
            for (int u=0; u<UNROLL; u++){
                /* Iterate over the rows of B */
                for(int k=0; k<M; k++){
                    C_temp[u] += A[i][k] * B[k][j+u];
                }
            }
            for (int u=0; u<UNROLL; u++){
                C[i][j+u] = C_temp[u];
            }
        }
    }
}

/* Multiply two matrices using multiple cores via OMP
 * size of A is LxM
 * size of B is MxN
 * C should be allocated of size LxN
 */
void multicore_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    #pragma omp parallel for
    /* iterate over the rows of A */
    for(int i=0; i<L; i++) {
        /* Iterate over the columns of B */
        for(int j=0; j<N; j++) {
            /* Iterate over the rows of B */
            for(int k=0; k<M; k++){
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

void do_block(int si, int sj, int sk, double **A, double **B, double **C) {
    for (int i=si; i<si+BLOCK_SIZE; i++){
        for (int j=sj; j<sj+BLOCK_SIZE; j++){
            double C_ij = C[i][j];
            for (int k=sk; k<sk+BLOCK_SIZE; k++){
                C_ij += A[i][k] * B[k][j];
            }
            C[i][j] = C_ij;
        }
    }
}

/* Multiply two matrices using blocking to improve cache performance
 * size of A is LxM
 * size of B is MxN
 * C should be allocated of size LxN
 */
void blocked_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    /* iterate over the rows of A */
    for(int sj=0; sj<L; sj+=BLOCK_SIZE) {
        /* Iterate over the columns of B */
        for(int si=0; si<N; si+=BLOCK_SIZE) {
            /* Iterate over the rows of B */
            for(int sk=0; sk<M; sk+=BLOCK_SIZE){
                do_block(si, sj, sk, A, B, C);
            }
        }
    }
}

/* Multiply two matrices using subword parallelism via AVX instructions
 * size of A is LxM
 * size of B is MxN
 * C should be allocated of size LxN
 */
void subword_parallelism_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    /* iterate over the rows of A */
    for(int i=0; i<L; i++) {
        /* Iterate over the columns of B */
        for(int j=0; j<N; j+=MM256_STRIDE) {
            __m256d c0 = _mm256_load_pd(&C[i][j]);
            /* Iterate over the rows of B */
            for(int k=0; k<M; k++){
                c0 = _mm256_add_pd(c0,
                                   _mm256_mul_pd(_mm256_load_pd(&B[k][j]),
                                   _mm256_broadcast_sd(&A[i][k])));
            }
            _mm256_store_pd(&C[i][j], c0);
        }
    }
}

/* Multiply two matrices using blocking, SIMD and OMP combined
 * size of A is LxM
 * size of B is MxN
 * C should be allocated of size LxN
 */
void combined_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
    #pragma omp parallel for schedule(dynamic)
    for (int si=0; si<L; si+=BLOCK_SIZE) {
        for (int sk=0; sk<M; sk+=BLOCK_SIZE) {
            for (int sj=0; sj<N; sj+=BLOCK_SIZE) {
                int i_end = si + BLOCK_SIZE < L ? si + BLOCK_SIZE : L;
                int k_end = sk + BLOCK_SIZE < M ? sk + BLOCK_SIZE : M;
                int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
                for (int i=si; i<i_end; i++) {
                    for (int k=sk; k<k_end; k++) {
                        __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
                        int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
                        /* vectorised section */
                        for (int j=sj; j<j_vec_end; j+=MM256_STRIDE) {
                            __m256d c = _mm256_load_pd(&C[i][j]);
                            __m256d b = _mm256_load_pd(&B[k][j]);
                            _mm256_store_pd(&C[i][j], _mm256_add_pd(c, _mm256_mul_pd(b, a_ik)));
                        }
                        /* scalar tail for remaining columns */
                        for (int j=j_vec_end; j<j_end; j++)
                            C[i][j] += A[i][k] * B[k][j];
                    }
                }
            }
        }
    }
}

/*
 * Free:
 * - A of size LxM
 * - B of size MxN
 * - C of size LxN
 */
void free_matrices(double **A, double **B, double **C, int L, int M, int N) {
    for(int i=0; i<L; i++) {
        free(A[i]);
        free(C[i]);
    }
    for(int i=0; i<M; i++) {
        free(B[i]);
    }
    free(A);
    free(B);
    free(C);
}

int main(int argc, char **argv) {

    // ######################################################
    // Read and check program arguments
    // ######################################################
    int L, M, N, seed, method;
    double **A, **B, **C;
    struct timeval start, stop, total;

    if(argc != 6) {
        printf("ERROR: incorrect number of arguments\n");
        print_help_and_exit(argv);
    }

    L      = atoi(argv[1]);
    M      = atoi(argv[2]);
    N      = atoi(argv[3]);
    seed   = atoi(argv[4]);
    method = atoi(argv[5]);
    srand(seed);

    if( !L || !M || !N ) {
        printf("ERROR: invalid arguments\n");
        print_help_and_exit(argv);
    }

    // Set number of threads when using omp pragma
    omp_set_num_threads(OMP_THREADS);

    // ######################################################
    // Initialise datastructures
    // ######################################################
    // A: LxM matrix, i.e. L rows and M columns
    A = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
    if(A == NULL) {
        printf("ERROR: cannot allocate memory for matrix A\n");
        return 0;
    }
    for(int i=0; i<L; i++) {
        A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
        if(A[i] == NULL) {
            printf("ERROR: cannot allocate memory for matrix A\n");
            return 0;
        }
    }

    // B: MxN matrix, i.e. M rows and N columns
    B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
    if(B == NULL) {
        printf("ERROR: cannot allocate memory for matrix B\n");
        return 0;
    }
    for(int i=0; i<M; i++) {
        B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
        if(B[i] == NULL) {
            printf("ERROR: cannot allocate memory for matrix B\n");
            return 0;
        }
    }

    for(int i=0; i<L; i++)
        for(int j=0; j<M; j++)
            A[i][j] = drand(MIN, MAX);

    for(int i=0; i<M; i++)
        for(int j=0; j<N; j++)
            B[i][j] = drand(MIN, MAX);

    // Allocate C matrix and initialise to zeros, its size will be LxN
    C = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
    if(C == NULL) {
        printf("ERROR: cannot allocate memory for matrix C\n");
        return 0;
    }
    for(int i=0; i<L; i++) {
        C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
        if(C[i] == NULL) {
            printf("ERROR: cannot allocate memory for matrix C\n");
            return 0;
        }
        /* Initialise with zeros */
        for(int j=0; j<N; j++){
            C[i][j] = 0.0;
        }
    }

    if (PRINT_MATRICES){
        printf("\nMATRIX A:\n");
        print_matrix(A, L, M);

        printf("\nMATRIX B:\n");
        print_matrix(B, M, N);

        printf("\nMATRIX C (init to zero):\n");
        print_matrix(C, L, N);
    }

    // ######################################################
    // Perform matrix multiply
    // ######################################################
    gettimeofday(&start, NULL);

    // Call one of the matrix multiply functions below:
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

    // ######################################################
    // Report performance and free datastructures
    // ######################################################
    if (PRINT_MATRICES){
        printf("\nOutput C:\n");
        print_matrix(C, L, N);
    }

    if (PRINT_MATRICES){
        // Reset C to zeros to enable calculation check
        for(int i=0; i<L; i++){
            for(int j=0; j<N; j++){
                C[i][j] = 0.0;
            }
        }
        matrix_multiply(A, B, C, L, M, N);
        printf("\nBaseline Output C from matrix_multiply():\n");
        print_matrix(C, L, N);
        printf("\n");
    }

    // Print timing results
    printf("L = %d, M = %d, N = %d, METHOD = %d, EXEC TIME: %ld.%06ld\n",
           L, M, N, method, total.tv_sec, total.tv_usec);

    // Free datastructures
    free_matrices(A, B, C, L, M, N);

    return 0;
}
