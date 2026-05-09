	.file	"main.c"
# GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mavx2 -mtune=generic -march=x86-64 -fopenmp -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"usage: %s <L> <M> <N> <seed> <method>\n"
	.align 8
.LC1:
	.string	"  method: 0=baseline 1=unrolled 2=multicore 3=blocked 4=simd 5=combined"
	.text
	.globl	print_help_and_exit
	.type	print_help_and_exit, @function
print_help_and_exit:
.LFB5039:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# argv, argv
# main.c:26:     printf("usage: %s <L> <M> <N> <seed> <method>\n", argv[0]);
	movq	-8(%rbp), %rax	# argv, tmp83
	movq	(%rax), %rax	# *argv_3(D), _1
	movq	%rax, %rsi	# _1,
	leaq	.LC0(%rip), %rax	#, tmp84
	movq	%rax, %rdi	# tmp84,
	movl	$0, %eax	#,
	call	printf@PLT	#
# main.c:27:     printf("  method: 0=baseline 1=unrolled 2=multicore 3=blocked 4=simd 5=combined\n");
	leaq	.LC1(%rip), %rax	#, tmp85
	movq	%rax, %rdi	# tmp85,
	call	puts@PLT	#
# main.c:28:     exit(0);
	movl	$0, %edi	#,
	call	exit@PLT	#
	.cfi_endproc
.LFE5039:
	.size	print_help_and_exit, .-print_help_and_exit
	.section	.rodata
.LC2:
	.string	"%f "
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB5040:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# mat, mat
	movl	%esi, -28(%rbp)	# rows, rows
	movl	%edx, -32(%rbp)	# cols, cols
# main.c:32:     for (int i = 0; i < rows; i++) {
	movl	$0, -8(%rbp)	#, i
# main.c:32:     for (int i = 0; i < rows; i++) {
	jmp	.L3	#
.L6:
# main.c:33:         for (int j = 0; j < cols; j++)
	movl	$0, -4(%rbp)	#, j
# main.c:33:         for (int j = 0; j < cols; j++)
	jmp	.L4	#
.L5:
# main.c:34:             printf("%f ", mat[i][j]);
	movl	-8(%rbp), %eax	# i, tmp90
	cltq
	leaq	0(,%rax,8), %rdx	#, _2
	movq	-24(%rbp), %rax	# mat, tmp91
	addq	%rdx, %rax	# _2, _3
	movq	(%rax), %rax	# *_3, _4
# main.c:34:             printf("%f ", mat[i][j]);
	movl	-4(%rbp), %edx	# j, tmp92
	movslq	%edx, %rdx	# tmp92, _5
	salq	$3, %rdx	#, _6
	addq	%rdx, %rax	# _6, _7
# main.c:34:             printf("%f ", mat[i][j]);
	movq	(%rax), %rax	# *_7, _8
	vmovq	%rax, %xmm0	# _8,
	leaq	.LC2(%rip), %rax	#, tmp93
	movq	%rax, %rdi	# tmp93,
	movl	$1, %eax	#,
	call	printf@PLT	#
# main.c:33:         for (int j = 0; j < cols; j++)
	addl	$1, -4(%rbp)	#, j
.L4:
# main.c:33:         for (int j = 0; j < cols; j++)
	movl	-4(%rbp), %eax	# j, tmp94
	cmpl	-32(%rbp), %eax	# cols, tmp94
	jl	.L5	#,
# main.c:35:         printf("\n");
	movl	$10, %edi	#,
	call	putchar@PLT	#
# main.c:32:     for (int i = 0; i < rows; i++) {
	addl	$1, -8(%rbp)	#, i
.L3:
# main.c:32:     for (int i = 0; i < rows; i++) {
	movl	-8(%rbp), %eax	# i, tmp95
	cmpl	-28(%rbp), %eax	# rows, tmp95
	jl	.L6	#,
# main.c:37: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5040:
	.size	print_matrix, .-print_matrix
	.globl	drand
	.type	drand, @function
drand:
.LFB5041:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	vmovsd	%xmm0, -24(%rbp)	# min, min
	vmovsd	%xmm1, -32(%rbp)	# max, max
# main.c:40:     double r = (double)rand() / RAND_MAX;
	call	rand@PLT	#
# main.c:40:     double r = (double)rand() / RAND_MAX;
	vcvtsi2sdl	%eax, %xmm0, %xmm0	# _1, _2
# main.c:40:     double r = (double)rand() / RAND_MAX;
	vmovsd	.LC3(%rip), %xmm1	#, tmp89
	vdivsd	%xmm1, %xmm0, %xmm0	# tmp89, _2, tmp88
	vmovsd	%xmm0, -8(%rbp)	# tmp88, r
# main.c:41:     return r * (max - min) + min;
	vmovsd	-32(%rbp), %xmm0	# max, tmp90
	vsubsd	-24(%rbp), %xmm0, %xmm0	# min, tmp90, _3
# main.c:41:     return r * (max - min) + min;
	vmulsd	-8(%rbp), %xmm0, %xmm0	# r, _3, _4
# main.c:41:     return r * (max - min) + min;
	vaddsd	-24(%rbp), %xmm0, %xmm0	# min, _4, _10
# main.c:42: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5041:
	.size	drand, .-drand
	.globl	matrix_multiply
	.type	matrix_multiply, @function
matrix_multiply:
.LFB5042:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# A, A
	movq	%rsi, -32(%rbp)	# B, B
	movq	%rdx, -40(%rbp)	# C, C
	movl	%ecx, -44(%rbp)	# L, L
	movl	%r8d, -48(%rbp)	# M, M
	movl	%r9d, -52(%rbp)	# N, N
# main.c:46:     for (int i = 0; i < L; i++)
	movl	$0, -12(%rbp)	#, i
# main.c:46:     for (int i = 0; i < L; i++)
	jmp	.L10	#
.L15:
# main.c:47:         for (int j = 0; j < N; j++)
	movl	$0, -8(%rbp)	#, j
# main.c:47:         for (int j = 0; j < N; j++)
	jmp	.L11	#
.L14:
# main.c:48:             for (int k = 0; k < M; k++)
	movl	$0, -4(%rbp)	#, k
# main.c:48:             for (int k = 0; k < M; k++)
	jmp	.L12	#
.L13:
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	movl	-12(%rbp), %eax	# i, tmp115
	cltq
	leaq	0(,%rax,8), %rdx	#, _2
	movq	-40(%rbp), %rax	# C, tmp116
	addq	%rdx, %rax	# _2, _3
	movq	(%rax), %rax	# *_3, _4
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	movl	-8(%rbp), %edx	# j, tmp117
	movslq	%edx, %rdx	# tmp117, _5
	salq	$3, %rdx	#, _6
	addq	%rdx, %rax	# _6, _7
	vmovsd	(%rax), %xmm1	# *_7, _8
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	movl	-12(%rbp), %eax	# i, tmp118
	cltq
	leaq	0(,%rax,8), %rdx	#, _10
	movq	-24(%rbp), %rax	# A, tmp119
	addq	%rdx, %rax	# _10, _11
	movq	(%rax), %rax	# *_11, _12
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	movl	-4(%rbp), %edx	# k, tmp120
	movslq	%edx, %rdx	# tmp120, _13
	salq	$3, %rdx	#, _14
	addq	%rdx, %rax	# _14, _15
	vmovsd	(%rax), %xmm2	# *_15, _16
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	movl	-4(%rbp), %eax	# k, tmp121
	cltq
	leaq	0(,%rax,8), %rdx	#, _18
	movq	-32(%rbp), %rax	# B, tmp122
	addq	%rdx, %rax	# _18, _19
	movq	(%rax), %rax	# *_19, _20
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	movl	-8(%rbp), %edx	# j, tmp123
	movslq	%edx, %rdx	# tmp123, _21
	salq	$3, %rdx	#, _22
	addq	%rdx, %rax	# _22, _23
	vmovsd	(%rax), %xmm0	# *_23, _24
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	vmulsd	%xmm0, %xmm2, %xmm0	# _24, _16, _25
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	movl	-12(%rbp), %eax	# i, tmp124
	cltq
	leaq	0(,%rax,8), %rdx	#, _27
	movq	-40(%rbp), %rax	# C, tmp125
	addq	%rdx, %rax	# _27, _28
	movq	(%rax), %rax	# *_28, _29
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	movl	-8(%rbp), %edx	# j, tmp126
	movslq	%edx, %rdx	# tmp126, _30
	salq	$3, %rdx	#, _31
	addq	%rdx, %rax	# _31, _32
# main.c:49:                 C[i][j] += A[i][k] * B[k][j];
	vaddsd	%xmm0, %xmm1, %xmm0	# _25, _8, _33
	vmovsd	%xmm0, (%rax)	# _33, *_32
# main.c:48:             for (int k = 0; k < M; k++)
	addl	$1, -4(%rbp)	#, k
.L12:
# main.c:48:             for (int k = 0; k < M; k++)
	movl	-4(%rbp), %eax	# k, tmp127
	cmpl	-48(%rbp), %eax	# M, tmp127
	jl	.L13	#,
# main.c:47:         for (int j = 0; j < N; j++)
	addl	$1, -8(%rbp)	#, j
.L11:
# main.c:47:         for (int j = 0; j < N; j++)
	movl	-8(%rbp), %eax	# j, tmp128
	cmpl	-52(%rbp), %eax	# N, tmp128
	jl	.L14	#,
# main.c:46:     for (int i = 0; i < L; i++)
	addl	$1, -12(%rbp)	#, i
.L10:
# main.c:46:     for (int i = 0; i < L; i++)
	movl	-12(%rbp), %eax	# i, tmp129
	cmpl	-44(%rbp), %eax	# L, tmp129
	jl	.L15	#,
# main.c:50: }
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5042:
	.size	matrix_multiply, .-matrix_multiply
	.globl	unrolled_matrix_multiply
	.type	unrolled_matrix_multiply, @function
unrolled_matrix_multiply:
.LFB5043:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	addq	$-128, %rsp	#,
	movq	%rdi, -88(%rbp)	# A, A
	movq	%rsi, -96(%rbp)	# B, B
	movq	%rdx, -104(%rbp)	# C, C
	movl	%ecx, -108(%rbp)	# L, L
	movl	%r8d, -112(%rbp)	# M, M
	movl	%r9d, -116(%rbp)	# N, N
# main.c:53: void unrolled_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp146
	movq	%rax, -8(%rbp)	# tmp146, D.31829
	xorl	%eax, %eax	# tmp146
# main.c:54:     for (int i = 0; i < L; i++) {
	movl	$0, -72(%rbp)	#, i
# main.c:54:     for (int i = 0; i < L; i++) {
	jmp	.L17	#
.L28:
# main.c:55:         for (int j = 0; j < N; j += UNROLL) {
	movl	$0, -68(%rbp)	#, j
# main.c:55:         for (int j = 0; j < N; j += UNROLL) {
	jmp	.L18	#
.L27:
# main.c:57:             for (int u = 0; u < UNROLL; u++)
	movl	$0, -64(%rbp)	#, u
# main.c:57:             for (int u = 0; u < UNROLL; u++)
	jmp	.L19	#
.L20:
# main.c:58:                 C_temp[u] = C[i][j + u];
	movl	-72(%rbp), %eax	# i, tmp120
	cltq
	leaq	0(,%rax,8), %rdx	#, _2
	movq	-104(%rbp), %rax	# C, tmp121
	addq	%rdx, %rax	# _2, _3
	movq	(%rax), %rax	# *_3, _4
# main.c:58:                 C_temp[u] = C[i][j + u];
	movl	-68(%rbp), %ecx	# j, tmp122
	movl	-64(%rbp), %edx	# u, tmp123
	addl	%ecx, %edx	# tmp122, _5
	movslq	%edx, %rdx	# _5, _6
# main.c:58:                 C_temp[u] = C[i][j + u];
	salq	$3, %rdx	#, _7
	addq	%rdx, %rax	# _7, _8
	vmovsd	(%rax), %xmm0	# *_8, _9
# main.c:58:                 C_temp[u] = C[i][j + u];
	movl	-64(%rbp), %eax	# u, tmp125
	cltq
	vmovsd	%xmm0, -48(%rbp,%rax,8)	# _9, C_temp[u_41]
# main.c:57:             for (int u = 0; u < UNROLL; u++)
	addl	$1, -64(%rbp)	#, u
.L19:
# main.c:57:             for (int u = 0; u < UNROLL; u++)
	cmpl	$3, -64(%rbp)	#, u
	jle	.L20	#,
# main.c:59:             for (int u = 0; u < UNROLL; u++)
	movl	$0, -60(%rbp)	#, u
# main.c:59:             for (int u = 0; u < UNROLL; u++)
	jmp	.L21	#
.L24:
# main.c:60:                 for (int k = 0; k < M; k++)
	movl	$0, -56(%rbp)	#, k
# main.c:60:                 for (int k = 0; k < M; k++)
	jmp	.L22	#
.L23:
# main.c:61:                     C_temp[u] += A[i][k] * B[k][j + u];
	movl	-60(%rbp), %eax	# u, tmp127
	cltq
	vmovsd	-48(%rbp,%rax,8), %xmm1	# C_temp[u_42], _10
# main.c:61:                     C_temp[u] += A[i][k] * B[k][j + u];
	movl	-72(%rbp), %eax	# i, tmp128
	cltq
	leaq	0(,%rax,8), %rdx	#, _12
	movq	-88(%rbp), %rax	# A, tmp129
	addq	%rdx, %rax	# _12, _13
	movq	(%rax), %rax	# *_13, _14
# main.c:61:                     C_temp[u] += A[i][k] * B[k][j + u];
	movl	-56(%rbp), %edx	# k, tmp130
	movslq	%edx, %rdx	# tmp130, _15
	salq	$3, %rdx	#, _16
	addq	%rdx, %rax	# _16, _17
	vmovsd	(%rax), %xmm2	# *_17, _18
# main.c:61:                     C_temp[u] += A[i][k] * B[k][j + u];
	movl	-56(%rbp), %eax	# k, tmp131
	cltq
	leaq	0(,%rax,8), %rdx	#, _20
	movq	-96(%rbp), %rax	# B, tmp132
	addq	%rdx, %rax	# _20, _21
	movq	(%rax), %rax	# *_21, _22
# main.c:61:                     C_temp[u] += A[i][k] * B[k][j + u];
	movl	-68(%rbp), %ecx	# j, tmp133
	movl	-60(%rbp), %edx	# u, tmp134
	addl	%ecx, %edx	# tmp133, _23
	movslq	%edx, %rdx	# _23, _24
# main.c:61:                     C_temp[u] += A[i][k] * B[k][j + u];
	salq	$3, %rdx	#, _25
	addq	%rdx, %rax	# _25, _26
	vmovsd	(%rax), %xmm0	# *_26, _27
# main.c:61:                     C_temp[u] += A[i][k] * B[k][j + u];
	vmulsd	%xmm0, %xmm2, %xmm0	# _27, _18, _28
# main.c:61:                     C_temp[u] += A[i][k] * B[k][j + u];
	vaddsd	%xmm0, %xmm1, %xmm0	# _28, _10, _29
	movl	-60(%rbp), %eax	# u, tmp136
	cltq
	vmovsd	%xmm0, -48(%rbp,%rax,8)	# _29, C_temp[u_42]
# main.c:60:                 for (int k = 0; k < M; k++)
	addl	$1, -56(%rbp)	#, k
.L22:
# main.c:60:                 for (int k = 0; k < M; k++)
	movl	-56(%rbp), %eax	# k, tmp137
	cmpl	-112(%rbp), %eax	# M, tmp137
	jl	.L23	#,
# main.c:59:             for (int u = 0; u < UNROLL; u++)
	addl	$1, -60(%rbp)	#, u
.L21:
# main.c:59:             for (int u = 0; u < UNROLL; u++)
	cmpl	$3, -60(%rbp)	#, u
	jle	.L24	#,
# main.c:62:             for (int u = 0; u < UNROLL; u++)
	movl	$0, -52(%rbp)	#, u
# main.c:62:             for (int u = 0; u < UNROLL; u++)
	jmp	.L25	#
.L26:
# main.c:63:                 C[i][j + u] = C_temp[u];
	movl	-72(%rbp), %eax	# i, tmp138
	cltq
	leaq	0(,%rax,8), %rdx	#, _31
	movq	-104(%rbp), %rax	# C, tmp139
	addq	%rdx, %rax	# _31, _32
	movq	(%rax), %rax	# *_32, _33
# main.c:63:                 C[i][j + u] = C_temp[u];
	movl	-68(%rbp), %ecx	# j, tmp140
	movl	-52(%rbp), %edx	# u, tmp141
	addl	%ecx, %edx	# tmp140, _34
	movslq	%edx, %rdx	# _34, _35
# main.c:63:                 C[i][j + u] = C_temp[u];
	salq	$3, %rdx	#, _36
	addq	%rax, %rdx	# _33, _37
# main.c:63:                 C[i][j + u] = C_temp[u];
	movl	-52(%rbp), %eax	# u, tmp143
	cltq
	vmovsd	-48(%rbp,%rax,8), %xmm0	# C_temp[u_44], _38
# main.c:63:                 C[i][j + u] = C_temp[u];
	vmovsd	%xmm0, (%rdx)	# _38, *_37
# main.c:62:             for (int u = 0; u < UNROLL; u++)
	addl	$1, -52(%rbp)	#, u
.L25:
# main.c:62:             for (int u = 0; u < UNROLL; u++)
	cmpl	$3, -52(%rbp)	#, u
	jle	.L26	#,
# main.c:55:         for (int j = 0; j < N; j += UNROLL) {
	addl	$4, -68(%rbp)	#, j
.L18:
# main.c:55:         for (int j = 0; j < N; j += UNROLL) {
	movl	-68(%rbp), %eax	# j, tmp144
	cmpl	-116(%rbp), %eax	# N, tmp144
	jl	.L27	#,
# main.c:54:     for (int i = 0; i < L; i++) {
	addl	$1, -72(%rbp)	#, i
.L17:
# main.c:54:     for (int i = 0; i < L; i++) {
	movl	-72(%rbp), %eax	# i, tmp145
	cmpl	-108(%rbp), %eax	# L, tmp145
	jl	.L28	#,
# main.c:66: }
	nop	
	movq	-8(%rbp), %rax	# D.31829, tmp147
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp147
	je	.L29	#,
	call	__stack_chk_fail@PLT	#
.L29:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5043:
	.size	unrolled_matrix_multiply, .-unrolled_matrix_multiply
	.globl	multicore_matrix_multiply
	.type	multicore_matrix_multiply, @function
multicore_matrix_multiply:
.LFB5044:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	#,
	movq	%rdi, -56(%rbp)	# A, A
	movq	%rsi, -64(%rbp)	# B, B
	movq	%rdx, -72(%rbp)	# C, C
	movl	%ecx, -76(%rbp)	# L, L
	movl	%r8d, -80(%rbp)	# M, M
	movl	%r9d, -84(%rbp)	# N, N
# main.c:69: void multicore_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp90
	movq	%rax, -8(%rbp)	# tmp90, D.31831
	xorl	%eax, %eax	# tmp90
# main.c:70:     #pragma omp parallel for
	movl	-84(%rbp), %eax	# N, tmp82
	movl	%eax, -16(%rbp)	# tmp82, .omp_data_o.2.N
	movl	-80(%rbp), %eax	# M, tmp83
	movl	%eax, -20(%rbp)	# tmp83, .omp_data_o.2.M
	movl	-76(%rbp), %eax	# L, tmp84
	movl	%eax, -24(%rbp)	# tmp84, .omp_data_o.2.L
	movq	-72(%rbp), %rax	# C, tmp85
	movq	%rax, -32(%rbp)	# tmp85, .omp_data_o.2.C
	movq	-64(%rbp), %rax	# B, tmp86
	movq	%rax, -40(%rbp)	# tmp86, .omp_data_o.2.B
	movq	-56(%rbp), %rax	# A, tmp87
	movq	%rax, -48(%rbp)	# tmp87, .omp_data_o.2.A
	leaq	-48(%rbp), %rax	#, tmp88
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rsi	# tmp88,
	leaq	multicore_matrix_multiply._omp_fn.0(%rip), %rax	#, tmp89
	movq	%rax, %rdi	# tmp89,
	call	GOMP_parallel@PLT	#
# main.c:75: }
	nop	
	movq	-8(%rbp), %rax	# D.31831, tmp91
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp91
	je	.L31	#,
	call	__stack_chk_fail@PLT	#
.L31:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5044:
	.size	multicore_matrix_multiply, .-multicore_matrix_multiply
	.type	do_block, @function
do_block:
.LFB5045:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)	# si, si
	movl	%esi, -40(%rbp)	# sj, sj
	movl	%edx, -44(%rbp)	# sk, sk
	movq	%rcx, -56(%rbp)	# A, A
	movq	%r8, -64(%rbp)	# B, B
	movq	%r9, -72(%rbp)	# C, C
# main.c:79:     for (int i = si; i < si + BLOCK_SIZE; i++) {
	movl	-36(%rbp), %eax	# si, tmp116
	movl	%eax, -20(%rbp)	# tmp116, i
# main.c:79:     for (int i = si; i < si + BLOCK_SIZE; i++) {
	jmp	.L33	#
.L38:
# main.c:80:         for (int j = sj; j < sj + BLOCK_SIZE; j++) {
	movl	-40(%rbp), %eax	# sj, tmp117
	movl	%eax, -16(%rbp)	# tmp117, j
# main.c:80:         for (int j = sj; j < sj + BLOCK_SIZE; j++) {
	jmp	.L34	#
.L37:
# main.c:81:             double c_ij = C[i][j];
	movl	-20(%rbp), %eax	# i, tmp118
	cltq
	leaq	0(,%rax,8), %rdx	#, _2
	movq	-72(%rbp), %rax	# C, tmp119
	addq	%rdx, %rax	# _2, _3
	movq	(%rax), %rax	# *_3, _4
# main.c:81:             double c_ij = C[i][j];
	movl	-16(%rbp), %edx	# j, tmp120
	movslq	%edx, %rdx	# tmp120, _5
	salq	$3, %rdx	#, _6
	addq	%rdx, %rax	# _6, _7
# main.c:81:             double c_ij = C[i][j];
	vmovsd	(%rax), %xmm0	# *_7, tmp121
	vmovsd	%xmm0, -8(%rbp)	# tmp121, c_ij
# main.c:82:             for (int k = sk; k < sk + BLOCK_SIZE; k++)
	movl	-44(%rbp), %eax	# sk, tmp122
	movl	%eax, -12(%rbp)	# tmp122, k
# main.c:82:             for (int k = sk; k < sk + BLOCK_SIZE; k++)
	jmp	.L35	#
.L36:
# main.c:83:                 c_ij += A[i][k] * B[k][j];
	movl	-20(%rbp), %eax	# i, tmp123
	cltq
	leaq	0(,%rax,8), %rdx	#, _9
	movq	-56(%rbp), %rax	# A, tmp124
	addq	%rdx, %rax	# _9, _10
	movq	(%rax), %rax	# *_10, _11
# main.c:83:                 c_ij += A[i][k] * B[k][j];
	movl	-12(%rbp), %edx	# k, tmp125
	movslq	%edx, %rdx	# tmp125, _12
	salq	$3, %rdx	#, _13
	addq	%rdx, %rax	# _13, _14
	vmovsd	(%rax), %xmm1	# *_14, _15
# main.c:83:                 c_ij += A[i][k] * B[k][j];
	movl	-12(%rbp), %eax	# k, tmp126
	cltq
	leaq	0(,%rax,8), %rdx	#, _17
	movq	-64(%rbp), %rax	# B, tmp127
	addq	%rdx, %rax	# _17, _18
	movq	(%rax), %rax	# *_18, _19
# main.c:83:                 c_ij += A[i][k] * B[k][j];
	movl	-16(%rbp), %edx	# j, tmp128
	movslq	%edx, %rdx	# tmp128, _20
	salq	$3, %rdx	#, _21
	addq	%rdx, %rax	# _21, _22
	vmovsd	(%rax), %xmm0	# *_22, _23
# main.c:83:                 c_ij += A[i][k] * B[k][j];
	vmulsd	%xmm0, %xmm1, %xmm0	# _23, _15, _24
# main.c:83:                 c_ij += A[i][k] * B[k][j];
	vmovsd	-8(%rbp), %xmm1	# c_ij, tmp130
	vaddsd	%xmm0, %xmm1, %xmm0	# _24, tmp130, tmp129
	vmovsd	%xmm0, -8(%rbp)	# tmp129, c_ij
# main.c:82:             for (int k = sk; k < sk + BLOCK_SIZE; k++)
	addl	$1, -12(%rbp)	#, k
.L35:
# main.c:82:             for (int k = sk; k < sk + BLOCK_SIZE; k++)
	movl	-44(%rbp), %eax	# sk, tmp131
	addl	$31, %eax	#, _25
	cmpl	%eax, -12(%rbp)	# _25, k
	jle	.L36	#,
# main.c:84:             C[i][j] = c_ij;
	movl	-20(%rbp), %eax	# i, tmp132
	cltq
	leaq	0(,%rax,8), %rdx	#, _27
	movq	-72(%rbp), %rax	# C, tmp133
	addq	%rdx, %rax	# _27, _28
	movq	(%rax), %rax	# *_28, _29
# main.c:84:             C[i][j] = c_ij;
	movl	-16(%rbp), %edx	# j, tmp134
	movslq	%edx, %rdx	# tmp134, _30
	salq	$3, %rdx	#, _31
	addq	%rdx, %rax	# _31, _32
# main.c:84:             C[i][j] = c_ij;
	vmovsd	-8(%rbp), %xmm0	# c_ij, tmp135
	vmovsd	%xmm0, (%rax)	# tmp135, *_32
# main.c:80:         for (int j = sj; j < sj + BLOCK_SIZE; j++) {
	addl	$1, -16(%rbp)	#, j
.L34:
# main.c:80:         for (int j = sj; j < sj + BLOCK_SIZE; j++) {
	movl	-40(%rbp), %eax	# sj, tmp136
	addl	$31, %eax	#, _33
	cmpl	%eax, -16(%rbp)	# _33, j
	jle	.L37	#,
# main.c:79:     for (int i = si; i < si + BLOCK_SIZE; i++) {
	addl	$1, -20(%rbp)	#, i
.L33:
# main.c:79:     for (int i = si; i < si + BLOCK_SIZE; i++) {
	movl	-36(%rbp), %eax	# si, tmp137
	addl	$31, %eax	#, _34
	cmpl	%eax, -20(%rbp)	# _34, i
	jle	.L38	#,
# main.c:87: }
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5045:
	.size	do_block, .-do_block
	.globl	blocked_matrix_multiply
	.type	blocked_matrix_multiply, @function
blocked_matrix_multiply:
.LFB5046:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$56, %rsp	#,
	movq	%rdi, -24(%rbp)	# A, A
	movq	%rsi, -32(%rbp)	# B, B
	movq	%rdx, -40(%rbp)	# C, C
	movl	%ecx, -44(%rbp)	# L, L
	movl	%r8d, -48(%rbp)	# M, M
	movl	%r9d, -52(%rbp)	# N, N
# main.c:91:     for (int sj = 0; sj < L; sj += BLOCK_SIZE)
	movl	$0, -12(%rbp)	#, sj
# main.c:91:     for (int sj = 0; sj < L; sj += BLOCK_SIZE)
	jmp	.L40	#
.L45:
# main.c:92:         for (int si = 0; si < N; si += BLOCK_SIZE)
	movl	$0, -8(%rbp)	#, si
# main.c:92:         for (int si = 0; si < N; si += BLOCK_SIZE)
	jmp	.L41	#
.L44:
# main.c:93:             for (int sk = 0; sk < M; sk += BLOCK_SIZE)
	movl	$0, -4(%rbp)	#, sk
# main.c:93:             for (int sk = 0; sk < M; sk += BLOCK_SIZE)
	jmp	.L42	#
.L43:
# main.c:94:                 do_block(si, sj, sk, A, B, C);
	movq	-40(%rbp), %r8	# C, tmp82
	movq	-32(%rbp), %rdi	# B, tmp83
	movq	-24(%rbp), %rcx	# A, tmp84
	movl	-4(%rbp), %edx	# sk, tmp85
	movl	-12(%rbp), %esi	# sj, tmp86
	movl	-8(%rbp), %eax	# si, tmp87
	movq	%r8, %r9	# tmp82,
	movq	%rdi, %r8	# tmp83,
	movl	%eax, %edi	# tmp87,
	call	do_block	#
# main.c:93:             for (int sk = 0; sk < M; sk += BLOCK_SIZE)
	addl	$32, -4(%rbp)	#, sk
.L42:
# main.c:93:             for (int sk = 0; sk < M; sk += BLOCK_SIZE)
	movl	-4(%rbp), %eax	# sk, tmp88
	cmpl	-48(%rbp), %eax	# M, tmp88
	jl	.L43	#,
# main.c:92:         for (int si = 0; si < N; si += BLOCK_SIZE)
	addl	$32, -8(%rbp)	#, si
.L41:
# main.c:92:         for (int si = 0; si < N; si += BLOCK_SIZE)
	movl	-8(%rbp), %eax	# si, tmp89
	cmpl	-52(%rbp), %eax	# N, tmp89
	jl	.L44	#,
# main.c:91:     for (int sj = 0; sj < L; sj += BLOCK_SIZE)
	addl	$32, -12(%rbp)	#, sj
.L40:
# main.c:91:     for (int sj = 0; sj < L; sj += BLOCK_SIZE)
	movl	-12(%rbp), %eax	# sj, tmp90
	cmpl	-44(%rbp), %eax	# L, tmp90
	jl	.L45	#,
# main.c:95: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5046:
	.size	blocked_matrix_multiply, .-blocked_matrix_multiply
	.globl	subword_parallelism_matrix_multiply
	.type	subword_parallelism_matrix_multiply, @function
subword_parallelism_matrix_multiply:
.LFB5047:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	andq	$-32, %rsp	#,
	subq	$168, %rsp	#,
	movq	%rdi, -80(%rsp)	# A, A
	movq	%rsi, -88(%rsp)	# B, B
	movq	%rdx, -96(%rsp)	# C, C
	movl	%ecx, -100(%rsp)	# L, L
	movl	%r8d, -104(%rsp)	# M, M
	movl	%r9d, -108(%rsp)	# N, N
# main.c:99:     for (int i = 0; i < L; i++) {
	movl	$0, -68(%rsp)	#, i
# main.c:99:     for (int i = 0; i < L; i++) {
	jmp	.L47	#
.L57:
# main.c:100:         for (int j = 0; j < N; j += MM256_STRIDE) {
	movl	$0, -64(%rsp)	#, j
# main.c:100:         for (int j = 0; j < N; j += MM256_STRIDE) {
	jmp	.L48	#
.L56:
# main.c:101:             __m256d c0 = _mm256_load_pd(&C[i][j]);
	movl	-68(%rsp), %eax	# i, tmp115
	cltq
	leaq	0(,%rax,8), %rdx	#, _2
	movq	-96(%rsp), %rax	# C, tmp116
	addq	%rdx, %rax	# _2, _3
	movq	(%rax), %rax	# *_3, _4
# main.c:101:             __m256d c0 = _mm256_load_pd(&C[i][j]);
	movl	-64(%rsp), %edx	# j, tmp117
	movslq	%edx, %rdx	# tmp117, _5
	salq	$3, %rdx	#, _6
# main.c:101:             __m256d c0 = _mm256_load_pd(&C[i][j]);
	addq	%rdx, %rax	# _6, _7
	movq	%rax, -56(%rsp)	# _7, __P
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	movq	-56(%rsp), %rax	# __P, tmp118
	vmovapd	(%rax), %ymm0	# MEM[(__m256d * {ref-all})__P_54], D.31803
# main.c:101:             __m256d c0 = _mm256_load_pd(&C[i][j]);
	vmovapd	%ymm0, -24(%rsp)	# D.31803, c0
# main.c:102:             for (int k = 0; k < M; k++) {
	movl	$0, -60(%rsp)	#, k
# main.c:102:             for (int k = 0; k < M; k++) {
	jmp	.L50	#
.L55:
# main.c:105:                                    _mm256_broadcast_sd(&A[i][k])));
	movl	-68(%rsp), %eax	# i, tmp119
	cltq
	leaq	0(,%rax,8), %rdx	#, _9
	movq	-80(%rsp), %rax	# A, tmp120
	addq	%rdx, %rax	# _9, _10
	movq	(%rax), %rax	# *_10, _11
# main.c:105:                                    _mm256_broadcast_sd(&A[i][k])));
	movl	-60(%rsp), %edx	# k, tmp121
	movslq	%edx, %rdx	# tmp121, _12
	salq	$3, %rdx	#, _13
# main.c:105:                                    _mm256_broadcast_sd(&A[i][k])));
	addq	%rdx, %rax	# _13, _14
	movq	%rax, -40(%rsp)	# _14, __X
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:736:   return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
	movq	-40(%rsp), %rax	# __X, tmp122
	vbroadcastsd	(%rax), %ymm0	#, D.31821
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:736:   return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
	nop	
# main.c:104:                      _mm256_mul_pd(_mm256_load_pd(&B[k][j]),
	movl	-60(%rsp), %eax	# k, tmp123
	cltq
	leaq	0(,%rax,8), %rdx	#, _17
	movq	-88(%rsp), %rax	# B, tmp124
	addq	%rdx, %rax	# _17, _18
	movq	(%rax), %rax	# *_18, _19
# main.c:104:                      _mm256_mul_pd(_mm256_load_pd(&B[k][j]),
	movl	-64(%rsp), %edx	# j, tmp125
	movslq	%edx, %rdx	# tmp125, _20
	salq	$3, %rdx	#, _21
# main.c:104:                      _mm256_mul_pd(_mm256_load_pd(&B[k][j]),
	addq	%rdx, %rax	# _21, _22
	movq	%rax, -48(%rsp)	# _22, __P
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	movq	-48(%rsp), %rax	# __P, tmp126
	vmovapd	(%rax), %ymm1	# MEM[(__m256d * {ref-all})__P_62], D.31817
	vmovapd	%ymm1, 72(%rsp)	# D.31817, __A
	vmovapd	%ymm0, 104(%rsp)	# D.31821, __B
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:314:   return (__m256d) ((__v4df)__A * (__v4df)__B);
	vmovapd	72(%rsp), %ymm0	# __A, tmp127
	vmulpd	104(%rsp), %ymm0, %ymm0	# __B, tmp127, D.31813
	vmovapd	-24(%rsp), %ymm1	# c0, tmp128
	vmovapd	%ymm1, 8(%rsp)	# tmp128, __A
	vmovapd	%ymm0, 40(%rsp)	# D.31813, __B
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:143:   return (__m256d) ((__v4df)__A + (__v4df)__B);
	vmovapd	8(%rsp), %ymm0	# __A, tmp129
	vaddpd	40(%rsp), %ymm0, %ymm0	# __B, tmp129, D.31808
# main.c:103:                 c0 = _mm256_add_pd(c0,
	vmovapd	%ymm0, -24(%rsp)	# D.31808, c0
# main.c:102:             for (int k = 0; k < M; k++) {
	addl	$1, -60(%rsp)	#, k
.L50:
# main.c:102:             for (int k = 0; k < M; k++) {
	movl	-60(%rsp), %eax	# k, tmp130
	cmpl	-104(%rsp), %eax	# M, tmp130
	jl	.L55	#,
# main.c:107:             _mm256_store_pd(&C[i][j], c0);
	movl	-68(%rsp), %eax	# i, tmp131
	cltq
	leaq	0(,%rax,8), %rdx	#, _26
	movq	-96(%rsp), %rax	# C, tmp132
	addq	%rdx, %rax	# _26, _27
	movq	(%rax), %rax	# *_27, _28
# main.c:107:             _mm256_store_pd(&C[i][j], c0);
	movl	-64(%rsp), %edx	# j, tmp133
	movslq	%edx, %rdx	# tmp133, _29
	salq	$3, %rdx	#, _30
# main.c:107:             _mm256_store_pd(&C[i][j], c0);
	addq	%rdx, %rax	# _30, _31
	movq	%rax, -32(%rsp)	# _31, __P
	vmovapd	-24(%rsp), %ymm0	# c0, tmp134
	vmovapd	%ymm0, 136(%rsp)	# tmp134, __A
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:875:   *(__m256d *)__P = __A;
	movq	-32(%rsp), %rax	# __P, tmp135
	vmovapd	136(%rsp), %ymm0	# __A, tmp136
	vmovapd	%ymm0, (%rax)	# tmp136, MEM[(__m256d * {ref-all})__P_66]
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:876: }
	nop	
# main.c:100:         for (int j = 0; j < N; j += MM256_STRIDE) {
	addl	$4, -64(%rsp)	#, j
.L48:
# main.c:100:         for (int j = 0; j < N; j += MM256_STRIDE) {
	movl	-64(%rsp), %eax	# j, tmp137
	cmpl	-108(%rsp), %eax	# N, tmp137
	jl	.L56	#,
# main.c:99:     for (int i = 0; i < L; i++) {
	addl	$1, -68(%rsp)	#, i
.L47:
# main.c:99:     for (int i = 0; i < L; i++) {
	movl	-68(%rsp), %eax	# i, tmp138
	cmpl	-100(%rsp), %eax	# L, tmp138
	jl	.L57	#,
# main.c:110: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5047:
	.size	subword_parallelism_matrix_multiply, .-subword_parallelism_matrix_multiply
	.globl	combined_matrix_multiply
	.type	combined_matrix_multiply, @function
combined_matrix_multiply:
.LFB5048:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$96, %rsp	#,
	movq	%rdi, -56(%rbp)	# A, A
	movq	%rsi, -64(%rbp)	# B, B
	movq	%rdx, -72(%rbp)	# C, C
	movl	%ecx, -76(%rbp)	# L, L
	movl	%r8d, -80(%rbp)	# M, M
	movl	%r9d, -84(%rbp)	# N, N
# main.c:113: void combined_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp90
	movq	%rax, -8(%rbp)	# tmp90, D.31833
	xorl	%eax, %eax	# tmp90
# main.c:114:     #pragma omp parallel for schedule(dynamic)
	movl	-84(%rbp), %eax	# N, tmp82
	movl	%eax, -16(%rbp)	# tmp82, MEM[(struct .omp_data_s.5 *)_16].N
	movl	-80(%rbp), %eax	# M, tmp83
	movl	%eax, -20(%rbp)	# tmp83, MEM[(struct .omp_data_s.5 *)_16].M
	movl	-76(%rbp), %eax	# L, tmp84
	movl	%eax, -24(%rbp)	# tmp84, MEM[(struct .omp_data_s.5 *)_16].L
	movq	-72(%rbp), %rax	# C, tmp85
	movq	%rax, -32(%rbp)	# tmp85, MEM[(struct .omp_data_s.5 *)_16].C
	movq	-64(%rbp), %rax	# B, tmp86
	movq	%rax, -40(%rbp)	# tmp86, MEM[(struct .omp_data_s.5 *)_16].B
	movq	-56(%rbp), %rax	# A, tmp87
	movq	%rax, -48(%rbp)	# tmp87, MEM[(struct .omp_data_s.5 *)_16].A
	leaq	-48(%rbp), %rax	#, tmp88
	movl	$0, %ecx	#,
	movl	$0, %edx	#,
	movq	%rax, %rsi	# tmp88,
	leaq	combined_matrix_multiply._omp_fn.0(%rip), %rax	#, tmp89
	movq	%rax, %rdi	# tmp89,
	call	GOMP_parallel@PLT	#
# main.c:140: }
	nop	
	movq	-8(%rbp), %rax	# D.31833, tmp91
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp91
	je	.L59	#,
	call	__stack_chk_fail@PLT	#
.L59:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5048:
	.size	combined_matrix_multiply, .-combined_matrix_multiply
	.globl	free_matrices
	.type	free_matrices, @function
free_matrices:
.LFB5049:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	movq	%rdi, -24(%rbp)	# A, A
	movq	%rsi, -32(%rbp)	# B, B
	movq	%rdx, -40(%rbp)	# C, C
	movl	%ecx, -44(%rbp)	# L, L
	movl	%r8d, -48(%rbp)	# M, M
	movl	%r9d, -52(%rbp)	# N, N
# main.c:143:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	movl	$0, -8(%rbp)	#, i
# main.c:143:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	jmp	.L61	#
.L62:
# main.c:143:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	movl	-8(%rbp), %eax	# i, tmp94
	cltq
	leaq	0(,%rax,8), %rdx	#, _2
	movq	-24(%rbp), %rax	# A, tmp95
	addq	%rdx, %rax	# _2, _3
# main.c:143:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	movq	(%rax), %rax	# *_3, _4
	movq	%rax, %rdi	# _4,
	call	free@PLT	#
# main.c:143:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	movl	-8(%rbp), %eax	# i, tmp96
	cltq
	leaq	0(,%rax,8), %rdx	#, _6
	movq	-40(%rbp), %rax	# C, tmp97
	addq	%rdx, %rax	# _6, _7
# main.c:143:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	movq	(%rax), %rax	# *_7, _8
	movq	%rax, %rdi	# _8,
	call	free@PLT	#
# main.c:143:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	addl	$1, -8(%rbp)	#, i
.L61:
# main.c:143:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	movl	-8(%rbp), %eax	# i, tmp98
	cmpl	-44(%rbp), %eax	# L, tmp98
	jl	.L62	#,
# main.c:144:     for (int i = 0; i < M; i++)   free(B[i]);
	movl	$0, -4(%rbp)	#, i
# main.c:144:     for (int i = 0; i < M; i++)   free(B[i]);
	jmp	.L63	#
.L64:
# main.c:144:     for (int i = 0; i < M; i++)   free(B[i]);
	movl	-4(%rbp), %eax	# i, tmp99
	cltq
	leaq	0(,%rax,8), %rdx	#, _10
	movq	-32(%rbp), %rax	# B, tmp100
	addq	%rdx, %rax	# _10, _11
# main.c:144:     for (int i = 0; i < M; i++)   free(B[i]);
	movq	(%rax), %rax	# *_11, _12
	movq	%rax, %rdi	# _12,
	call	free@PLT	#
# main.c:144:     for (int i = 0; i < M; i++)   free(B[i]);
	addl	$1, -4(%rbp)	#, i
.L63:
# main.c:144:     for (int i = 0; i < M; i++)   free(B[i]);
	movl	-4(%rbp), %eax	# i, tmp101
	cmpl	-48(%rbp), %eax	# M, tmp101
	jl	.L64	#,
# main.c:145:     free(A); free(B); free(C);
	movq	-24(%rbp), %rax	# A, tmp102
	movq	%rax, %rdi	# tmp102,
	call	free@PLT	#
# main.c:145:     free(A); free(B); free(C);
	movq	-32(%rbp), %rax	# B, tmp103
	movq	%rax, %rdi	# tmp103,
	call	free@PLT	#
# main.c:145:     free(A); free(B); free(C);
	movq	-40(%rbp), %rax	# C, tmp104
	movq	%rax, %rdi	# tmp104,
	call	free@PLT	#
# main.c:146: }
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5049:
	.size	free_matrices, .-free_matrices
	.section	.rodata
	.align 8
.LC4:
	.string	"ERROR: incorrect number of arguments"
.LC5:
	.string	"ERROR: invalid arguments"
.LC8:
	.string	"ERROR: unknown method %d\n"
	.align 8
.LC9:
	.string	"L = %d, M = %d, N = %d, METHOD = %d, EXEC TIME: %ld.%06ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5050:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$168, %rsp	#,
	.cfi_offset 3, -24
	movl	%edi, -164(%rbp)	# argc, argc
	movq	%rsi, -176(%rbp)	# argv, argv
# main.c:148: int main(int argc, char **argv) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp269
	movq	%rax, -24(%rbp)	# tmp269, D.31834
	xorl	%eax, %eax	# tmp269
# main.c:153:     if (argc != 6) {
	cmpl	$6, -164(%rbp)	#, argc
	je	.L66	#,
# main.c:154:         printf("ERROR: incorrect number of arguments\n");
	leaq	.LC4(%rip), %rax	#, tmp155
	movq	%rax, %rdi	# tmp155,
	call	puts@PLT	#
# main.c:155:         print_help_and_exit(argv);
	movq	-176(%rbp), %rax	# argv, tmp156
	movq	%rax, %rdi	# tmp156,
	call	print_help_and_exit	#
.L66:
# main.c:158:     L      = atoi(argv[1]);
	movq	-176(%rbp), %rax	# argv, tmp157
	addq	$8, %rax	#, _1
# main.c:158:     L      = atoi(argv[1]);
	movq	(%rax), %rax	# *_1, _2
	movq	%rax, %rdi	# _2,
	call	atoi@PLT	#
	movl	%eax, -124(%rbp)	# tmp158, L
# main.c:159:     M      = atoi(argv[2]);
	movq	-176(%rbp), %rax	# argv, tmp159
	addq	$16, %rax	#, _3
# main.c:159:     M      = atoi(argv[2]);
	movq	(%rax), %rax	# *_3, _4
	movq	%rax, %rdi	# _4,
	call	atoi@PLT	#
	movl	%eax, -120(%rbp)	# tmp160, M
# main.c:160:     N      = atoi(argv[3]);
	movq	-176(%rbp), %rax	# argv, tmp161
	addq	$24, %rax	#, _5
# main.c:160:     N      = atoi(argv[3]);
	movq	(%rax), %rax	# *_5, _6
	movq	%rax, %rdi	# _6,
	call	atoi@PLT	#
	movl	%eax, -116(%rbp)	# tmp162, N
# main.c:161:     seed   = atoi(argv[4]);
	movq	-176(%rbp), %rax	# argv, tmp163
	addq	$32, %rax	#, _7
# main.c:161:     seed   = atoi(argv[4]);
	movq	(%rax), %rax	# *_7, _8
	movq	%rax, %rdi	# _8,
	call	atoi@PLT	#
	movl	%eax, -112(%rbp)	# tmp164, seed
# main.c:162:     method = atoi(argv[5]);
	movq	-176(%rbp), %rax	# argv, tmp165
	addq	$40, %rax	#, _9
# main.c:162:     method = atoi(argv[5]);
	movq	(%rax), %rax	# *_9, _10
	movq	%rax, %rdi	# _10,
	call	atoi@PLT	#
	movl	%eax, -108(%rbp)	# tmp166, method
# main.c:163:     srand(seed);
	movl	-112(%rbp), %eax	# seed, seed.12_11
	movl	%eax, %edi	# seed.12_11,
	call	srand@PLT	#
# main.c:165:     if (!L || !M || !N) {
	cmpl	$0, -124(%rbp)	#, L
	je	.L67	#,
# main.c:165:     if (!L || !M || !N) {
	cmpl	$0, -120(%rbp)	#, M
	je	.L67	#,
# main.c:165:     if (!L || !M || !N) {
	cmpl	$0, -116(%rbp)	#, N
	jne	.L68	#,
.L67:
# main.c:166:         printf("ERROR: invalid arguments\n");
	leaq	.LC5(%rip), %rax	#, tmp167
	movq	%rax, %rdi	# tmp167,
	call	puts@PLT	#
# main.c:167:         print_help_and_exit(argv);
	movq	-176(%rbp), %rax	# argv, tmp168
	movq	%rax, %rdi	# tmp168,
	call	print_help_and_exit	#
.L68:
# main.c:170:     omp_set_num_threads(OMP_THREADS);
	movl	$4, %edi	#,
	call	omp_set_num_threads@PLT	#
# main.c:173:     A = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movl	-124(%rbp), %eax	# L, tmp169
	cltq
	salq	$3, %rax	#, _13
	movq	%rax, %rsi	# _13,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, -104(%rbp)	# tmp170, A
# main.c:174:     for (int i = 0; i < L; i++)
	movl	$0, -156(%rbp)	#, i
# main.c:174:     for (int i = 0; i < L; i++)
	jmp	.L69	#
.L70:
# main.c:175:         A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
	movl	-120(%rbp), %eax	# M, tmp171
	cltq
	salq	$3, %rax	#, _15
# main.c:175:         A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
	movl	-156(%rbp), %edx	# i, tmp172
	movslq	%edx, %rdx	# tmp172, _16
	leaq	0(,%rdx,8), %rcx	#, _17
	movq	-104(%rbp), %rdx	# A, tmp173
	leaq	(%rcx,%rdx), %rbx	#, _18
# main.c:175:         A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
	movq	%rax, %rsi	# _15,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
# main.c:175:         A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
	movq	%rax, (%rbx)	# _19, *_18
# main.c:174:     for (int i = 0; i < L; i++)
	addl	$1, -156(%rbp)	#, i
.L69:
# main.c:174:     for (int i = 0; i < L; i++)
	movl	-156(%rbp), %eax	# i, tmp175
	cmpl	-124(%rbp), %eax	# L, tmp175
	jl	.L70	#,
# main.c:178:     B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
	movl	-120(%rbp), %eax	# M, tmp176
	cltq
	salq	$3, %rax	#, _21
	movq	%rax, %rsi	# _21,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, -96(%rbp)	# tmp177, B
# main.c:179:     for (int i = 0; i < M; i++)
	movl	$0, -152(%rbp)	#, i
# main.c:179:     for (int i = 0; i < M; i++)
	jmp	.L71	#
.L72:
# main.c:180:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movl	-116(%rbp), %eax	# N, tmp178
	cltq
	salq	$3, %rax	#, _23
# main.c:180:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movl	-152(%rbp), %edx	# i, tmp179
	movslq	%edx, %rdx	# tmp179, _24
	leaq	0(,%rdx,8), %rcx	#, _25
	movq	-96(%rbp), %rdx	# B, tmp180
	leaq	(%rcx,%rdx), %rbx	#, _26
# main.c:180:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, %rsi	# _23,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
# main.c:180:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, (%rbx)	# _27, *_26
# main.c:179:     for (int i = 0; i < M; i++)
	addl	$1, -152(%rbp)	#, i
.L71:
# main.c:179:     for (int i = 0; i < M; i++)
	movl	-152(%rbp), %eax	# i, tmp182
	cmpl	-120(%rbp), %eax	# M, tmp182
	jl	.L72	#,
# main.c:182:     for (int i = 0; i < L; i++)
	movl	$0, -148(%rbp)	#, i
# main.c:182:     for (int i = 0; i < L; i++)
	jmp	.L73	#
.L76:
# main.c:183:         for (int j = 0; j < M; j++)
	movl	$0, -144(%rbp)	#, j
# main.c:183:         for (int j = 0; j < M; j++)
	jmp	.L74	#
.L75:
# main.c:184:             A[i][j] = drand(MIN, MAX);
	movl	-148(%rbp), %eax	# i, tmp183
	cltq
	leaq	0(,%rax,8), %rdx	#, _29
	movq	-104(%rbp), %rax	# A, tmp184
	addq	%rdx, %rax	# _29, _30
	movq	(%rax), %rax	# *_30, _31
# main.c:184:             A[i][j] = drand(MIN, MAX);
	movl	-144(%rbp), %edx	# j, tmp185
	movslq	%edx, %rdx	# tmp185, _32
	salq	$3, %rdx	#, _33
	leaq	(%rax,%rdx), %rbx	#, _34
# main.c:184:             A[i][j] = drand(MIN, MAX);
	vmovsd	.LC6(%rip), %xmm0	#, tmp186
	vmovsd	%xmm0, %xmm0, %xmm1	# tmp186,
	movq	.LC7(%rip), %rax	#, tmp187
	vmovq	%rax, %xmm0	# tmp187,
	call	drand	#
	vmovq	%xmm0, %rax	#, _35
# main.c:184:             A[i][j] = drand(MIN, MAX);
	movq	%rax, (%rbx)	# _35, *_34
# main.c:183:         for (int j = 0; j < M; j++)
	addl	$1, -144(%rbp)	#, j
.L74:
# main.c:183:         for (int j = 0; j < M; j++)
	movl	-144(%rbp), %eax	# j, tmp188
	cmpl	-120(%rbp), %eax	# M, tmp188
	jl	.L75	#,
# main.c:182:     for (int i = 0; i < L; i++)
	addl	$1, -148(%rbp)	#, i
.L73:
# main.c:182:     for (int i = 0; i < L; i++)
	movl	-148(%rbp), %eax	# i, tmp189
	cmpl	-124(%rbp), %eax	# L, tmp189
	jl	.L76	#,
# main.c:185:     for (int i = 0; i < M; i++)
	movl	$0, -140(%rbp)	#, i
# main.c:185:     for (int i = 0; i < M; i++)
	jmp	.L77	#
.L80:
# main.c:186:         for (int j = 0; j < N; j++)
	movl	$0, -136(%rbp)	#, j
# main.c:186:         for (int j = 0; j < N; j++)
	jmp	.L78	#
.L79:
# main.c:187:             B[i][j] = drand(MIN, MAX);
	movl	-140(%rbp), %eax	# i, tmp190
	cltq
	leaq	0(,%rax,8), %rdx	#, _37
	movq	-96(%rbp), %rax	# B, tmp191
	addq	%rdx, %rax	# _37, _38
	movq	(%rax), %rax	# *_38, _39
# main.c:187:             B[i][j] = drand(MIN, MAX);
	movl	-136(%rbp), %edx	# j, tmp192
	movslq	%edx, %rdx	# tmp192, _40
	salq	$3, %rdx	#, _41
	leaq	(%rax,%rdx), %rbx	#, _42
# main.c:187:             B[i][j] = drand(MIN, MAX);
	vmovsd	.LC6(%rip), %xmm0	#, tmp193
	vmovsd	%xmm0, %xmm0, %xmm1	# tmp193,
	movq	.LC7(%rip), %rax	#, tmp194
	vmovq	%rax, %xmm0	# tmp194,
	call	drand	#
	vmovq	%xmm0, %rax	#, _43
# main.c:187:             B[i][j] = drand(MIN, MAX);
	movq	%rax, (%rbx)	# _43, *_42
# main.c:186:         for (int j = 0; j < N; j++)
	addl	$1, -136(%rbp)	#, j
.L78:
# main.c:186:         for (int j = 0; j < N; j++)
	movl	-136(%rbp), %eax	# j, tmp195
	cmpl	-116(%rbp), %eax	# N, tmp195
	jl	.L79	#,
# main.c:185:     for (int i = 0; i < M; i++)
	addl	$1, -140(%rbp)	#, i
.L77:
# main.c:185:     for (int i = 0; i < M; i++)
	movl	-140(%rbp), %eax	# i, tmp196
	cmpl	-120(%rbp), %eax	# M, tmp196
	jl	.L80	#,
# main.c:190:     C = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movl	-124(%rbp), %eax	# L, tmp197
	cltq
	salq	$3, %rax	#, _45
	movq	%rax, %rsi	# _45,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, -88(%rbp)	# tmp198, C
# main.c:191:     for (int i = 0; i < L; i++) {
	movl	$0, -132(%rbp)	#, i
# main.c:191:     for (int i = 0; i < L; i++) {
	jmp	.L81	#
.L84:
# main.c:192:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movl	-116(%rbp), %eax	# N, tmp199
	cltq
	salq	$3, %rax	#, _47
# main.c:192:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movl	-132(%rbp), %edx	# i, tmp200
	movslq	%edx, %rdx	# tmp200, _48
	leaq	0(,%rdx,8), %rcx	#, _49
	movq	-88(%rbp), %rdx	# C, tmp201
	leaq	(%rcx,%rdx), %rbx	#, _50
# main.c:192:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, %rsi	# _47,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
# main.c:192:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, (%rbx)	# _51, *_50
# main.c:193:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	movl	$0, -128(%rbp)	#, j
# main.c:193:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	jmp	.L82	#
.L83:
# main.c:193:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	movl	-132(%rbp), %eax	# i, tmp203
	cltq
	leaq	0(,%rax,8), %rdx	#, _53
	movq	-88(%rbp), %rax	# C, tmp204
	addq	%rdx, %rax	# _53, _54
	movq	(%rax), %rax	# *_54, _55
# main.c:193:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	movl	-128(%rbp), %edx	# j, tmp205
	movslq	%edx, %rdx	# tmp205, _56
	salq	$3, %rdx	#, _57
	addq	%rdx, %rax	# _57, _58
# main.c:193:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp206
	vmovsd	%xmm0, (%rax)	# tmp206, *_58
# main.c:193:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	addl	$1, -128(%rbp)	#, j
.L82:
# main.c:193:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	movl	-128(%rbp), %eax	# j, tmp207
	cmpl	-116(%rbp), %eax	# N, tmp207
	jl	.L83	#,
# main.c:191:     for (int i = 0; i < L; i++) {
	addl	$1, -132(%rbp)	#, i
.L81:
# main.c:191:     for (int i = 0; i < L; i++) {
	movl	-132(%rbp), %eax	# i, tmp208
	cmpl	-124(%rbp), %eax	# L, tmp208
	jl	.L84	#,
# main.c:202:     gettimeofday(&start, NULL);
	leaq	-80(%rbp), %rax	#, tmp209
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp209,
	call	gettimeofday@PLT	#
# main.c:204:     switch (method) {
	cmpl	$5, -108(%rbp)	#, method
	ja	.L85	#,
	movl	-108(%rbp), %eax	# method, tmp210
	leaq	0(,%rax,4), %rdx	#, tmp211
	leaq	.L87(%rip), %rax	#, tmp212
	movl	(%rdx,%rax), %eax	#, tmp213
	cltq
	leaq	.L87(%rip), %rdx	#, tmp216
	addq	%rdx, %rax	# tmp216, tmp215
	notrack jmp	*%rax	# tmp215
	.section	.rodata
	.align 4
	.align 4
.L87:
	.long	.L92-.L87
	.long	.L91-.L87
	.long	.L90-.L87
	.long	.L89-.L87
	.long	.L88-.L87
	.long	.L86-.L87
	.text
.L92:
# main.c:205:         case METHOD_BASELINE:  matrix_multiply(A, B, C, L, M, N);                    break;
	movl	-116(%rbp), %r8d	# N, tmp217
	movl	-120(%rbp), %edi	# M, tmp218
	movl	-124(%rbp), %ecx	# L, tmp219
	movq	-88(%rbp), %rdx	# C, tmp220
	movq	-96(%rbp), %rsi	# B, tmp221
	movq	-104(%rbp), %rax	# A, tmp222
	movl	%r8d, %r9d	# tmp217,
	movl	%edi, %r8d	# tmp218,
	movq	%rax, %rdi	# tmp222,
	call	matrix_multiply	#
# main.c:205:         case METHOD_BASELINE:  matrix_multiply(A, B, C, L, M, N);                    break;
	jmp	.L93	#
.L91:
# main.c:206:         case METHOD_UNROLLED:  unrolled_matrix_multiply(A, B, C, L, M, N);            break;
	movl	-116(%rbp), %r8d	# N, tmp223
	movl	-120(%rbp), %edi	# M, tmp224
	movl	-124(%rbp), %ecx	# L, tmp225
	movq	-88(%rbp), %rdx	# C, tmp226
	movq	-96(%rbp), %rsi	# B, tmp227
	movq	-104(%rbp), %rax	# A, tmp228
	movl	%r8d, %r9d	# tmp223,
	movl	%edi, %r8d	# tmp224,
	movq	%rax, %rdi	# tmp228,
	call	unrolled_matrix_multiply	#
# main.c:206:         case METHOD_UNROLLED:  unrolled_matrix_multiply(A, B, C, L, M, N);            break;
	jmp	.L93	#
.L90:
# main.c:207:         case METHOD_MULTICORE: multicore_matrix_multiply(A, B, C, L, M, N);           break;
	movl	-116(%rbp), %r8d	# N, tmp229
	movl	-120(%rbp), %edi	# M, tmp230
	movl	-124(%rbp), %ecx	# L, tmp231
	movq	-88(%rbp), %rdx	# C, tmp232
	movq	-96(%rbp), %rsi	# B, tmp233
	movq	-104(%rbp), %rax	# A, tmp234
	movl	%r8d, %r9d	# tmp229,
	movl	%edi, %r8d	# tmp230,
	movq	%rax, %rdi	# tmp234,
	call	multicore_matrix_multiply	#
# main.c:207:         case METHOD_MULTICORE: multicore_matrix_multiply(A, B, C, L, M, N);           break;
	jmp	.L93	#
.L89:
# main.c:208:         case METHOD_BLOCKED:   blocked_matrix_multiply(A, B, C, L, M, N);             break;
	movl	-116(%rbp), %r8d	# N, tmp235
	movl	-120(%rbp), %edi	# M, tmp236
	movl	-124(%rbp), %ecx	# L, tmp237
	movq	-88(%rbp), %rdx	# C, tmp238
	movq	-96(%rbp), %rsi	# B, tmp239
	movq	-104(%rbp), %rax	# A, tmp240
	movl	%r8d, %r9d	# tmp235,
	movl	%edi, %r8d	# tmp236,
	movq	%rax, %rdi	# tmp240,
	call	blocked_matrix_multiply	#
# main.c:208:         case METHOD_BLOCKED:   blocked_matrix_multiply(A, B, C, L, M, N);             break;
	jmp	.L93	#
.L88:
# main.c:209:         case METHOD_SIMD:      subword_parallelism_matrix_multiply(A, B, C, L, M, N); break;
	movl	-116(%rbp), %r8d	# N, tmp241
	movl	-120(%rbp), %edi	# M, tmp242
	movl	-124(%rbp), %ecx	# L, tmp243
	movq	-88(%rbp), %rdx	# C, tmp244
	movq	-96(%rbp), %rsi	# B, tmp245
	movq	-104(%rbp), %rax	# A, tmp246
	movl	%r8d, %r9d	# tmp241,
	movl	%edi, %r8d	# tmp242,
	movq	%rax, %rdi	# tmp246,
	call	subword_parallelism_matrix_multiply	#
# main.c:209:         case METHOD_SIMD:      subword_parallelism_matrix_multiply(A, B, C, L, M, N); break;
	jmp	.L93	#
.L86:
# main.c:210:         case METHOD_COMBINED:  combined_matrix_multiply(A, B, C, L, M, N);            break;
	movl	-116(%rbp), %r8d	# N, tmp247
	movl	-120(%rbp), %edi	# M, tmp248
	movl	-124(%rbp), %ecx	# L, tmp249
	movq	-88(%rbp), %rdx	# C, tmp250
	movq	-96(%rbp), %rsi	# B, tmp251
	movq	-104(%rbp), %rax	# A, tmp252
	movl	%r8d, %r9d	# tmp247,
	movl	%edi, %r8d	# tmp248,
	movq	%rax, %rdi	# tmp252,
	call	combined_matrix_multiply	#
# main.c:210:         case METHOD_COMBINED:  combined_matrix_multiply(A, B, C, L, M, N);            break;
	jmp	.L93	#
.L85:
# main.c:212:             printf("ERROR: unknown method %d\n", method);
	movl	-108(%rbp), %eax	# method, tmp253
	movl	%eax, %esi	# tmp253,
	leaq	.LC8(%rip), %rax	#, tmp254
	movq	%rax, %rdi	# tmp254,
	movl	$0, %eax	#,
	call	printf@PLT	#
# main.c:213:             print_help_and_exit(argv);
	movq	-176(%rbp), %rax	# argv, tmp255
	movq	%rax, %rdi	# tmp255,
	call	print_help_and_exit	#
.L93:
# main.c:216:     gettimeofday(&stop, NULL);
	leaq	-64(%rbp), %rax	#, tmp256
	movl	$0, %esi	#,
	movq	%rax, %rdi	# tmp256,
	call	gettimeofday@PLT	#
# main.c:217:     timersub(&stop, &start, &total);
	movq	-64(%rbp), %rdx	# stop.tv_sec, _59
	movq	-80(%rbp), %rax	# start.tv_sec, _60
	subq	%rax, %rdx	# _60, _61
	movq	%rdx, -48(%rbp)	# _61, total.tv_sec
	movq	-56(%rbp), %rdx	# stop.tv_usec, _62
	movq	-72(%rbp), %rax	# start.tv_usec, _63
	subq	%rax, %rdx	# _63, _64
	movq	%rdx, -40(%rbp)	# _64, total.tv_usec
	movq	-40(%rbp), %rax	# total.tv_usec, _65
	testq	%rax, %rax	# _65
	jns	.L94	#,
# main.c:217:     timersub(&stop, &start, &total);
	movq	-48(%rbp), %rax	# total.tv_sec, _66
	subq	$1, %rax	#, _67
	movq	%rax, -48(%rbp)	# _67, total.tv_sec
	movq	-40(%rbp), %rax	# total.tv_usec, _68
	addq	$1000000, %rax	#, _69
	movq	%rax, -40(%rbp)	# _69, total.tv_usec
.L94:
# main.c:221:     printf("L = %d, M = %d, N = %d, METHOD = %d, EXEC TIME: %ld.%06ld\n",
	movq	-40(%rbp), %rsi	# total.tv_usec, _70
	movq	-48(%rbp), %r8	# total.tv_sec, _71
	movl	-108(%rbp), %edi	# method, tmp257
	movl	-116(%rbp), %ecx	# N, tmp258
	movl	-120(%rbp), %edx	# M, tmp259
	movl	-124(%rbp), %eax	# L, tmp260
	subq	$8, %rsp	#,
	pushq	%rsi	# _70
	movq	%r8, %r9	# _71,
	movl	%edi, %r8d	# tmp257,
	movl	%eax, %esi	# tmp260,
	leaq	.LC9(%rip), %rax	#, tmp261
	movq	%rax, %rdi	# tmp261,
	movl	$0, %eax	#,
	call	printf@PLT	#
	addq	$16, %rsp	#,
# main.c:224:     free_matrices(A, B, C, L, M, N);
	movl	-116(%rbp), %r8d	# N, tmp262
	movl	-120(%rbp), %edi	# M, tmp263
	movl	-124(%rbp), %ecx	# L, tmp264
	movq	-88(%rbp), %rdx	# C, tmp265
	movq	-96(%rbp), %rsi	# B, tmp266
	movq	-104(%rbp), %rax	# A, tmp267
	movl	%r8d, %r9d	# tmp262,
	movl	%edi, %r8d	# tmp263,
	movq	%rax, %rdi	# tmp267,
	call	free_matrices	#
# main.c:225:     return 0;
	movl	$0, %eax	#, _133
# main.c:226: }
	movq	-24(%rbp), %rdx	# D.31834, tmp270
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp270
	je	.L96	#,
	call	__stack_chk_fail@PLT	#
.L96:
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5050:
	.size	main, .-main
	.type	multicore_matrix_multiply._omp_fn.0, @function
multicore_matrix_multiply._omp_fn.0:
.LFB5051:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r12	#
	pushq	%rbx	#
	subq	$64, %rsp	#,
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -72(%rbp)	# .omp_data_i, .omp_data_i
# main.c:70:     #pragma omp parallel for
	movq	-72(%rbp), %rax	# .omp_data_i, tmp123
	movl	32(%rax), %eax	# .omp_data_i_11(D)->N, tmp124
	movl	%eax, -52(%rbp)	# tmp124, N
	movq	-72(%rbp), %rax	# .omp_data_i, tmp125
	movl	28(%rax), %eax	# .omp_data_i_11(D)->M, tmp126
	movl	%eax, -48(%rbp)	# tmp126, M
	movq	-72(%rbp), %rax	# .omp_data_i, tmp127
	movl	24(%rax), %eax	# .omp_data_i_11(D)->L, tmp128
	movl	%eax, -44(%rbp)	# tmp128, L
	movq	-72(%rbp), %rax	# .omp_data_i, tmp129
	movq	16(%rax), %rax	# .omp_data_i_11(D)->C, tmp130
	movq	%rax, -40(%rbp)	# tmp130, C
	movq	-72(%rbp), %rax	# .omp_data_i, tmp131
	movq	8(%rax), %rax	# .omp_data_i_11(D)->B, tmp132
	movq	%rax, -32(%rbp)	# tmp132, B
	movq	-72(%rbp), %rax	# .omp_data_i, tmp133
	movq	(%rax), %rax	# .omp_data_i_11(D)->A, tmp134
	movq	%rax, -24(%rbp)	# tmp134, A
	movl	-44(%rbp), %ebx	# L, L.1_18
	call	omp_get_num_threads@PLT	#
	movl	%eax, %r12d	#, _19
	call	omp_get_thread_num@PLT	#
	movl	%eax, %esi	#, _20
	movl	%ebx, %eax	# L.1_18, tmp135
	cltd
	idivl	%r12d	# _19
	movl	%eax, %ecx	# tmp135, q.3_1
	movl	%ebx, %eax	# L.1_18, L.1_18
	cltd
	idivl	%r12d	# _19
	movl	%edx, %eax	# tmp137, tt.4_2
	cmpl	%eax, %esi	# tt.4_2, _20
	jl	.L98	#,
.L105:
	imull	%ecx, %esi	# q.3_1, _20
	movl	%esi, %edx	# _20, _25
	addl	%edx, %eax	# _25, _26
	leal	(%rax,%rcx), %edx	#, _27
	cmpl	%edx, %eax	# _27, _26
	jge	.L106	#,
	movl	%eax, -64(%rbp)	# _26, i
.L101:
# main.c:72:         for (int j = 0; j < N; j++)
	movl	$0, -60(%rbp)	#, j
# main.c:72:         for (int j = 0; j < N; j++)
	nop	
.L103:
# main.c:72:         for (int j = 0; j < N; j++)
	movl	-60(%rbp), %eax	# j, tmp139
	cmpl	-52(%rbp), %eax	# N, tmp139
	jl	.L100	#,
	addl	$1, -64(%rbp)	#, i
	cmpl	%edx, -64(%rbp)	# _27, i
	jl	.L101	#,
# main.c:70:     #pragma omp parallel for
	jmp	.L106	#
.L100:
# main.c:73:             for (int k = 0; k < M; k++)
	movl	$0, -56(%rbp)	#, k
# main.c:73:             for (int k = 0; k < M; k++)
	nop	
.L104:
# main.c:73:             for (int k = 0; k < M; k++)
	movl	-56(%rbp), %eax	# k, tmp140
	cmpl	-48(%rbp), %eax	# M, tmp140
	jl	.L102	#,
# main.c:72:         for (int j = 0; j < N; j++)
	addl	$1, -60(%rbp)	#, j
	jmp	.L103	#
.L102:
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	movl	-64(%rbp), %eax	# i, tmp141
	cltq
	leaq	0(,%rax,8), %rcx	#, _34
	movq	-40(%rbp), %rax	# C, tmp142
	addq	%rcx, %rax	# _34, _35
	movq	(%rax), %rax	# *_35, _36
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	movl	-60(%rbp), %ecx	# j, tmp143
	movslq	%ecx, %rcx	# tmp143, _37
	salq	$3, %rcx	#, _38
	addq	%rcx, %rax	# _38, _39
	vmovsd	(%rax), %xmm1	# *_39, _40
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	movl	-64(%rbp), %eax	# i, tmp144
	cltq
	leaq	0(,%rax,8), %rcx	#, _42
	movq	-24(%rbp), %rax	# A, tmp145
	addq	%rcx, %rax	# _42, _43
	movq	(%rax), %rax	# *_43, _44
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	movl	-56(%rbp), %ecx	# k, tmp146
	movslq	%ecx, %rcx	# tmp146, _45
	salq	$3, %rcx	#, _46
	addq	%rcx, %rax	# _46, _47
	vmovsd	(%rax), %xmm2	# *_47, _48
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	movl	-56(%rbp), %eax	# k, tmp147
	cltq
	leaq	0(,%rax,8), %rcx	#, _50
	movq	-32(%rbp), %rax	# B, tmp148
	addq	%rcx, %rax	# _50, _51
	movq	(%rax), %rax	# *_51, _52
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	movl	-60(%rbp), %ecx	# j, tmp149
	movslq	%ecx, %rcx	# tmp149, _53
	salq	$3, %rcx	#, _54
	addq	%rcx, %rax	# _54, _55
	vmovsd	(%rax), %xmm0	# *_55, _56
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	vmulsd	%xmm0, %xmm2, %xmm0	# _56, _48, _57
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	movl	-64(%rbp), %eax	# i, tmp150
	cltq
	leaq	0(,%rax,8), %rcx	#, _59
	movq	-40(%rbp), %rax	# C, tmp151
	addq	%rcx, %rax	# _59, _60
	movq	(%rax), %rax	# *_60, _61
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	movl	-60(%rbp), %ecx	# j, tmp152
	movslq	%ecx, %rcx	# tmp152, _62
	salq	$3, %rcx	#, _63
	addq	%rcx, %rax	# _63, _64
# main.c:74:                 C[i][j] += A[i][k] * B[k][j];
	vaddsd	%xmm0, %xmm1, %xmm0	# _57, _40, _65
	vmovsd	%xmm0, (%rax)	# _65, *_64
# main.c:73:             for (int k = 0; k < M; k++)
	addl	$1, -56(%rbp)	#, k
	jmp	.L104	#
.L98:
	movl	$0, %eax	#, tt.4_2
	addl	$1, %ecx	#, q.3_1
	jmp	.L105	#
.L106:
# main.c:70:     #pragma omp parallel for
	nop	
	addq	$64, %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5051:
	.size	multicore_matrix_multiply._omp_fn.0, .-multicore_matrix_multiply._omp_fn.0
	.type	combined_matrix_multiply._omp_fn.0, @function
combined_matrix_multiply._omp_fn.0:
.LFB5052:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	andq	$-32, %rsp	#,
	subq	$448, %rsp	#,
	movq	%rdi, 24(%rsp)	# .omp_data_i, .omp_data_i
# main.c:114:     #pragma omp parallel for schedule(dynamic)
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp239
	movq	%rax, 440(%rsp)	# tmp239, D.31839
	xorl	%eax, %eax	# tmp239
# main.c:114:     #pragma omp parallel for schedule(dynamic)
	movq	24(%rsp), %rax	# .omp_data_i, tmp161
	movl	32(%rax), %eax	# .omp_data_i_18(D)->N, tmp162
	movl	%eax, 60(%rsp)	# tmp162, N
	movq	24(%rsp), %rax	# .omp_data_i, tmp163
	movl	28(%rax), %eax	# .omp_data_i_18(D)->M, tmp164
	movl	%eax, 64(%rsp)	# tmp164, M
	movq	24(%rsp), %rax	# .omp_data_i, tmp165
	movl	24(%rax), %eax	# .omp_data_i_18(D)->L, tmp166
	movl	%eax, 68(%rsp)	# tmp166, L
	movq	24(%rsp), %rax	# .omp_data_i, tmp167
	movq	16(%rax), %rax	# .omp_data_i_18(D)->C, tmp168
	movq	%rax, 104(%rsp)	# tmp168, C
	movq	24(%rsp), %rax	# .omp_data_i, tmp169
	movq	8(%rax), %rax	# .omp_data_i_18(D)->B, tmp170
	movq	%rax, 112(%rsp)	# tmp170, B
	movq	24(%rsp), %rax	# .omp_data_i, tmp171
	movq	(%rax), %rax	# .omp_data_i_18(D)->A, tmp172
	movq	%rax, 120(%rsp)	# tmp172, A
	movl	68(%rsp), %eax	# L, L.6_25
	cltq
	leaq	96(%rsp), %rcx	#, tmp173
	leaq	88(%rsp), %rdx	#, tmp174
	movq	%rcx, %r9	# tmp173,
	movq	%rdx, %r8	# tmp174,
	movl	$1, %ecx	#,
	movl	$32, %edx	#,
	movq	%rax, %rsi	# _26,
	movl	$0, %edi	#,
	call	GOMP_loop_nonmonotonic_dynamic_start@PLT	#
	testb	%al, %al	# _28
	je	.L108	#,
.L111:
	movq	88(%rsp), %rax	# .istart0.8, .istart0.10_29
	movl	%eax, 32(%rsp)	# .istart0.10_29, si
	movq	96(%rsp), %rax	# .iend0.9, .iend0.11_31
	movl	%eax, %ecx	# .iend0.11_31, _32
.L110:
# main.c:116:         for (int sk = 0; sk < M; sk += BLOCK_SIZE) {
	movl	$0, 36(%rsp)	#, sk
# main.c:116:         for (int sk = 0; sk < M; sk += BLOCK_SIZE) {
	nop	
.L113:
# main.c:116:         for (int sk = 0; sk < M; sk += BLOCK_SIZE) {
	movl	36(%rsp), %eax	# sk, tmp175
	cmpl	64(%rsp), %eax	# M, tmp175
	jl	.L109	#,
	addl	$32, 32(%rsp)	#, si
	cmpl	%ecx, 32(%rsp)	# _32, si
	jl	.L110	#,
	leaq	96(%rsp), %rdx	#, tmp176
	leaq	88(%rsp), %rax	#, tmp177
	movq	%rdx, %rsi	# tmp176,
	movq	%rax, %rdi	# tmp177,
	call	GOMP_loop_nonmonotonic_dynamic_next@PLT	#
	testb	%al, %al	# _36
	jne	.L111	#,
	jmp	.L108	#
.L109:
# main.c:117:             for (int sj = 0; sj < N; sj += BLOCK_SIZE) {
	movl	$0, 40(%rsp)	#, sj
# main.c:117:             for (int sj = 0; sj < N; sj += BLOCK_SIZE) {
	nop	
.L115:
# main.c:117:             for (int sj = 0; sj < N; sj += BLOCK_SIZE) {
	movl	40(%rsp), %eax	# sj, tmp178
	cmpl	60(%rsp), %eax	# N, tmp178
	jl	.L112	#,
# main.c:116:         for (int sk = 0; sk < M; sk += BLOCK_SIZE) {
	addl	$32, 36(%rsp)	#, sk
	jmp	.L113	#
.L112:
# main.c:118:                 int i_end = si + BLOCK_SIZE < L ? si + BLOCK_SIZE : L;
	movl	32(%rsp), %eax	# si, tmp179
	leal	32(%rax), %edx	#, _39
# main.c:118:                 int i_end = si + BLOCK_SIZE < L ? si + BLOCK_SIZE : L;
	movl	68(%rsp), %eax	# L, tmp236
	cmpl	%eax, %edx	# tmp236, _39
	cmovle	%edx, %eax	# _39,, tmp180
	movl	%eax, 72(%rsp)	# tmp180, i_end
# main.c:119:                 int k_end = sk + BLOCK_SIZE < M ? sk + BLOCK_SIZE : M;
	movl	36(%rsp), %eax	# sk, tmp181
	leal	32(%rax), %edx	#, _41
# main.c:119:                 int k_end = sk + BLOCK_SIZE < M ? sk + BLOCK_SIZE : M;
	movl	64(%rsp), %eax	# M, tmp237
	cmpl	%eax, %edx	# tmp237, _41
	cmovle	%edx, %eax	# _41,, tmp182
	movl	%eax, 76(%rsp)	# tmp182, k_end
# main.c:120:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	movl	40(%rsp), %eax	# sj, tmp183
	leal	32(%rax), %edx	#, _43
# main.c:120:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	movl	60(%rsp), %eax	# N, tmp238
	cmpl	%eax, %edx	# tmp238, _43
	cmovle	%edx, %eax	# _43,, tmp184
	movl	%eax, 80(%rsp)	# tmp184, j_end
# main.c:121:                 for (int i = si; i < i_end; i++) {
	movl	32(%rsp), %eax	# si, tmp185
	movl	%eax, 44(%rsp)	# tmp185, i
# main.c:121:                 for (int i = si; i < i_end; i++) {
	nop	
.L117:
# main.c:121:                 for (int i = si; i < i_end; i++) {
	movl	44(%rsp), %eax	# i, tmp186
	cmpl	72(%rsp), %eax	# i_end, tmp186
	jl	.L114	#,
# main.c:117:             for (int sj = 0; sj < N; sj += BLOCK_SIZE) {
	addl	$32, 40(%rsp)	#, sj
	jmp	.L115	#
.L114:
# main.c:122:                     for (int k = sk; k < k_end; k++) {
	movl	36(%rsp), %eax	# sk, tmp187
	movl	%eax, 48(%rsp)	# tmp187, k
# main.c:122:                     for (int k = sk; k < k_end; k++) {
	nop	
.L121:
# main.c:122:                     for (int k = sk; k < k_end; k++) {
	movl	48(%rsp), %eax	# k, tmp188
	cmpl	76(%rsp), %eax	# k_end, tmp188
	jl	.L116	#,
# main.c:121:                 for (int i = si; i < i_end; i++) {
	addl	$1, 44(%rsp)	#, i
	jmp	.L117	#
.L116:
# main.c:123:                         __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
	movl	44(%rsp), %eax	# i, tmp189
	cltq
	leaq	0(,%rax,8), %rdx	#, _50
	movq	120(%rsp), %rax	# A, tmp190
	addq	%rdx, %rax	# _50, _51
	movq	(%rax), %rax	# *_51, _52
# main.c:123:                         __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
	movl	48(%rsp), %edx	# k, tmp191
	movslq	%edx, %rdx	# tmp191, _53
	salq	$3, %rdx	#, _54
# main.c:123:                         __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
	addq	%rdx, %rax	# _54, _55
	movq	%rax, 128(%rsp)	# _55, __X
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:736:   return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
	movq	128(%rsp), %rax	# __X, tmp192
	vbroadcastsd	(%rax), %ymm0	#, D.31779
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:736:   return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
	nop	
# main.c:123:                         __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
	vmovapd	%ymm0, 160(%rsp)	# D.31779, a_ik
# main.c:125:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	movl	80(%rsp), %eax	# j_end, tmp193
	subl	40(%rsp), %eax	# sj, _57
# main.c:125:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	leal	3(%rax), %edx	#, tmp195
	testl	%eax, %eax	# tmp194
	cmovs	%edx, %eax	# tmp195,, tmp194
	sarl	$2, %eax	#, tmp196
# main.c:125:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	leal	0(,%rax,4), %edx	#, _59
# main.c:125:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	movl	40(%rsp), %eax	# sj, tmp200
	addl	%edx, %eax	# _59, tmp199
	movl	%eax, 84(%rsp)	# tmp199, j_vec_end
# main.c:126:                         for (int j = sj; j < j_vec_end; j += MM256_STRIDE) {
	movl	40(%rsp), %eax	# sj, tmp201
	movl	%eax, 52(%rsp)	# tmp201, j
# main.c:126:                         for (int j = sj; j < j_vec_end; j += MM256_STRIDE) {
	nop	
.L127:
# main.c:126:                         for (int j = sj; j < j_vec_end; j += MM256_STRIDE) {
	movl	52(%rsp), %eax	# j, tmp202
	cmpl	84(%rsp), %eax	# j_vec_end, tmp202
	jl	.L119	#,
# main.c:133:                         for (int j = j_vec_end; j < j_end; j++)
	movl	84(%rsp), %eax	# j_vec_end, tmp203
	movl	%eax, 56(%rsp)	# tmp203, j
# main.c:133:                         for (int j = j_vec_end; j < j_end; j++)
	nop	
.L122:
# main.c:133:                         for (int j = j_vec_end; j < j_end; j++)
	movl	56(%rsp), %eax	# j, tmp204
	cmpl	80(%rsp), %eax	# j_end, tmp204
	jl	.L120	#,
# main.c:122:                     for (int k = sk; k < k_end; k++) {
	addl	$1, 48(%rsp)	#, k
	jmp	.L121	#
.L120:
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	movl	44(%rsp), %eax	# i, tmp205
	cltq
	leaq	0(,%rax,8), %rdx	#, _65
	movq	104(%rsp), %rax	# C, tmp206
	addq	%rdx, %rax	# _65, _66
	movq	(%rax), %rax	# *_66, _67
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	movl	56(%rsp), %edx	# j, tmp207
	movslq	%edx, %rdx	# tmp207, _68
	salq	$3, %rdx	#, _69
	addq	%rdx, %rax	# _69, _70
	vmovsd	(%rax), %xmm1	# *_70, _71
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	movl	44(%rsp), %eax	# i, tmp208
	cltq
	leaq	0(,%rax,8), %rdx	#, _73
	movq	120(%rsp), %rax	# A, tmp209
	addq	%rdx, %rax	# _73, _74
	movq	(%rax), %rax	# *_74, _75
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	movl	48(%rsp), %edx	# k, tmp210
	movslq	%edx, %rdx	# tmp210, _76
	salq	$3, %rdx	#, _77
	addq	%rdx, %rax	# _77, _78
	vmovsd	(%rax), %xmm2	# *_78, _79
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	movl	48(%rsp), %eax	# k, tmp211
	cltq
	leaq	0(,%rax,8), %rdx	#, _81
	movq	112(%rsp), %rax	# B, tmp212
	addq	%rdx, %rax	# _81, _82
	movq	(%rax), %rax	# *_82, _83
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	movl	56(%rsp), %edx	# j, tmp213
	movslq	%edx, %rdx	# tmp213, _84
	salq	$3, %rdx	#, _85
	addq	%rdx, %rax	# _85, _86
	vmovsd	(%rax), %xmm0	# *_86, _87
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	vmulsd	%xmm0, %xmm2, %xmm0	# _87, _79, _88
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	movl	44(%rsp), %eax	# i, tmp214
	cltq
	leaq	0(,%rax,8), %rdx	#, _90
	movq	104(%rsp), %rax	# C, tmp215
	addq	%rdx, %rax	# _90, _91
	movq	(%rax), %rax	# *_91, _92
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	movl	56(%rsp), %edx	# j, tmp216
	movslq	%edx, %rdx	# tmp216, _93
	salq	$3, %rdx	#, _94
	addq	%rdx, %rax	# _94, _95
# main.c:134:                             C[i][j] += A[i][k] * B[k][j];
	vaddsd	%xmm0, %xmm1, %xmm0	# _88, _71, _96
	vmovsd	%xmm0, (%rax)	# _96, *_95
# main.c:133:                         for (int j = j_vec_end; j < j_end; j++)
	addl	$1, 56(%rsp)	#, j
	jmp	.L122	#
.L119:
# main.c:127:                             __m256d c = _mm256_load_pd(&C[i][j]);
	movl	44(%rsp), %eax	# i, tmp217
	cltq
	leaq	0(,%rax,8), %rdx	#, _100
	movq	104(%rsp), %rax	# C, tmp218
	addq	%rdx, %rax	# _100, _101
	movq	(%rax), %rax	# *_101, _102
# main.c:127:                             __m256d c = _mm256_load_pd(&C[i][j]);
	movl	52(%rsp), %edx	# j, tmp219
	movslq	%edx, %rdx	# tmp219, _103
	salq	$3, %rdx	#, _104
# main.c:127:                             __m256d c = _mm256_load_pd(&C[i][j]);
	addq	%rdx, %rax	# _104, _105
	movq	%rax, 152(%rsp)	# _105, __P
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	movq	152(%rsp), %rax	# __P, tmp220
	vmovapd	(%rax), %ymm0	# MEM[(__m256d * {ref-all})__P_138], D.31799
# main.c:127:                             __m256d c = _mm256_load_pd(&C[i][j]);
	vmovapd	%ymm0, 192(%rsp)	# D.31799, c
# main.c:128:                             __m256d b = _mm256_load_pd(&B[k][j]);
	movl	48(%rsp), %eax	# k, tmp221
	cltq
	leaq	0(,%rax,8), %rdx	#, _108
	movq	112(%rsp), %rax	# B, tmp222
	addq	%rdx, %rax	# _108, _109
	movq	(%rax), %rax	# *_109, _110
# main.c:128:                             __m256d b = _mm256_load_pd(&B[k][j]);
	movl	52(%rsp), %edx	# j, tmp223
	movslq	%edx, %rdx	# tmp223, _111
	salq	$3, %rdx	#, _112
# main.c:128:                             __m256d b = _mm256_load_pd(&B[k][j]);
	addq	%rdx, %rax	# _112, _113
	movq	%rax, 144(%rsp)	# _113, __P
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	movq	144(%rsp), %rax	# __P, tmp224
	vmovapd	(%rax), %ymm0	# MEM[(__m256d * {ref-all})__P_136], D.31795
# main.c:128:                             __m256d b = _mm256_load_pd(&B[k][j]);
	vmovapd	%ymm0, 224(%rsp)	# D.31795, b
	vmovapd	224(%rsp), %ymm0	# b, tmp225
	vmovapd	%ymm0, 352(%rsp)	# tmp225, __A
	vmovapd	160(%rsp), %ymm0	# a_ik, tmp226
	vmovapd	%ymm0, 384(%rsp)	# tmp226, __B
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:314:   return (__m256d) ((__v4df)__A * (__v4df)__B);
	vmovapd	352(%rsp), %ymm0	# __A, tmp227
	vmulpd	384(%rsp), %ymm0, %ymm0	# __B, tmp227, D.31791
	vmovapd	192(%rsp), %ymm1	# c, tmp228
	vmovapd	%ymm1, 288(%rsp)	# tmp228, __A
	vmovapd	%ymm0, 320(%rsp)	# D.31791, __B
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:143:   return (__m256d) ((__v4df)__A + (__v4df)__B);
	vmovapd	288(%rsp), %ymm0	# __A, tmp229
	vaddpd	320(%rsp), %ymm0, %ymm0	# __B, tmp229, D.31786
# main.c:129:                             c = _mm256_add_pd(c, _mm256_mul_pd(b, a_ik));
	vmovapd	%ymm0, 192(%rsp)	# D.31786, c
# main.c:130:                             _mm256_store_pd(&C[i][j], c);
	movl	44(%rsp), %eax	# i, tmp230
	cltq
	leaq	0(,%rax,8), %rdx	#, _118
	movq	104(%rsp), %rax	# C, tmp231
	addq	%rdx, %rax	# _118, _119
	movq	(%rax), %rax	# *_119, _120
# main.c:130:                             _mm256_store_pd(&C[i][j], c);
	movl	52(%rsp), %edx	# j, tmp232
	movslq	%edx, %rdx	# tmp232, _121
	salq	$3, %rdx	#, _122
# main.c:130:                             _mm256_store_pd(&C[i][j], c);
	addq	%rdx, %rax	# _122, _123
	movq	%rax, 136(%rsp)	# _123, __P
	vmovapd	192(%rsp), %ymm0	# c, tmp233
	vmovapd	%ymm0, 256(%rsp)	# tmp233, __A
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:875:   *(__m256d *)__P = __A;
	movq	136(%rsp), %rax	# __P, tmp234
	vmovapd	256(%rsp), %ymm0	# __A, tmp235
	vmovapd	%ymm0, (%rax)	# tmp235, MEM[(__m256d * {ref-all})__P_128]
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:876: }
	nop	
# main.c:126:                         for (int j = sj; j < j_vec_end; j += MM256_STRIDE) {
	addl	$4, 52(%rsp)	#, j
	jmp	.L127	#
.L108:
	call	GOMP_loop_end_nowait@PLT	#
# main.c:114:     #pragma omp parallel for schedule(dynamic)
	movq	440(%rsp), %rax	# D.31839, tmp240
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp240
	je	.L128	#,
	call	__stack_chk_fail@PLT	#
.L128:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5052:
	.size	combined_matrix_multiply._omp_fn.0, .-combined_matrix_multiply._omp_fn.0
	.section	.rodata
	.align 8
.LC3:
	.long	-4194304
	.long	1105199103
	.align 8
.LC6:
	.long	0
	.long	1072693248
	.align 8
.LC7:
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
