	.file	"main.c"
# GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mavx2 -mtune=generic -march=x86-64 -O3 -fopenmp -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.p2align 4
	.type	multicore_matrix_multiply._omp_fn.0, @function
multicore_matrix_multiply._omp_fn.0:
.LFB6654:
	.cfi_startproc
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp	# tmp124, .omp_data_i
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	call	omp_get_num_threads@PLT	#
	movl	%eax, %ebx	# tmp125, _18
	call	omp_get_thread_num@PLT	#
	movl	%eax, %r11d	# tmp126, _19
	movl	24(%rbp), %eax	# *.omp_data_i_11(D).L, *.omp_data_i_11(D).L
	cltd
	idivl	%ebx	# _18
	cmpl	%edx, %r11d	# tt.4_2, _19
	jl	.L2	#,
.L9:
	imull	%eax, %r11d	# q.3_1, tmp118
	addl	%edx, %r11d	# tt.4_2, _24
	leal	(%rax,%r11), %ebx	#, _25
	cmpl	%ebx, %r11d	# _25, _24
	jge	.L14	#,
# main.c:78:     #pragma omp parallel for
	movslq	32(%rbp), %rdx	# *.omp_data_i_11(D).N,
	movslq	28(%rbp), %rax	# *.omp_data_i_11(D).M,
	testl	%edx, %edx	# N
	jle	.L14	#,
	testl	%eax, %eax	# M
	jle	.L14	#,
	movq	16(%rbp), %r12	# *.omp_data_i_11(D).C, C
	movq	8(%rbp), %r9	# *.omp_data_i_11(D).B, B
	movslq	%r11d, %r11	# _24, ivtmp.54
	leaq	0(,%rdx,8), %r10	#, _80
	movq	0(%rbp), %rbp	# *.omp_data_i_11(D).A, A
	leaq	0(,%rax,8), %r8	#, _84
	.p2align 4,,10
	.p2align 3
.L6:
# main.c:82:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%r12,%r11,8), %r13	# MEM[(double * *)C_15 + ivtmp.54_79 * 8], _31
# main.c:82:                 C[i][j] += A[i][k] * B[k][j];
	movq	0(%rbp,%r11,8), %rdi	# MEM[(double * *)A_17 + ivtmp.54_79 * 8], _37
	xorl	%ecx, %ecx	# ivtmp.51
	.p2align 4,,10
	.p2align 3
.L7:
# main.c:82:                 C[i][j] += A[i][k] * B[k][j];
	leaq	0(%r13,%rcx), %rsi	#, _34
	xorl	%eax, %eax	# ivtmp.46
	vmovsd	(%rsi), %xmm1	# *_34, _47
	.p2align 4,,10
	.p2align 3
.L5:
# main.c:82:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%r9,%rax), %rdx	# MEM[(double * *)B_16 + ivtmp.46_89 * 1], MEM[(double * *)B_16 + ivtmp.46_89 * 1]
# main.c:82:                 C[i][j] += A[i][k] * B[k][j];
	vmovsd	(%rdx,%rcx), %xmm0	# *_44, *_44
	vmulsd	(%rdi,%rax), %xmm0, %xmm0	# MEM[(double *)_37 + ivtmp.46_89 * 1], *_44, tmp122
# main.c:81:             for (int k = 0; k < M; k++)
	addq	$8, %rax	#, ivtmp.46
# main.c:82:                 C[i][j] += A[i][k] * B[k][j];
	vaddsd	%xmm0, %xmm1, %xmm1	# tmp122, _47, _47
	vmovsd	%xmm1, (%rsi)	# _47, *_34
# main.c:81:             for (int k = 0; k < M; k++)
	cmpq	%rax, %r8	# ivtmp.46, _84
	jne	.L5	#,
# main.c:80:         for (int j = 0; j < N; j++)
	addq	$8, %rcx	#, ivtmp.51
	cmpq	%rcx, %r10	# ivtmp.51, _80
	jne	.L7	#,
	addq	$1, %r11	#, ivtmp.54
	cmpl	%r11d, %ebx	# ivtmp.54, _25
	jg	.L6	#,
.L14:
# main.c:78:     #pragma omp parallel for
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
.L2:
	.cfi_restore_state
	addl	$1, %eax	#, q.3_1
# main.c:78:     #pragma omp parallel for
	xorl	%edx, %edx	# tt.4_2
	jmp	.L9	#
	.cfi_endproc
.LFE6654:
	.size	multicore_matrix_multiply._omp_fn.0, .-multicore_matrix_multiply._omp_fn.0
	.p2align 4
	.type	combined_matrix_multiply._omp_fn.0, @function
combined_matrix_multiply._omp_fn.0:
.LFB6655:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$1, %ecx	#,
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	subq	$256, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
# main.c:122:     #pragma omp parallel for schedule(dynamic)
	movl	32(%rdi), %esi	# *.omp_data_i_18(D).N, N
	movq	(%rdi), %rax	# *.omp_data_i_18(D).A, A
# main.c:122:     #pragma omp parallel for schedule(dynamic)
	movq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp358
	movq	%rdx, 248(%rsp)	# tmp358, D.41268
	xorl	%edx, %edx	# tmp358
# main.c:122:     #pragma omp parallel for schedule(dynamic)
	movl	28(%rdi), %ebx	# *.omp_data_i_18(D).M, M
	movq	16(%rdi), %r13	# *.omp_data_i_18(D).C, C
	movl	$32, %edx	#,
	movl	%esi, 108(%rsp)	# N, %sfp
	movslq	24(%rdi), %rsi	# *.omp_data_i_18(D).L,
	leaq	240(%rsp), %r9	#, tmp328
	movq	%rax, 96(%rsp)	# A, %sfp
	leaq	232(%rsp), %rax	#, tmp327
	movq	8(%rdi), %r14	# *.omp_data_i_18(D).B, B
	xorl	%edi, %edi	#
	movq	%rax, %r8	# tmp327,
	movq	%r9, 80(%rsp)	# tmp328, %sfp
	movq	%rsi, %r12	#,
	movq	%rax, 88(%rsp)	# tmp327, %sfp
	call	GOMP_loop_nonmonotonic_dynamic_start@PLT	#
	testb	%al, %al	# tmp356
	jne	.L22	#,
.L18:
	call	GOMP_loop_end_nowait@PLT	#
# main.c:122:     #pragma omp parallel for schedule(dynamic)
	movq	248(%rsp), %rax	# D.41268, tmp360
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp360
	jne	.L80	#,
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L82:
	.cfi_restore_state
# main.c:139:                         for (int j = j_vec_end; j < j_end; j++)
	cmpl	%r14d, %r11d	# _6, j_end
	jle	.L81	#,
	.p2align 4,,10
	.p2align 3
.L31:
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	movq	0(%r13), %rcx	# MEM[(double * *)_180], _61
	cmpl	$1, 192(%rsp)	#, %sfp
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	movq	(%rsi), %rax	# MEM[(double * *)_266], _56
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	movq	(%rdx), %r8	# MEM[(double * *)_157], _65
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	leaq	(%rcx,%r10), %rdi	#, _62
	je	.L46	#,
	movq	208(%rsp), %rbx	# %sfp, _175
	addq	$8, %r10	#, ivtmp.130
	addq	%r10, %rcx	# ivtmp.130, tmp286
	addq	%rax, %rbx	# _56, _174
	cmpq	%rcx, %rbx	# tmp286, _174
	movq	176(%rsp), %rcx	# %sfp, _150
	setnb	%r12b	#, tmp288
	addq	%rax, %rcx	# _56, tmp289
	cmpq	%rcx, %rdi	# tmp289, _62
	setnb	%cl	#, tmp291
	orb	%r12b, %cl	# tmp288, tmp359
	je	.L47	#,
	movq	168(%rsp), %r12	# %sfp, _169
	movq	%rbx, %rcx	# _174, tmp294
	addq	%r8, %r12	# _65, tmp293
	subq	%r12, %rcx	# tmp293, tmp294
	cmpq	$16, %rcx	#, tmp294
	jbe	.L47	#,
	cmpl	$2, 160(%rsp)	#, %sfp
	jbe	.L48	#,
	movq	208(%rsp), %rcx	# %sfp, _175
	vbroadcastsd	(%rdi), %ymm1	# *_62, vect_cst__198
	leaq	(%r8,%rcx), %r12	#, vectp.79
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	xorl	%ecx, %ecx	# ivtmp.115
	.p2align 4,,10
	.p2align 3
.L35:
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	vmulpd	(%r12,%rcx), %ymm1, %ymm0	# MEM <vector(4) double> [(double *)vectp.79_199 + ivtmp.115_124 * 1], vect_cst__198, vect__68.81
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	vaddpd	(%rbx,%rcx), %ymm0, %ymm0	# MEM <vector(4) double> [(double *)_174 + ivtmp.115_124 * 1], vect__68.81, vect__69.82
	vmovupd	%ymm0, (%rbx,%rcx)	# vect__69.82, MEM <vector(4) double> [(double *)_174 + ivtmp.115_124 * 1]
	addq	$32, %rcx	#, ivtmp.115
	cmpq	%rcx, %r15	# ivtmp.115, _69
	jne	.L35	#,
	movl	156(%rsp), %ecx	# %sfp,
	testl	%ecx, %ecx	#
	je	.L37	#,
	movl	148(%rsp), %ebx	# %sfp, niters.85
	movl	%ebx, %ecx	# niters.85, niters.85
	cmpl	$1, %ebx	#, niters.85
	je	.L49	#,
	movl	152(%rsp), %r12d	# %sfp, tmp.74
	movl	144(%rsp), %ebx	# %sfp,
	movl	%r12d, 164(%rsp)	# tmp.74, %sfp
.L34:
	movq	216(%rsp), %r12	# %sfp, _176
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	vmovddup	(%rdi), %xmm0	# *_62, tmp306
	addq	%r12, %rbx	# _176, tmp304
	vmulpd	(%r8,%rbx,8), %xmm0, %xmm0	# MEM <vector(2) double> [(double *)vectp.93_253], tmp306, vect__99.95
	leaq	(%rax,%rbx,8), %r12	#, vectp.90
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	vaddpd	(%r12), %xmm0, %xmm0	# MEM <vector(2) double> [(double *)vectp.90_243], vect__99.95, vect__95.96
	vmovupd	%xmm0, (%r12)	# vect__95.96, MEM <vector(2) double> [(double *)vectp.90_243]
	testb	$1, %cl	#, niters.85
	je	.L37	#,
	movl	164(%rsp), %ebx	# %sfp, j
	andl	$-2, %ecx	#, niters_vector_mult_vf.87
	addl	%ebx, %ecx	# j, tmp.88
.L39:
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	movslq	%ecx, %rcx	# tmp.88, tmp.88
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	vmovsd	(%r8,%rcx,8), %xmm0	# *_226, *_226
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	leaq	(%rax,%rcx,8), %rax	#, _223
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	vmulsd	(%rdi), %xmm0, %xmm0	# *_62, *_226, tmp313
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	vaddsd	(%rax), %xmm0, %xmm0	# *_223, tmp313, tmp315
	vmovsd	%xmm0, (%rax)	# tmp315, *_223
.L37:
# main.c:130:                     for (int k = sk; k < k_end; k++) {
	movq	184(%rsp), %rax	# %sfp, _155
	addq	$8, %rdx	#, ivtmp.134
	cmpq	%rax, %rdx	# _155, ivtmp.134
	jne	.L28	#,
# main.c:129:                 for (int i = si; i < i_end; i++) {
	movq	136(%rsp), %rax	# %sfp, _265
	addq	$8, %rsi	#, ivtmp.142
	addq	$8, %r13	#, ivtmp.143
	cmpq	%rax, %rsi	# _265, ivtmp.142
	jne	.L26	#,
# main.c:125:             for (int sj = 0; sj < N; sj += BLOCK_SIZE) {
	addq	$32, 112(%rsp)	#, %sfp
	movq	%rax, %r8	# _265, _265
	movq	120(%rsp), %rdi	# %sfp, _282
	movq	128(%rsp), %rax	# %sfp, _279
	movq	24(%rsp), %rbx	# %sfp, ivtmp.165
	movq	16(%rsp), %r15	# %sfp, ivtmp.166
	movq	112(%rsp), %rsi	# %sfp, ivtmp.151
	addq	$256, 200(%rsp)	#, %sfp
	cmpl	%esi, 108(%rsp)	# tmp487, %sfp
	jg	.L29	#,
	movq	%rbx, %r10	# ivtmp.165, ivtmp.165
	movq	48(%rsp), %r13	# %sfp, C
	movq	40(%rsp), %r14	# %sfp, B
	movq	32(%rsp), %rcx	# %sfp, ivtmp.158
	movl	60(%rsp), %ebx	# %sfp, M
.L24:
# main.c:124:         for (int sk = 0; sk < M; sk += BLOCK_SIZE) {
	addq	$32, %rcx	#, ivtmp.158
	cmpl	%ecx, %ebx	# ivtmp.158, M
	jg	.L27	#,
	movl	104(%rsp), %r12d	# %sfp, L
	movl	76(%rsp), %eax	# %sfp, _31
	movq	%r10, %r11	# ivtmp.165, ivtmp.165
	movq	64(%rsp), %rdi	# %sfp, ivtmp.167
	movl	72(%rsp), %esi	# %sfp, si
.L21:
	movl	%esi, %edx	# si, si
	addq	$256, %r11	#, ivtmp.165
	addq	$256, %r15	#, ivtmp.166
	addq	$32, %rdi	#, ivtmp.167
	cmpl	%esi, %eax	# si, _31
	jg	.L25	#,
	vzeroupper
.L19:
	movq	80(%rsp), %rsi	# %sfp,
	movq	88(%rsp), %rdi	# %sfp,
	call	GOMP_loop_nonmonotonic_dynamic_next@PLT	#
	testb	%al, %al	# tmp357
	je	.L18	#,
.L22:
	movq	232(%rsp), %rax	# .istart0.8, .istart0.8
	movl	240(%rsp), %r8d	# .iend0.9, _31
	movl	%eax, %edx	# .istart0.8, si
	testl	%ebx, %ebx	# M
	jle	.L19	#,
	movl	108(%rsp), %esi	# %sfp,
	testl	%esi, %esi	#
	jle	.L19	#,
	movq	96(%rsp), %rsi	# %sfp, A
	movslq	%eax, %rdi	# .istart0.8, ivtmp.167
	leaq	0(,%rdi,8), %rax	#, _289
	leaq	0(%r13,%rax), %r11	#, ivtmp.165
	leaq	(%rsi,%rax), %r15	#, ivtmp.166
	movl	%r8d, %eax	# _31, _31
.L25:
# main.c:126:                 int i_end = si + BLOCK_SIZE < L ? si + BLOCK_SIZE : L;
	leal	32(%rdx), %esi	#, si
	movl	%r12d, %ecx	# L, i_end
	cmpl	%r12d, %esi	# L, si
	cmovle	%esi, %ecx	# si,, i_end
	cmpl	%ecx, %edx	# i_end, si
	jge	.L21	#,
	subl	%edx, %ecx	# si, tmp257
	movl	%r12d, 104(%rsp)	# L, %sfp
	movq	%r11, %r10	# ivtmp.165, ivtmp.165
	movl	%eax, 76(%rsp)	# _31, %sfp
	leaq	(%rcx,%rdi), %rdx	#, tmp258
	xorl	%ecx, %ecx	# ivtmp.158
	movq	%rdi, 64(%rsp)	# ivtmp.167, %sfp
	leaq	0(%r13,%rdx,8), %r8	#, _265
	movl	%esi, 72(%rsp)	# si, %sfp
.L27:
# main.c:124:         for (int sk = 0; sk < M; sk += BLOCK_SIZE) {
	leal	32(%rcx), %r11d	#, tmp260
# main.c:127:                 int k_end = sk + BLOCK_SIZE < M ? sk + BLOCK_SIZE : M;
	cmpl	%ebx, %r11d	# M, tmp260
	cmovg	%ebx, %r11d	# tmp260,, M, k_end
	cmpl	%ecx, %r11d	# ivtmp.158, k_end
	jle	.L24	#,
	subl	%ecx, %r11d	# ivtmp.158, tmp262
	movq	%r13, 48(%rsp)	# C, %sfp
	leaq	0(,%rcx,8), %rax	#, _279
	addq	%rcx, %r11	# ivtmp.158, tmp263
	movq	%r14, 40(%rsp)	# B, %sfp
	leaq	(%rax,%r14), %rdi	#, _282
	leaq	(%r14,%r11,8), %rsi	#, _155
	xorl	%r11d, %r11d	# ivtmp.151
	movq	%rcx, 32(%rsp)	# ivtmp.158, %sfp
	movq	%rsi, 184(%rsp)	# _155, %sfp
	movq	$0, 200(%rsp)	#, %sfp
	movq	%r11, 112(%rsp)	# ivtmp.151, %sfp
	movl	%ebx, 60(%rsp)	# M, %sfp
	movq	%r10, %rbx	# ivtmp.165, ivtmp.165
.L29:
# main.c:128:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	movq	112(%rsp), %rcx	# %sfp, ivtmp.151
# main.c:128:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	movl	108(%rsp), %esi	# %sfp, N
# main.c:132:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	movq	%r15, %r13	# ivtmp.166, ivtmp.143
	movq	%r8, 136(%rsp)	# _265, %sfp
	movq	%rax, 128(%rsp)	# _279, %sfp
# main.c:128:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	leal	32(%rcx), %r11d	#, tmp265
	movl	%ecx, 196(%rsp)	# tmp464, %sfp
# main.c:128:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	cmpl	%esi, %r11d	# N, tmp265
	movq	%rdi, 120(%rsp)	# _282, %sfp
	cmovg	%esi, %r11d	# tmp265,, N, j_end
	movq	%rbx, 24(%rsp)	# ivtmp.165, %sfp
	movq	%r15, 16(%rsp)	# ivtmp.166, %sfp
# main.c:132:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	movl	%r11d, %esi	# j_end, tmp266
	subl	%ecx, %esi	# tmp462, tmp266
# main.c:132:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	leal	3(%rsi), %edx	#, tmp269
	cmovns	%esi, %edx	# tmp269,, tmp266, tmp268
	movl	%r11d, %esi	# j_end, _178
# main.c:132:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	andl	$-4, %edx	#, _92
# main.c:132:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	leal	(%rdx,%rcx), %r14d	#, _6
	subl	$1, %edx	#, tmp271
	shrl	$2, %edx	#, tmp272
	subl	%r14d, %esi	# _6, _178
	leal	0(,%rdx,4), %edx	#, tmp274
	movl	%esi, 192(%rsp)	# _178, %sfp
	leaq	4(%rcx,%rdx), %r9	#, tmp276
	movslq	%r14d, %rcx	# _6, _176
	leaq	0(,%rcx,8), %rdx	#, _175
	movq	%rcx, 216(%rsp)	# _176, %sfp
	salq	$3, %r9	#, _244
	movq	%rdx, 208(%rsp)	# _175, %sfp
	addq	$8, %rdx	#, _169
	movq	%rdx, 168(%rsp)	# _169, %sfp
	movl	%esi, %edx	# _178, _178
	addq	%rcx, %rdx	# _176, tmp278
	movl	%esi, %ecx	# _178, _178
	salq	$3, %rdx	#, _150
	movl	%ecx, %r10d	# _178, tmp330
	movq	%rdx, 176(%rsp)	# _150, %sfp
	leal	-1(%rsi), %edx	#, _12
	shrl	$2, %esi	#, bnd.72
	andl	$3, %r10d	#, tmp330
	movl	%esi, %r12d	# bnd.72,
	movl	%ecx, %esi	# _178, niters_vector_mult_vf.73
	movl	%edx, 160(%rsp)	# _12, %sfp
	andl	$-4, %esi	#, niters_vector_mult_vf.73
	movl	%r10d, 156(%rsp)	# tmp330, %sfp
	salq	$5, %r12	#, _69
	movl	%esi, %edx	# niters_vector_mult_vf.73, niters_vector_mult_vf.73
	movl	%esi, 144(%rsp)	# niters_vector_mult_vf.73, %sfp
	leal	(%rsi,%r14), %esi	#, tmp.74
	movq	%r12, %r15	# _69, _69
	subl	%edx, %ecx	# niters_vector_mult_vf.73, niters.85
	movl	%esi, 152(%rsp)	# tmp.74, %sfp
	movq	%rbx, %rsi	# ivtmp.165, ivtmp.142
	movl	%ecx, 148(%rsp)	# niters.85, %sfp
	.p2align 4,,10
	.p2align 3
.L26:
	movq	120(%rsp), %rdx	# %sfp, ivtmp.134
	movq	128(%rsp), %r10	# %sfp, ivtmp.130
	.p2align 4,,10
	.p2align 3
.L28:
# main.c:131:                         __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
	movq	0(%r13), %rax	# MEM[(double * *)_180], tmp283
# main.c:133:                         for (int j = sj; j < j_vec_end; j += MM256_STRIDE) {
	movl	196(%rsp), %ebx	# %sfp, sj
# main.c:131:                         __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
	addq	%r10, %rax	# ivtmp.130, tmp283
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:736:   return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
	vbroadcastsd	(%rax), %ymm1	#, _83
# main.c:133:                         for (int j = sj; j < j_vec_end; j += MM256_STRIDE) {
	movq	200(%rsp), %rax	# %sfp, ivtmp.125
	cmpl	%ebx, %r14d	# sj, _6
	jle	.L82	#,
	.p2align 4,,10
	.p2align 3
.L30:
# main.c:134:                             __m256d c = _mm256_load_pd(&C[i][j]);
	movq	(%rsi), %rcx	# MEM[(double * *)_267], _76
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	movq	(%rdx), %rdi	# MEM[(double * *)_158], MEM[(double * *)_158]
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:314:   return (__m256d) ((__v4df)__A * (__v4df)__B);
	vmulpd	(%rdi,%rax), %ymm1, %ymm0	# MEM[(__m256d * {ref-all})_80], _83, tmp323
# main.c:134:                             __m256d c = _mm256_load_pd(&C[i][j]);
	addq	%rax, %rcx	# ivtmp.125, _76
# main.c:133:                         for (int j = sj; j < j_vec_end; j += MM256_STRIDE) {
	addq	$32, %rax	#, ivtmp.125
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:143:   return (__m256d) ((__v4df)__A + (__v4df)__B);
	vaddpd	(%rcx), %ymm0, %ymm0	# MEM[(__m256d * {ref-all})_76], tmp323, tmp324
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:875:   *(__m256d *)__P = __A;
	vmovapd	%ymm0, (%rcx)	# tmp324, MEM[(__m256d * {ref-all})_76]
# main.c:133:                         for (int j = sj; j < j_vec_end; j += MM256_STRIDE) {
	cmpq	%r9, %rax	# _244, ivtmp.125
	jne	.L30	#,
# main.c:139:                         for (int j = j_vec_end; j < j_end; j++)
	cmpl	%r14d, %r11d	# _6, j_end
	jg	.L31	#,
.L81:
	addq	$8, %r10	#, ivtmp.130
	jmp	.L37	#
	.p2align 4,,10
	.p2align 3
.L47:
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	movq	216(%rsp), %rcx	# %sfp, ivtmp.105
	.p2align 4,,10
	.p2align 3
.L41:
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	vmovsd	(%r8,%rcx,8), %xmm0	# MEM[(double *)_65 + ivtmp.105_119 * 8], MEM[(double *)_65 + ivtmp.105_119 * 8]
	vmulsd	(%rdi), %xmm0, %xmm0	# *_62, MEM[(double *)_65 + ivtmp.105_119 * 8], tmp317
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0	# MEM[(double *)_56 + ivtmp.105_119 * 8], tmp317, tmp319
	vmovsd	%xmm0, (%rax,%rcx,8)	# tmp319, MEM[(double *)_56 + ivtmp.105_119 * 8]
# main.c:139:                         for (int j = j_vec_end; j < j_end; j++)
	addq	$1, %rcx	#, ivtmp.105
	cmpl	%ecx, %r11d	# ivtmp.105, j_end
	jg	.L41	#,
	jmp	.L37	#
	.p2align 4,,10
	.p2align 3
.L46:
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	movq	216(%rsp), %rcx	# %sfp, ivtmp.105
	addq	$8, %r10	#, ivtmp.130
	jmp	.L41	#
.L48:
# main.c:139:                         for (int j = j_vec_end; j < j_end; j++)
	movl	%r14d, 164(%rsp)	# _6, %sfp
# main.c:140:                             C[i][j] += A[i][k] * B[k][j];
	movl	192(%rsp), %ecx	# %sfp, niters.85
	xorl	%ebx, %ebx	#
	jmp	.L34	#
.L49:
# main.c:139:                         for (int j = j_vec_end; j < j_end; j++)
	movl	152(%rsp), %ecx	# %sfp, tmp.88
	jmp	.L39	#
.L80:
# main.c:122:     #pragma omp parallel for schedule(dynamic)
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE6655:
	.size	combined_matrix_multiply._omp_fn.0, .-combined_matrix_multiply._omp_fn.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"usage: %s <L> <M> <N> <seed> <method>\n"
	.align 8
.LC1:
	.string	"  method: 0=baseline 1=unrolled 2=multicore 3=blocked 4=simd 5=combined"
	.text
	.p2align 4
	.globl	print_help_and_exit
	.type	print_help_and_exit, @function
print_help_and_exit:
.LFB6642:
	.cfi_startproc
	endbr64	
	pushq	%rax	#
	.cfi_def_cfa_offset 16
	popq	%rax	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC0(%rip), %rsi	#, tmp85
	xorl	%eax, %eax	#
# main.c:33: void print_help_and_exit(char **argv) {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	(%rdi), %rdx	# *argv_3(D), *argv_3(D)
	movl	$2, %edi	#,
	call	__printf_chk@PLT	#
	leaq	.LC1(%rip), %rdi	#, tmp86
	call	puts@PLT	#
# main.c:36:     exit(0);
	xorl	%edi, %edi	#
	call	exit@PLT	#
	.cfi_endproc
.LFE6642:
	.size	print_help_and_exit, .-print_help_and_exit
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%f "
	.text
	.p2align 4
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB6643:
	.cfi_startproc
	endbr64	
# main.c:40:     for (int i = 0; i < rows; i++) {
	testl	%esi, %esi	# rows
	jle	.L97	#,
# main.c:39: void print_matrix(double **mat, int rows, int cols) {
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movslq	%esi, %rsi	# rows, rows
	movq	%rdi, %r14	# mat, ivtmp.186
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	(%rdi,%rsi,8), %r13	#, _9
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movslq	%edx, %rbp	# cols, cols
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	salq	$3, %rbp	#, _24
	movl	%edx, %ebx	# tmp105, cols
.L87:
# main.c:41:         for (int j = 0; j < cols; j++)
	testl	%ebx, %ebx	# cols
	jle	.L94	#,
	leaq	.LC2(%rip), %r12	#, tmp102
	.p2align 4,,10
	.p2align 3
.L89:
# main.c:39: void print_matrix(double **mat, int rows, int cols) {
	xorl	%ebx, %ebx	# ivtmp.181
	.p2align 4,,10
	.p2align 3
.L88:
# main.c:42:             printf("%f ", mat[i][j]);
	movq	(%r14), %rax	# MEM[(double * *)_36], MEM[(double * *)_36]
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%r12, %rsi	# tmp102,
	movl	$2, %edi	#,
	vmovsd	(%rax,%rbx), %xmm0	# *_7, *_7
	movl	$1, %eax	#,
# main.c:41:         for (int j = 0; j < cols; j++)
	addq	$8, %rbx	#, ivtmp.181
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# main.c:41:         for (int j = 0; j < cols; j++)
	cmpq	%rbx, %rbp	# ivtmp.181, _24
	jne	.L88	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$10, %edi	#,
# main.c:40:     for (int i = 0; i < rows; i++) {
	addq	$8, %r14	#, ivtmp.186
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	putchar@PLT	#
# main.c:40:     for (int i = 0; i < rows; i++) {
	cmpq	%r14, %r13	# ivtmp.186, _9
	jne	.L89	#,
.L95:
# main.c:45: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret	
.L94:
	.cfi_restore_state
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$10, %edi	#,
# main.c:40:     for (int i = 0; i < rows; i++) {
	addq	$8, %r14	#, ivtmp.186
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	putchar@PLT	#
# main.c:40:     for (int i = 0; i < rows; i++) {
	cmpq	%r14, %r13	# ivtmp.186, _9
	jne	.L87	#,
	jmp	.L95	#
.L97:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret	
	.cfi_endproc
.LFE6643:
	.size	print_matrix, .-print_matrix
	.p2align 4
	.globl	drand
	.type	drand, @function
drand:
.LFB6644:
	.cfi_startproc
	endbr64	
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 32
# main.c:47: double drand(double min, double max) {
	vmovsd	%xmm0, 8(%rsp)	# min, %sfp
	vmovsd	%xmm1, (%rsp)	# max, %sfp
# main.c:48:     double r = (double)rand() / RAND_MAX;
	call	rand@PLT	#
# main.c:49:     return r * (max - min) + min;
	vmovsd	8(%rsp), %xmm0	# %sfp, min
	vmovsd	(%rsp), %xmm1	# %sfp, max
# main.c:48:     double r = (double)rand() / RAND_MAX;
	vxorps	%xmm2, %xmm2, %xmm2	# tmp99
	vcvtsi2sdl	%eax, %xmm2, %xmm2	# tmp98, tmp99, tmp100
# main.c:48:     double r = (double)rand() / RAND_MAX;
	vdivsd	.LC3(%rip), %xmm2, %xmm2	#, tmp91, r
# main.c:50: }
	addq	$24, %rsp	#,
	.cfi_def_cfa_offset 8
# main.c:49:     return r * (max - min) + min;
	vsubsd	%xmm0, %xmm1, %xmm1	# min, max, tmp94
# main.c:49:     return r * (max - min) + min;
	vmulsd	%xmm1, %xmm2, %xmm1	# tmp94, r, tmp95
# main.c:49:     return r * (max - min) + min;
	vaddsd	%xmm0, %xmm1, %xmm0	# min, tmp95, tmp90
# main.c:50: }
	ret	
	.cfi_endproc
.LFE6644:
	.size	drand, .-drand
	.p2align 4
	.globl	matrix_multiply
	.type	matrix_multiply, @function
matrix_multiply:
.LFB6645:
	.cfi_startproc
	endbr64	
# main.c:54:     for (int i = 0; i < L; i++)
	testl	%ecx, %ecx	# L
	jle	.L113	#,
# main.c:53: void matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rbx	# tmp114, C
	movslq	%r9d, %rdx	# tmp117,
	testl	%edx, %edx	# N
	jle	.L111	#,
	movslq	%r8d, %rax	# tmp116,
	testl	%eax, %eax	# M
	jle	.L111	#,
	movslq	%ecx, %rcx	# L, L
	movq	%rdi, %r10	# tmp112, A
	movq	%rsi, %r11	# tmp113, B
# main.c:54:     for (int i = 0; i < L; i++)
	xorl	%r13d, %r13d	# ivtmp.213
	leaq	0(,%rcx,8), %r12	#, _61
	leaq	0(,%rdx,8), %rbp	#, _65
	leaq	0(,%rax,8), %r8	#, _69
	.p2align 4,,10
	.p2align 3
.L105:
# main.c:57:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%rbx,%r13), %r9	# MEM[(double * *)C_33(D) + ivtmp.213_64 * 1], _4
# main.c:57:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%r10,%r13), %rdi	# MEM[(double * *)A_34(D) + ivtmp.213_64 * 1], _10
	xorl	%ecx, %ecx	# ivtmp.206
	.p2align 4,,10
	.p2align 3
.L108:
# main.c:57:                 C[i][j] += A[i][k] * B[k][j];
	leaq	(%r9,%rcx), %rsi	#, _7
	xorl	%eax, %eax	# ivtmp.202
	vmovsd	(%rsi), %xmm1	# *_7, _20
	.p2align 4,,10
	.p2align 3
.L106:
# main.c:57:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%r11,%rax), %rdx	# MEM[(double * *)B_35(D) + ivtmp.202_74 * 1], MEM[(double * *)B_35(D) + ivtmp.202_74 * 1]
# main.c:57:                 C[i][j] += A[i][k] * B[k][j];
	vmovsd	(%rdx,%rcx), %xmm0	# *_17, *_17
	vmulsd	(%rdi,%rax), %xmm0, %xmm0	# MEM[(double *)_10 + ivtmp.202_74 * 1], *_17, tmp110
# main.c:56:             for (int k = 0; k < M; k++)
	addq	$8, %rax	#, ivtmp.202
# main.c:57:                 C[i][j] += A[i][k] * B[k][j];
	vaddsd	%xmm0, %xmm1, %xmm1	# tmp110, _20, _20
	vmovsd	%xmm1, (%rsi)	# _20, *_7
# main.c:56:             for (int k = 0; k < M; k++)
	cmpq	%rax, %r8	# ivtmp.202, _69
	jne	.L106	#,
# main.c:55:         for (int j = 0; j < N; j++)
	addq	$8, %rcx	#, ivtmp.206
	cmpq	%rcx, %rbp	# ivtmp.206, _65
	jne	.L108	#,
# main.c:54:     for (int i = 0; i < L; i++)
	addq	$8, %r13	#, ivtmp.213
	cmpq	%r13, %r12	# ivtmp.213, _61
	jne	.L105	#,
.L111:
# main.c:58: }
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
.L113:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret	
	.cfi_endproc
.LFE6645:
	.size	matrix_multiply, .-matrix_multiply
	.p2align 4
	.globl	unrolled_matrix_multiply
	.type	unrolled_matrix_multiply, @function
unrolled_matrix_multiply:
.LFB6646:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%ecx, %rax	# tmp225,
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	subq	$160, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
# main.c:61: void unrolled_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%rdi, 40(%rsp)	# tmp222, %sfp
	movq	%fs:40, %rcx	# MEM[(<address-space-1> long unsigned int *)40B], tmp228
	movq	%rcx, 152(%rsp)	# tmp228, D.41382
	xorl	%ecx, %ecx	# tmp228
# main.c:62:     for (int i = 0; i < L; i++) {
	testl	%eax, %eax	# L
	jle	.L116	#,
	movl	%r9d, %r13d	# tmp227, N
	testl	%r9d, %r9d	# N
	jle	.L116	#,
	movl	%r8d, %r11d	# M, bnd.224
	movq	%rdx, 24(%rsp)	# C, %sfp
	movl	%r8d, %r15d	# M, tmp214
	movq	%rsi, %r10	# tmp223, B
	shrl	$2, %r11d	#,
	movl	%r8d, %ebx	# tmp226, M
	xorl	%esi, %esi	# ivtmp.277
	andl	$3, %r15d	#, tmp214
	leaq	0(,%rax,8), %rdi	#, _155
	leal	-1(%r8), %eax	#, _74
	salq	$5, %r11	#, _117
	movl	%eax, 80(%rsp)	# _74, %sfp
	movl	%r8d, %eax	# M, _108
	leaq	96(%rsp), %r14	#, ivtmp.262
	leaq	128(%rsp), %r12	#, _107
	andl	$-4, %eax	#, _108
	movq	%rdi, 32(%rsp)	# _155, %sfp
	movl	%eax, 76(%rsp)	# _108, %sfp
.L118:
	movq	24(%rsp), %rax	# %sfp, C
	movq	%rsi, %rdi	# ivtmp.277, ivtmp.277
	xorl	%edx, %edx	# j
	movq	(%rax,%rsi), %rax	# MEM[(double * *)C_55(D) + ivtmp.277_90 * 1], ivtmp.269
	movl	%r13d, %esi	# N, N
	movq	%r12, %r13	# _107, _107
	.p2align 4,,10
	.p2align 3
.L127:
# main.c:66:                 C_temp[u] = C[i][j + u];
	vmovupd	(%rax), %ymm5	# MEM <vector(4) double> [(double *)_16], tmp298
	movq	%r14, %rcx	# ivtmp.262, ivtmp.262
	movl	%edx, %r9d	# j, ivtmp.263
	vmovapd	%ymm5, 96(%rsp)	# tmp298, MEM <vector(4) double> [(double *)&C_temp]
.L126:
# main.c:68:                 for (int k = 0; k < M; k++)
	testl	%ebx, %ebx	# M
	jle	.L136	#,
	movq	40(%rsp), %r8	# %sfp, A
	movl	%edx, 72(%rsp)	# j, %sfp
	movq	%rdi, 64(%rsp)	# ivtmp.277, %sfp
	movq	%rcx, 88(%rsp)	# ivtmp.262, %sfp
	movq	(%r8,%rdi), %r12	# MEM[(double * *)A_60(D) + ivtmp.277_90 * 1], _14
	movq	%rax, 56(%rsp)	# ivtmp.269, %sfp
	movl	%esi, 52(%rsp)	# N, %sfp
.L122:
	movq	88(%rsp), %rax	# %sfp, ivtmp.262
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	movslq	%r9d, %rdx	# ivtmp.263, ivtmp.263
	cmpl	$2, 80(%rsp)	#, %sfp
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	leaq	0(,%rdx,8), %rsi	#, _23
	vmovsd	(%rax), %xmm2	# MEM[(double *)_145], C_temp_I_lsm.221
	jbe	.L129	#,
	movl	%r9d, 84(%rsp)	# ivtmp.263, %sfp
	xorl	%eax, %eax	# ivtmp.251
	.p2align 4,,10
	.p2align 3
.L120:
	leaq	(%r10,%rax), %rcx	#, _29
	movq	(%rcx), %r8	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_29], 64, 0>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_29], 64, 0>
	movq	16(%rcx), %r9	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_29], 64, 128>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_29], 64, 128>
	movq	8(%rcx), %rdi	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_29], 64, 64>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_29], 64, 64>
	movq	24(%rcx), %rcx	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_29], 64, 192>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_29], 64, 192>
	vmovsd	(%r9,%rsi), %xmm1	# MEM[(double *)_8], MEM[(double *)_8]
	vmovsd	(%r8,%rsi), %xmm0	# MEM[(double *)_41], MEM[(double *)_41]
	vmovhpd	(%rcx,%rsi), %xmm1, %xmm1	# MEM[(double *)_4], MEM[(double *)_8], tmp180
	vmovhpd	(%rdi,%rsi), %xmm0, %xmm0	# MEM[(double *)_36], MEM[(double *)_41], tmp183
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0	# tmp180, tmp183, vect__25.233
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	vmulpd	(%r12,%rax), %ymm0, %ymm0	# MEM <vector(4) double> [(double *)_14 + ivtmp.251_172 * 1], vect__25.233, vect__26.234
	addq	$32, %rax	#, ivtmp.251
	vaddsd	%xmm2, %xmm0, %xmm2	# C_temp_I_lsm.221, stmp__27.235, stmp__27.235
	vunpckhpd	%xmm0, %xmm0, %xmm1	# tmp187, stmp__27.235
	vextractf128	$0x1, %ymm0, %xmm0	# vect__26.234, tmp189
	vaddsd	%xmm2, %xmm1, %xmm1	# stmp__27.235, stmp__27.235, stmp__27.235
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	vaddsd	%xmm0, %xmm1, %xmm1	# stmp__27.235, stmp__27.235, stmp__27.235
	vunpckhpd	%xmm0, %xmm0, %xmm0	# tmp189, stmp__27.235
	vaddsd	%xmm0, %xmm1, %xmm2	# stmp__27.235, stmp__27.235, C_temp_I_lsm.221
	cmpq	%rax, %r11	# ivtmp.251, _117
	jne	.L120	#,
	movl	84(%rsp), %r9d	# %sfp, ivtmp.263
	testl	%r15d, %r15d	# tmp214
	je	.L121	#,
# main.c:68:                 for (int k = 0; k < M; k++)
	movl	76(%rsp), %eax	# %sfp, k
.L119:
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	movslq	%eax, %rdi	# k, k
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	movq	(%r10,%rdi,8), %rcx	# *_24, *_24
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	leaq	0(,%rdi,8), %rsi	#, _18
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	vmovsd	(%rcx,%rdx,8), %xmm0	# *_26, *_26
	vmulsd	(%r12,%rdi,8), %xmm0, %xmm0	# *_19, *_26, tmp196
# main.c:68:                 for (int k = 0; k < M; k++)
	leal	1(%rax), %edi	#, k
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	vaddsd	%xmm0, %xmm2, %xmm2	# tmp196, C_temp_I_lsm.221, C_temp_I_lsm.221
# main.c:68:                 for (int k = 0; k < M; k++)
	cmpl	%edi, %ebx	# k, M
	jle	.L121	#,
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	movq	8(%r10,%rsi), %rdi	# *_95, *_95
# main.c:68:                 for (int k = 0; k < M; k++)
	addl	$2, %eax	#, k
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	vmovsd	(%rdi,%rdx,8), %xmm0	# *_97, *_97
	vmulsd	8(%r12,%rsi), %xmm0, %xmm0	# *_92, *_97, tmp200
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	vaddsd	%xmm0, %xmm2, %xmm2	# tmp200, C_temp_I_lsm.221, C_temp_I_lsm.221
# main.c:68:                 for (int k = 0; k < M; k++)
	cmpl	%eax, %ebx	# k, M
	jle	.L121	#,
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	movq	16(%r10,%rsi), %rax	# *_134, *_134
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	vmovsd	(%rax,%rdx,8), %xmm0	# *_131, *_131
	vmulsd	16(%r12,%rsi), %xmm0, %xmm0	# *_136, *_131, tmp204
# main.c:69:                     C_temp[u] += A[i][k] * B[k][j + u];
	vaddsd	%xmm0, %xmm2, %xmm2	# tmp204, C_temp_I_lsm.221, C_temp_I_lsm.221
.L121:
	movq	88(%rsp), %rax	# %sfp, ivtmp.262
# main.c:67:             for (int u = 0; u < UNROLL; u++)
	addl	$1, %r9d	#, ivtmp.263
	vmovsd	%xmm2, (%rax)	# C_temp_I_lsm.221, MEM[(double *)_145]
	addq	$8, %rax	#, ivtmp.262
	movq	%rax, 88(%rsp)	# ivtmp.262, %sfp
	cmpq	%rax, %r13	# ivtmp.262, _107
	jne	.L122	#,
	movl	72(%rsp), %edx	# %sfp, j
	movq	64(%rsp), %rdi	# %sfp, ivtmp.277
	movq	56(%rsp), %rax	# %sfp, ivtmp.269
	movl	52(%rsp), %esi	# %sfp, N
.L123:
# main.c:71:                 C[i][j + u] = C_temp[u];
	vmovapd	96(%rsp), %ymm4	# MEM <vector(4) double> [(double *)&C_temp], tmp297
# main.c:63:         for (int j = 0; j < N; j += UNROLL) {
	addl	$4, %edx	#, j
# main.c:63:         for (int j = 0; j < N; j += UNROLL) {
	addq	$32, %rax	#, ivtmp.269
# main.c:71:                 C[i][j + u] = C_temp[u];
	vmovupd	%ymm4, -32(%rax)	# tmp297, MEM <vector(4) double> [(double *)_16]
# main.c:63:         for (int j = 0; j < N; j += UNROLL) {
	cmpl	%edx, %esi	# j, N
	jg	.L127	#,
# main.c:62:     for (int i = 0; i < L; i++) {
	movq	%r13, %r12	# _107, _107
	movq	32(%rsp), %rax	# %sfp, _155
	movl	%esi, %r13d	# N, N
	movq	%rdi, %rsi	# ivtmp.277, ivtmp.277
	addq	$8, %rsi	#, ivtmp.277
	cmpq	%rax, %rsi	# _155, ivtmp.277
	jne	.L118	#,
	vzeroupper
.L116:
# main.c:74: }
	movq	152(%rsp), %rax	# D.41382, tmp229
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp229
	jne	.L141	#,
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
	.p2align 4,,10
	.p2align 3
.L136:
	.cfi_restore_state
# main.c:67:             for (int u = 0; u < UNROLL; u++)
	addq	$8, %rcx	#, ivtmp.262
	addl	$1, %r9d	#, ivtmp.263
	cmpq	%rcx, %r13	# ivtmp.262, _107
	jne	.L126	#,
	jmp	.L123	#
.L129:
# main.c:68:                 for (int k = 0; k < M; k++)
	xorl	%eax, %eax	# k
	jmp	.L119	#
.L141:
# main.c:74: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE6646:
	.size	unrolled_matrix_multiply, .-unrolled_matrix_multiply
	.p2align 4
	.globl	multicore_matrix_multiply
	.type	multicore_matrix_multiply, @function
multicore_matrix_multiply:
.LFB6647:
	.cfi_startproc
	endbr64	
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 64
# main.c:77: void multicore_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
	movq	%rax, 40(%rsp)	# tmp98, D.41386
	xorl	%eax, %eax	# tmp98
# main.c:78:     #pragma omp parallel for
	movl	%ecx, 24(%rsp)	# tmp95, .omp_data_o.2.L
	xorl	%ecx, %ecx	#
	movq	%rdx, 16(%rsp)	# tmp94, .omp_data_o.2.C
	xorl	%edx, %edx	#
	movq	%rsi, 8(%rsp)	# tmp93, .omp_data_o.2.B
	movq	%rsp, %rsi	#, tmp89
	movq	%rdi, (%rsp)	# tmp92, .omp_data_o.2.A
	leaq	multicore_matrix_multiply._omp_fn.0(%rip), %rdi	#, tmp90
	movl	%r9d, 32(%rsp)	# tmp97, .omp_data_o.2.N
	movl	%r8d, 28(%rsp)	# tmp96, .omp_data_o.2.M
	call	GOMP_parallel@PLT	#
# main.c:83: }
	movq	40(%rsp), %rax	# D.41386, tmp99
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp99
	jne	.L146	#,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L146:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE6647:
	.size	multicore_matrix_multiply, .-multicore_matrix_multiply
	.p2align 4
	.globl	blocked_matrix_multiply
	.type	blocked_matrix_multiply, @function
blocked_matrix_multiply:
.LFB6649:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %r11	# tmp455, B
	movl	%ecx, %esi	# tmp457, L
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	subq	$200, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
# main.c:98: void blocked_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%rdi, -32(%rsp)	# tmp454, %sfp
	movq	%rdx, -40(%rsp)	# tmp456, %sfp
# main.c:99:     for (int sj = 0; sj < L; sj += BLOCK_SIZE)
	testl	%ecx, %ecx	# L
	jle	.L161	#,
	testl	%r9d, %r9d	# N
	jle	.L161	#,
	movl	%r8d, %eax	# tmp458, M
	testl	%r8d, %r8d	# M
	jle	.L161	#,
	subl	$1, %eax	#, tmp333
	xorl	%ebx, %ebx	# ivtmp.340
# main.c:99:     for (int sj = 0; sj < L; sj += BLOCK_SIZE)
	xorl	%edx, %edx	# sj
	shrl	$5, %eax	#, tmp334
	addl	$1, %eax	#,
	salq	$8, %rax	#, tmp336
	movq	%rax, 16(%rsp)	# tmp336, %sfp
.L150:
	movl	%edx, -60(%rsp)	# sj, %sfp
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	movl	$256, %r12d	#, ivtmp.334
# main.c:100:         for (int si = 0; si < N; si += BLOCK_SIZE)
	xorl	%r10d, %r10d	# si
	movq	%rbx, %rcx	# ivtmp.340, ivtmp.340
	leaq	256(%rbx), %rax	#, _129
	movq	%r12, %rdi	# ivtmp.334, ivtmp.334
	movq	%rax, -56(%rsp)	# _129, %sfp
.L157:
	leaq	-256(%rdi), %rax	#, ivtmp.321
	movl	%esi, -64(%rsp)	# L, %sfp
	movq	%r11, %rdx	# B, ivtmp.329
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	xorl	%ebx, %ebx	# ivtmp.328
	movq	%rax, -48(%rsp)	# ivtmp.321, %sfp
	movl	%r10d, %r13d	# si, si
	movq	%r11, -72(%rsp)	# B, %sfp
	movl	%r9d, -76(%rsp)	# N, %sfp
.L156:
	movq	24(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_262], 64, 192>, _144
	movq	-48(%rsp), %r12	# %sfp, ivtmp.321
	movq	16(%rdx), %r15	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_262], 64, 128>, _42
	movq	%rax, 120(%rsp)	# _144, %sfp
	movq	8(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_262], 64, 64>, _36
	movq	%rax, 176(%rsp)	# _36, %sfp
	movq	(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_262], 64, 0>, _32
	movq	%rax, 184(%rsp)	# _32, %sfp
	movq	56(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_263], 64, 192>, _44
	movq	%rax, 168(%rsp)	# _44, %sfp
	movq	48(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_263], 64, 128>, _50
	movq	%rax, 160(%rsp)	# _50, %sfp
	movq	40(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_263], 64, 64>, _55
	movq	%rax, 152(%rsp)	# _55, %sfp
	movq	32(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_263], 64, 0>, _60
	movq	%rax, 144(%rsp)	# _60, %sfp
	movq	88(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_264], 64, 192>, _174
	movq	%rax, 88(%rsp)	# _174, %sfp
	movq	80(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_264], 64, 128>, _170
	movq	%rax, 96(%rsp)	# _170, %sfp
	movq	72(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_264], 64, 64>, _166
	movq	%rax, 104(%rsp)	# _166, %sfp
	movq	64(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_264], 64, 0>, _162
	movq	%rax, 112(%rsp)	# _162, %sfp
	movq	120(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_295], 64, 192>, _209
	movq	%rax, 56(%rsp)	# _209, %sfp
	movq	112(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_295], 64, 128>, _205
	movq	%rax, 64(%rsp)	# _205, %sfp
	movq	104(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_295], 64, 64>, _201
	movq	%rax, 72(%rsp)	# _201, %sfp
	movq	96(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_295], 64, 0>, _197
	movq	%rax, 80(%rsp)	# _197, %sfp
	movq	152(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_228], 64, 192>, _244
	movq	%rdx, -88(%rsp)	# ivtmp.329, %sfp
	movq	160(%rdx), %r11	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_134], 64, 0>, _267
	movq	%rax, 24(%rsp)	# _244, %sfp
	movq	144(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_228], 64, 128>, _240
	movq	208(%rdx), %r10	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_136], 64, 128>, _310
	movq	192(%rdx), %r9	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_136], 64, 0>, _302
	movq	%rax, 32(%rsp)	# _240, %sfp
	movq	136(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_228], 64, 64>, _236
	movq	240(%rdx), %rsi	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_135], 64, 128>, _118
	movq	%rax, 40(%rsp)	# _236, %sfp
	movq	128(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_228], 64, 0>, _232
	movq	%rax, 48(%rsp)	# _232, %sfp
	movq	184(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_134], 64, 192>, _279
	movq	%rax, -8(%rsp)	# _279, %sfp
	movq	176(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_134], 64, 128>, _275
	movq	%rax, (%rsp)	# _275, %sfp
	movq	168(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_134], 64, 64>, _271
	movq	%rax, 8(%rsp)	# _271, %sfp
	movq	216(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_136], 64, 192>, _314
	movq	%rax, -24(%rsp)	# _314, %sfp
	movq	200(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_136], 64, 64>, _306
	movq	%rax, -16(%rsp)	# _306, %sfp
	movq	248(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_135], 64, 192>, _114
	movq	%rax, 136(%rsp)	# _114, %sfp
	movq	232(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_135], 64, 64>, _122
	movq	%rax, 128(%rsp)	# _122, %sfp
	movq	224(%rdx), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_135], 64, 0>, _126
.L154:
# main.c:89:             double c_ij = C[i][j];
	movq	-40(%rsp), %rdx	# %sfp, C
	movq	%rbx, -96(%rsp)	# ivtmp.328, %sfp
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	movq	%rcx, %r8	# ivtmp.340, ivtmp.309
# main.c:89:             double c_ij = C[i][j];
	movq	(%rdx,%r12), %rdx	# MEM[(double * *)C_15(D) + ivtmp.321_84 * 1], _22
	movq	%rdx, 192(%rsp)	# _22, %sfp
	movq	-32(%rsp), %rdx	# %sfp, A
	movq	(%rdx,%r12), %r14	# MEM[(double * *)A_13(D) + ivtmp.321_84 * 1], vectp.291
	movq	192(%rsp), %rdx	# %sfp, _22
	movq	%r12, 192(%rsp)	# ivtmp.321, %sfp
	movq	-96(%rsp), %r12	# %sfp, ivtmp.328
	addq	%rbx, %r14	# ivtmp.328, vectp.291
	movq	%rdi, %rbx	# ivtmp.334, ivtmp.334
	movq	%rcx, %rdi	# ivtmp.340, ivtmp.340
	movl	%r13d, %ecx	# si, si
	movq	%rbx, %r13	# ivtmp.334, ivtmp.334
	.p2align 4,,10
	.p2align 3
.L151:
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r15,%r8), %xmm1	# MEM[(double *)_131], MEM[(double *)_131]
	movq	120(%rsp), %rbx	# %sfp, _144
	vmovsd	(%rdx,%r8), %xmm2	# MEM[(double *)_22 + ivtmp.309_157 * 1], stmp_c_ij_41.298
	vmovhpd	(%rbx,%r8), %xmm1, %xmm1	# MEM[(double *)_98], MEM[(double *)_131], tmp338
	movq	184(%rsp), %rbx	# %sfp, _32
	vmovsd	(%rbx,%r8), %xmm0	# MEM[(double *)_34], MEM[(double *)_34]
	movq	176(%rsp), %rbx	# %sfp, _36
	vmovhpd	(%rbx,%r8), %xmm0, %xmm0	# MEM[(double *)_38], MEM[(double *)_34], tmp341
	movq	160(%rsp), %rbx	# %sfp, _50
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0	# tmp338, tmp341, vect__38.296
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmulpd	(%r14), %ymm0, %ymm0	# MEM <vector(4) double> [(double *)vectp.291_143], vect__38.296, vect__39.297
	vaddsd	%xmm0, %xmm2, %xmm2	# tmp345, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm0, %xmm0, %xmm1	# tmp345, stmp_c_ij_41.298
	vextractf128	$0x1, %ymm0, %xmm0	# vect__39.297, tmp347
	vaddsd	%xmm2, %xmm1, %xmm1	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vaddsd	%xmm1, %xmm0, %xmm2	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm0, %xmm0, %xmm0	# tmp347, stmp_c_ij_41.298
	vaddsd	%xmm0, %xmm2, %xmm2	# stmp_c_ij_41.298, stmp_c_ij_41.298, c_ij
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%rbx,%r8), %xmm0	# MEM[(double *)_48], MEM[(double *)_48]
	movq	168(%rsp), %rbx	# %sfp, _44
	vmovhpd	(%rbx,%r8), %xmm0, %xmm0	# MEM[(double *)_40], MEM[(double *)_48], tmp352
	movq	144(%rsp), %rbx	# %sfp, _60
	vmovsd	(%rbx,%r8), %xmm1	# MEM[(double *)_57], MEM[(double *)_57]
	movq	152(%rsp), %rbx	# %sfp, _55
	vmovhpd	(%rbx,%r8), %xmm1, %xmm1	# MEM[(double *)_53], MEM[(double *)_57], tmp355
	movq	96(%rsp), %rbx	# %sfp, _170
	vinsertf128	$0x1, %xmm0, %ymm1, %ymm1	# tmp352, tmp355, vect__38.296
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmulpd	32(%r14), %ymm1, %ymm1	# MEM <vector(4) double> [(double *)vectp.291_143 + 32B], vect__38.296, vect__39.297
	vaddsd	%xmm2, %xmm1, %xmm2	# c_ij, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm0	# tmp359, stmp_c_ij_41.298
	vextractf128	$0x1, %ymm1, %xmm1	# vect__39.297, tmp361
	vaddsd	%xmm2, %xmm0, %xmm2	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vaddsd	%xmm2, %xmm1, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%rbx), %xmm2	# MEM[(double *)_172], MEM[(double *)_172]
	movq	88(%rsp), %rbx	# %sfp, _174
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vunpckhpd	%xmm1, %xmm1, %xmm1	# tmp361, stmp_c_ij_41.298
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovhpd	(%r8,%rbx), %xmm2, %xmm2	# MEM[(double *)_176], MEM[(double *)_172], tmp366
	movq	112(%rsp), %rbx	# %sfp, _162
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, c_ij
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%rbx), %xmm1	# MEM[(double *)_164], MEM[(double *)_164]
	movq	104(%rsp), %rbx	# %sfp, _166
	vmovhpd	(%r8,%rbx), %xmm1, %xmm1	# MEM[(double *)_168], MEM[(double *)_164], tmp369
	movq	64(%rsp), %rbx	# %sfp, _205
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm1	# tmp366, tmp369, vect__38.296
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmulpd	64(%r14), %ymm1, %ymm1	# MEM <vector(4) double> [(double *)vectp.291_143 + 64B], vect__38.296, vect__39.297
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, c_ij, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm2	# tmp373, stmp_c_ij_41.298
	vextractf128	$0x1, %ymm1, %xmm1	# vect__39.297, tmp375
	vaddsd	%xmm2, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%rbx), %xmm2	# MEM[(double *)_207], MEM[(double *)_207]
	movq	56(%rsp), %rbx	# %sfp, _209
	vmovhpd	(%r8,%rbx), %xmm2, %xmm2	# MEM[(double *)_211], MEM[(double *)_207], tmp380
	movq	80(%rsp), %rbx	# %sfp, _197
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm1	# tmp375, stmp_c_ij_41.298
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, c_ij
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%rbx), %xmm1	# MEM[(double *)_199], MEM[(double *)_199]
	movq	72(%rsp), %rbx	# %sfp, _201
	vmovhpd	(%r8,%rbx), %xmm1, %xmm1	# MEM[(double *)_203], MEM[(double *)_199], tmp383
	movq	32(%rsp), %rbx	# %sfp, _240
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm1	# tmp380, tmp383, vect__38.296
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmulpd	96(%r14), %ymm1, %ymm1	# MEM <vector(4) double> [(double *)vectp.291_143 + 96B], vect__38.296, vect__39.297
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, c_ij, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm2	# tmp387, stmp_c_ij_41.298
	vextractf128	$0x1, %ymm1, %xmm1	# vect__39.297, tmp389
	vaddsd	%xmm2, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%rbx), %xmm2	# MEM[(double *)_242], MEM[(double *)_242]
	movq	24(%rsp), %rbx	# %sfp, _244
	vmovhpd	(%r8,%rbx), %xmm2, %xmm2	# MEM[(double *)_246], MEM[(double *)_242], tmp394
	movq	48(%rsp), %rbx	# %sfp, _232
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm1	# tmp389, stmp_c_ij_41.298
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, c_ij
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%rbx), %xmm1	# MEM[(double *)_234], MEM[(double *)_234]
	movq	40(%rsp), %rbx	# %sfp, _236
	vmovhpd	(%r8,%rbx), %xmm1, %xmm1	# MEM[(double *)_238], MEM[(double *)_234], tmp397
	movq	(%rsp), %rbx	# %sfp, _275
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm1	# tmp394, tmp397, vect__38.296
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmulpd	128(%r14), %ymm1, %ymm1	# MEM <vector(4) double> [(double *)vectp.291_143 + 128B], vect__38.296, vect__39.297
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, c_ij, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm2	# tmp401, stmp_c_ij_41.298
	vextractf128	$0x1, %ymm1, %xmm1	# vect__39.297, tmp403
	vaddsd	%xmm2, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%rbx), %xmm2	# MEM[(double *)_277], MEM[(double *)_277]
	movq	-8(%rsp), %rbx	# %sfp, _279
	vmovhpd	(%r8,%rbx), %xmm2, %xmm2	# MEM[(double *)_281], MEM[(double *)_277], tmp408
	movq	8(%rsp), %rbx	# %sfp, _271
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm1	# tmp403, stmp_c_ij_41.298
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, c_ij
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%r11), %xmm1	# MEM[(double *)_269], MEM[(double *)_269]
	vmovhpd	(%r8,%rbx), %xmm1, %xmm1	# MEM[(double *)_273], MEM[(double *)_269], tmp411
	movq	-24(%rsp), %rbx	# %sfp, _314
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm1	# tmp408, tmp411, vect__38.296
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmulpd	160(%r14), %ymm1, %ymm1	# MEM <vector(4) double> [(double *)vectp.291_143 + 160B], vect__38.296, vect__39.297
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, c_ij, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm2	# tmp415, stmp_c_ij_41.298
	vextractf128	$0x1, %ymm1, %xmm1	# vect__39.297, tmp417
	vaddsd	%xmm2, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%r10), %xmm2	# MEM[(double *)_312], MEM[(double *)_312]
	vmovhpd	(%r8,%rbx), %xmm2, %xmm2	# MEM[(double *)_316], MEM[(double *)_312], tmp422
	movq	-16(%rsp), %rbx	# %sfp, _306
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm1	# tmp417, stmp_c_ij_41.298
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, c_ij
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%r8,%r9), %xmm1	# MEM[(double *)_304], MEM[(double *)_304]
	vmovhpd	(%r8,%rbx), %xmm1, %xmm1	# MEM[(double *)_308], MEM[(double *)_304], tmp425
	movq	136(%rsp), %rbx	# %sfp, _114
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm1	# tmp422, tmp425, vect__38.296
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmulpd	192(%r14), %ymm1, %ymm1	# MEM <vector(4) double> [(double *)vectp.291_143 + 192B], vect__38.296, vect__39.297
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, c_ij, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm2	# tmp429, stmp_c_ij_41.298
	vextractf128	$0x1, %ymm1, %xmm1	# vect__39.297, tmp431
	vaddsd	%xmm2, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%rsi,%r8), %xmm2	# MEM[(double *)_116], MEM[(double *)_116]
	vmovhpd	(%rbx,%r8), %xmm2, %xmm2	# MEM[(double *)_112], MEM[(double *)_116], tmp436
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm1	# tmp431, stmp_c_ij_41.298
	vaddsd	%xmm1, %xmm0, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, c_ij
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmovsd	(%rax,%r8), %xmm1	# MEM[(double *)_124], MEM[(double *)_124]
	movq	128(%rsp), %rbx	# %sfp, _122
	vmovhpd	(%rbx,%r8), %xmm1, %xmm1	# MEM[(double *)_120], MEM[(double *)_124], tmp439
# main.c:88:         for (int j = sj; j < sj + BLOCK_SIZE; j++) {
	movq	-56(%rsp), %rbx	# %sfp, _129
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vinsertf128	$0x1, %xmm2, %ymm1, %ymm1	# tmp436, tmp439, vect__38.296
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vmulpd	224(%r14), %ymm1, %ymm1	# MEM <vector(4) double> [(double *)vectp.291_143 + 224B], vect__38.296, vect__39.297
	vaddsd	%xmm0, %xmm1, %xmm0	# c_ij, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm1, %xmm1, %xmm2	# tmp443, stmp_c_ij_41.298
	vaddsd	%xmm0, %xmm2, %xmm2	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
	vextractf128	$0x1, %ymm1, %xmm0	# vect__39.297, tmp445
# main.c:91:                 c_ij += A[i][k] * B[k][j];
	vaddsd	%xmm2, %xmm0, %xmm1	# stmp_c_ij_41.298, stmp_c_ij_41.298, stmp_c_ij_41.298
	vunpckhpd	%xmm0, %xmm0, %xmm0	# tmp445, stmp_c_ij_41.298
	vaddsd	%xmm0, %xmm1, %xmm0	# stmp_c_ij_41.298, stmp_c_ij_41.298, c_ij
# main.c:92:             C[i][j] = c_ij;
	vmovsd	%xmm0, (%rdx,%r8)	# c_ij, MEM[(double *)_22 + ivtmp.309_157 * 1]
# main.c:88:         for (int j = sj; j < sj + BLOCK_SIZE; j++) {
	addq	$8, %r8	#, ivtmp.309
	cmpq	%rbx, %r8	# _129, ivtmp.309
	jne	.L151	#,
# main.c:87:     for (int i = si; i < si + BLOCK_SIZE; i++) {
	movq	%r12, %rbx	# ivtmp.328, ivtmp.328
	movq	192(%rsp), %r12	# %sfp, ivtmp.321
	movq	%r13, %rdx	# ivtmp.334, ivtmp.334
	movl	%ecx, %r13d	# si, si
	movq	%rdi, %rcx	# ivtmp.340, ivtmp.340
	movq	%rdx, %rdi	# ivtmp.334, ivtmp.334
	addq	$8, %r12	#, ivtmp.321
	cmpq	%rdx, %r12	# ivtmp.334, ivtmp.321
	jne	.L154	#,
# main.c:101:             for (int sk = 0; sk < M; sk += BLOCK_SIZE)
	movq	-88(%rsp), %rdx	# %sfp, ivtmp.329
	movq	16(%rsp), %rax	# %sfp, _260
	addq	$256, %rbx	#, ivtmp.328
	addq	$256, %rdx	#, ivtmp.329
	cmpq	%rax, %rbx	# _260, ivtmp.328
	jne	.L156	#,
# main.c:100:         for (int si = 0; si < N; si += BLOCK_SIZE)
	movl	%r13d, %r10d	# si, si
	movl	-76(%rsp), %r9d	# %sfp, N
	movl	-64(%rsp), %esi	# %sfp, L
# main.c:100:         for (int si = 0; si < N; si += BLOCK_SIZE)
	leaq	256(%r12), %rdi	#, ivtmp.334
# main.c:100:         for (int si = 0; si < N; si += BLOCK_SIZE)
	addl	$32, %r10d	#, si
	movq	-72(%rsp), %r11	# %sfp, B
# main.c:100:         for (int si = 0; si < N; si += BLOCK_SIZE)
	cmpl	%r10d, %r9d	# si, N
	jg	.L157	#,
# main.c:99:     for (int sj = 0; sj < L; sj += BLOCK_SIZE)
	movl	-60(%rsp), %edx	# %sfp, sj
	addl	$32, %edx	#, sj
# main.c:99:     for (int sj = 0; sj < L; sj += BLOCK_SIZE)
	cmpl	%edx, %esi	# sj, L
	jle	.L160	#,
	movq	%r8, %rbx	# ivtmp.309, ivtmp.340
	jmp	.L150	#
.L160:
	vzeroupper
.L161:
# main.c:103: }
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6649:
	.size	blocked_matrix_multiply, .-blocked_matrix_multiply
	.p2align 4
	.globl	subword_parallelism_matrix_multiply
	.type	subword_parallelism_matrix_multiply, @function
subword_parallelism_matrix_multiply:
.LFB6650:
	.cfi_startproc
	endbr64	
	movq	%rdx, %r11	# tmp134, C
	movslq	%ecx, %rdx	# tmp135,
# main.c:107:     for (int i = 0; i < L; i++) {
	testl	%edx, %edx	# L
	jle	.L176	#,
	movl	%r9d, %eax	# tmp137, N
	testl	%r9d, %r9d	# N
	jle	.L176	#,
# main.c:106: void subword_parallelism_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %r9	# A, ivtmp.364
	movq	%rsi, %r10	# tmp133, B
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r13	#
	.cfi_offset 13, -24
	leaq	(%rdi,%rdx,8), %r13	#, _72
	movslq	%r8d, %rdi	# M, M
	pushq	%r12	#
	salq	$3, %rdi	#, _47
	.cfi_offset 12, -32
	movl	%r8d, %r12d	# tmp136, M
	pushq	%rbx	#
	.cfi_offset 3, -40
	leal	-1(%rax), %ebx	#, tmp118
	shrl	$2, %ebx	#, tmp119
	addl	$1, %ebx	#,
	salq	$5, %rbx	#, _22
	.p2align 4,,10
	.p2align 3
.L166:
# main.c:106: void subword_parallelism_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	xorl	%ecx, %ecx	# ivtmp.358
	.p2align 4,,10
	.p2align 3
.L169:
# main.c:109:             __m256d c0 = _mm256_load_pd(&C[i][j]);
	movq	(%r11), %r8	# MEM[(double * *)_74], MEM[(double * *)_74]
	leaq	(%r8,%rcx), %rax	#, _67
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	vmovapd	(%rax), %ymm1	# MEM[(__m256d * {ref-all})_7], c0
# main.c:110:             for (int k = 0; k < M; k++) {
	testl	%r12d, %r12d	# M
	jle	.L167	#,
	movq	(%r9), %rsi	# MEM[(double * *)_75], MEM[(double * *)_75]
	xorl	%eax, %eax	# ivtmp.351
	.p2align 4,,10
	.p2align 3
.L168:
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	movq	(%r10,%rax), %rdx	# MEM[(double * *)B_35(D) + ivtmp.351_62 * 1], MEM[(double * *)B_35(D) + ivtmp.351_62 * 1]
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:736:   return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
	vbroadcastsd	(%rsi,%rax), %ymm0	#* ivtmp.351, tmp124
# main.c:110:             for (int k = 0; k < M; k++) {
	addq	$8, %rax	#, ivtmp.351
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:314:   return (__m256d) ((__v4df)__A * (__v4df)__B);
	vmulpd	(%rdx,%rcx), %ymm0, %ymm0	# MEM[(__m256d * {ref-all})_15], tmp124, tmp128
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:143:   return (__m256d) ((__v4df)__A + (__v4df)__B);
	vaddpd	%ymm0, %ymm1, %ymm1	# tmp128, c0, c0
# main.c:110:             for (int k = 0; k < M; k++) {
	cmpq	%rax, %rdi	# ivtmp.351, _47
	jne	.L168	#,
# main.c:115:             _mm256_store_pd(&C[i][j], c0);
	leaq	(%r8,%rcx), %rax	#, _67
.L167:
# main.c:108:         for (int j = 0; j < N; j += MM256_STRIDE) {
	addq	$32, %rcx	#, ivtmp.358
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:875:   *(__m256d *)__P = __A;
	vmovapd	%ymm1, (%rax)	# c0, MEM[(__m256d * {ref-all})prephitmp_68]
# main.c:108:         for (int j = 0; j < N; j += MM256_STRIDE) {
	cmpq	%rcx, %rbx	# ivtmp.358, _22
	jne	.L169	#,
# main.c:107:     for (int i = 0; i < L; i++) {
	addq	$8, %r9	#, ivtmp.364
	addq	$8, %r11	#, ivtmp.363
	cmpq	%r13, %r9	# _72, ivtmp.364
	jne	.L166	#,
	vzeroupper
# main.c:118: }
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
.L176:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	ret	
	.cfi_endproc
.LFE6650:
	.size	subword_parallelism_matrix_multiply, .-subword_parallelism_matrix_multiply
	.p2align 4
	.globl	combined_matrix_multiply
	.type	combined_matrix_multiply, @function
combined_matrix_multiply:
.LFB6651:
	.cfi_startproc
	endbr64	
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 64
# main.c:121: void combined_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
	movq	%rax, 40(%rsp)	# tmp98, D.41485
	xorl	%eax, %eax	# tmp98
# main.c:122:     #pragma omp parallel for schedule(dynamic)
	movl	%ecx, 24(%rsp)	# tmp95, .omp_data_o.7.L
	xorl	%ecx, %ecx	#
	movq	%rdx, 16(%rsp)	# tmp94, .omp_data_o.7.C
	xorl	%edx, %edx	#
	movq	%rsi, 8(%rsp)	# tmp93, .omp_data_o.7.B
	movq	%rsp, %rsi	#, tmp89
	movq	%rdi, (%rsp)	# tmp92, .omp_data_o.7.A
	leaq	combined_matrix_multiply._omp_fn.0(%rip), %rdi	#, tmp90
	movl	%r9d, 32(%rsp)	# tmp97, .omp_data_o.7.N
	movl	%r8d, 28(%rsp)	# tmp96, .omp_data_o.7.M
	call	GOMP_parallel@PLT	#
# main.c:146: }
	movq	40(%rsp), %rax	# D.41485, tmp99
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp99
	jne	.L183	#,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L183:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE6651:
	.size	combined_matrix_multiply, .-combined_matrix_multiply
	.p2align 4
	.globl	free_matrices
	.type	free_matrices, @function
free_matrices:
.LFB6652:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13	# tmp110, A
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	# tmp111, B
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	%r8d, %rbp	# tmp114,
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 80
# main.c:148: void free_matrices(double **A, double **B, double **C, int L, int M, int N) {
	movq	%rdx, 8(%rsp)	# C, %sfp
# main.c:149:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	testl	%ecx, %ecx	# L
	jle	.L185	#,
	movslq	%ecx, %rcx	# L, L
	movq	%rdi, %r14	# A, ivtmp.382
	movq	%rdx, %rbx	# C, ivtmp.383
	leaq	(%rdi,%rcx,8), %r15	#, _52
	.p2align 4,,10
	.p2align 3
.L186:
# main.c:149:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	movq	(%r14), %rdi	# MEM[(double * *)_47], MEM[(double * *)_47]
# main.c:149:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	addq	$8, %r14	#, ivtmp.382
	addq	$8, %rbx	#, ivtmp.383
# main.c:149:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	call	free@PLT	#
# main.c:149:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	movq	-8(%rbx), %rdi	# MEM[(double * *)_48], MEM[(double * *)_48]
	call	free@PLT	#
# main.c:149:     for (int i = 0; i < L; i++) { free(A[i]); free(C[i]); }
	cmpq	%r15, %r14	# _52, ivtmp.382
	jne	.L186	#,
.L185:
# main.c:150:     for (int i = 0; i < M; i++)   free(B[i]);
	testl	%ebp, %ebp	# M
	jle	.L187	#,
	movq	%r12, %rbx	# B, ivtmp.377
	leaq	(%r12,%rbp,8), %rbp	#, _29
	.p2align 4,,10
	.p2align 3
.L188:
# main.c:150:     for (int i = 0; i < M; i++)   free(B[i]);
	movq	(%rbx), %rdi	# MEM[(double * *)_39], MEM[(double * *)_39]
# main.c:150:     for (int i = 0; i < M; i++)   free(B[i]);
	addq	$8, %rbx	#, ivtmp.377
# main.c:150:     for (int i = 0; i < M; i++)   free(B[i]);
	call	free@PLT	#
# main.c:150:     for (int i = 0; i < M; i++)   free(B[i]);
	cmpq	%rbx, %rbp	# ivtmp.377, _29
	jne	.L188	#,
.L187:
# main.c:151:     free(A); free(B); free(C);
	movq	%r13, %rdi	# A,
	call	free@PLT	#
# main.c:151:     free(A); free(B); free(C);
	movq	%r12, %rdi	# B,
	call	free@PLT	#
# main.c:151:     free(A); free(B); free(C);
	movq	8(%rsp), %rdi	# %sfp,
# main.c:152: }
	addq	$24, %rsp	#,
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# main.c:151:     free(A); free(B); free(C);
	jmp	free@PLT	#
	.cfi_endproc
.LFE6652:
	.size	free_matrices, .-free_matrices
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"ERROR: incorrect number of arguments"
	.section	.rodata.str1.1
.LC5:
	.string	"ERROR: invalid arguments"
.LC7:
	.string	"ERROR: unknown method %d\n"
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"L = %d, M = %d, N = %d, METHOD = %d, EXEC TIME: %ld.%06ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB6653:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp	#,
	.cfi_def_cfa_offset 224
# main.c:154: int main(int argc, char **argv) {
	movq	%rsi, 64(%rsp)	# tmp277, %sfp
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp299
	movq	%rax, 152(%rsp)	# tmp299, D.41564
	xorl	%eax, %eax	# tmp299
# main.c:159:     if (argc != 6) {
	cmpl	$6, %edi	#, tmp276
	jne	.L243	#,
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_78(D) + 8B], MEM[(char * *)argv_78(D) + 8B]
	movq	%rsi, %r15	# tmp277, argv
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	call	strtol@PLT	#
	movq	16(%r15), %rdi	# MEM[(char * *)argv_78(D) + 16B], MEM[(char * *)argv_78(D) + 16B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	movq	%rax, %r12	# tmp278, _123
	movq	%rax, 40(%rsp)	# _123, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, 72(%rsp)	# tmp342, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
	movq	24(%r15), %rdi	# MEM[(char * *)argv_78(D) + 24B], MEM[(char * *)argv_78(D) + 24B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	movq	%rax, %r13	# tmp279, _121
	movq	%rax, 16(%rsp)	# _121, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, %ebp	# _121, _122
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
	movq	32(%r15), %rdi	# MEM[(char * *)argv_78(D) + 32B], MEM[(char * *)argv_78(D) + 32B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	movq	%rax, 24(%rsp)	# _119, %sfp
	movq	%rax, %r14	# tmp280, _119
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, 76(%rsp)	# tmp345, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
	movq	40(%r15), %rdi	# MEM[(char * *)argv_78(D) + 40B], MEM[(char * *)argv_78(D) + 40B]
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	movq	%rax, %rbx	# tmp281, _118
	call	strtol@PLT	#
# main.c:169:     srand(seed);
	movl	%ebx, %edi	# _118, _118
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	%rax, 56(%rsp)	# _116, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, 92(%rsp)	# tmp348, %sfp
# main.c:169:     srand(seed);
	call	srand@PLT	#
# main.c:171:     if (!L || !M || !N) {
	testl	%r12d, %r12d	# _123
	sete	%al	#, tmp193
# main.c:171:     if (!L || !M || !N) {
	testl	%r13d, %r13d	# _121
	sete	%dl	#, tmp195
# main.c:171:     if (!L || !M || !N) {
	orb	%dl, %al	# tmp195, tmp300
	jne	.L228	#,
	testl	%r14d, %r14d	# _119
	je	.L228	#,
# main.c:176:     omp_set_num_threads(OMP_THREADS);
	movl	$4, %edi	#,
	call	omp_set_num_threads@PLT	#
# main.c:178:     A = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movq	40(%rsp), %rbx	# %sfp, _123
	movl	$32, %edi	#,
	movslq	%ebx, %rax	# _123, _124
	leaq	0(,%rax,8), %r15	#, _13
	movq	%r15, %rsi	# _13,
	call	aligned_alloc@PLT	#
# main.c:182:     B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
	movslq	16(%rsp), %r14	# %sfp, _122
# main.c:178:     A = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movq	%rax, 48(%rsp)	# A, %sfp
	movq	%rax, %rcx	# tmp283, A
# main.c:182:     B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
	salq	$3, %r14	#, _212
# main.c:179:     for (int i = 0; i < L; i++)
	testl	%ebx, %ebx	# _123
	jle	.L196	#,
	movq	%rax, %r13	# A, ivtmp.430
	movl	%ebx, %eax	# _123, tmp350
	subl	$1, %eax	#,
	movl	%eax, 12(%rsp)	# tmp272, %sfp
	leaq	8(%rcx,%rax,8), %rbx	#, _235
	.p2align 4,,10
	.p2align 3
.L197:
# main.c:180:         A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
	movq	%r14, %rsi	# _212,
	movl	$32, %edi	#,
# main.c:179:     for (int i = 0; i < L; i++)
	addq	$8, %r13	#, ivtmp.430
# main.c:180:         A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
	call	aligned_alloc@PLT	#
# main.c:180:         A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
	movq	%rax, -8(%r13)	# tmp284, MEM[(double * *)_228]
# main.c:179:     for (int i = 0; i < L; i++)
	cmpq	%rbx, %r13	# _235, ivtmp.430
	jne	.L197	#,
# main.c:182:     B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
	movq	%r14, %rsi	# _212,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
# main.c:183:     for (int i = 0; i < M; i++)
	movl	16(%rsp), %esi	# %sfp,
# main.c:182:     B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
	movq	%rax, 32(%rsp)	# tmp286, %sfp
# main.c:183:     for (int i = 0; i < M; i++)
	testl	%esi, %esi	#
	jle	.L201	#,
.L199:
# main.c:184:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movslq	24(%rsp), %rax	# %sfp, _120
	movq	32(%rsp), %r13	# %sfp, B
	xorl	%r12d, %r12d	# ivtmp.423
	movq	%rax, 80(%rsp)	# _120, %sfp
	leaq	0(,%rax,8), %rbx	#, _23
	.p2align 4,,10
	.p2align 3
.L202:
	movq	%rbx, %rsi	# _23,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
# main.c:184:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, 0(%r13,%r12,8)	# tmp287, MEM[(double * *)B_69 + ivtmp.423_222 * 8]
# main.c:183:     for (int i = 0; i < M; i++)
	addq	$1, %r12	#, ivtmp.423
	cmpl	%r12d, %ebp	# ivtmp.423, _122
	jg	.L202	#,
# main.c:186:     for (int i = 0; i < L; i++)
	movq	40(%rsp), %rax	# %sfp, _123
	testl	%eax, %eax	# _123
	jle	.L205	#,
	movq	48(%rsp), %rcx	# %sfp, A
	subl	$1, %eax	#,
	vmovsd	.LC3(%rip), %xmm7	#, tmp274
	movl	%ebp, 88(%rsp)	# _122, %sfp
	movl	%eax, 12(%rsp)	# tmp272, %sfp
	leaq	8(%rcx,%rax,8), %r13	#, _220
	movq	16(%rsp), %rax	# %sfp, _121
	vmovsd	%xmm7, (%rsp)	# tmp274, %sfp
	movq	%rcx, %rbp	# ivtmp.421, ivtmp.421
	subl	$1, %eax	#, tmp218
	leaq	8(,%rax,8), %rbx	#, _59
	.p2align 4,,10
	.p2align 3
.L206:
# main.c:184:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	xorl	%r14d, %r14d	# ivtmp.416
	.p2align 4,,10
	.p2align 3
.L207:
# main.c:188:             A[i][j] = drand(MIN, MAX);
	movq	0(%rbp), %r12	# MEM[(double * *)_221], _34
# main.c:48:     double r = (double)rand() / RAND_MAX;
	call	rand@PLT	#
# main.c:48:     double r = (double)rand() / RAND_MAX;
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp365
# main.c:49:     return r * (max - min) + min;
	vxorpd	%xmm3, %xmm3, %xmm3	# tmp367
# main.c:48:     double r = (double)rand() / RAND_MAX;
	vcvtsi2sdl	%eax, %xmm1, %xmm0	# tmp289, tmp365, tmp297
# main.c:48:     double r = (double)rand() / RAND_MAX;
	vdivsd	(%rsp), %xmm0, %xmm0	# %sfp, tmp221, r
# main.c:49:     return r * (max - min) + min;
	vaddsd	%xmm3, %xmm0, %xmm0	# tmp367, r, tmp224
# main.c:188:             A[i][j] = drand(MIN, MAX);
	addq	%r14, %r12	# ivtmp.416, _34
# main.c:187:         for (int j = 0; j < M; j++)
	addq	$8, %r14	#, ivtmp.416
# main.c:188:             A[i][j] = drand(MIN, MAX);
	vmovsd	%xmm0, (%r12)	# tmp224, *_34
# main.c:187:         for (int j = 0; j < M; j++)
	cmpq	%r14, %rbx	# ivtmp.416, _59
	jne	.L207	#,
# main.c:186:     for (int i = 0; i < L; i++)
	addq	$8, %rbp	#, ivtmp.421
	cmpq	%r13, %rbp	# _220, ivtmp.421
	jne	.L206	#,
	movl	24(%rsp), %eax	# %sfp,
	movl	88(%rsp), %ebp	# %sfp, _122
	testl	%eax, %eax	#
	jle	.L244	#,
.L209:
	movl	24(%rsp), %eax	# %sfp, tmp372
	movq	32(%rsp), %rbx	# %sfp, ivtmp.412
	movl	%ebp, 12(%rsp)	# _122, %sfp
# main.c:189:     for (int i = 0; i < M; i++)
	xorl	%r14d, %r14d	# i
	subl	$1, %eax	#,
	movl	%eax, 88(%rsp)	# tmp271, %sfp
	leaq	8(,%rax,8), %r12	#, _49
	.p2align 4,,10
	.p2align 3
.L211:
# main.c:184:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	xorl	%r13d, %r13d	# ivtmp.407
	.p2align 4,,10
	.p2align 3
.L212:
# main.c:191:             B[i][j] = drand(MIN, MAX);
	movq	(%rbx), %rbp	# MEM[(double * *)_209], _41
# main.c:48:     double r = (double)rand() / RAND_MAX;
	call	rand@PLT	#
# main.c:48:     double r = (double)rand() / RAND_MAX;
	vxorpd	%xmm4, %xmm4, %xmm4	# tmp375
# main.c:49:     return r * (max - min) + min;
	vxorpd	%xmm6, %xmm6, %xmm6	# tmp377
# main.c:48:     double r = (double)rand() / RAND_MAX;
	vcvtsi2sdl	%eax, %xmm4, %xmm0	# tmp292, tmp375, tmp298
# main.c:48:     double r = (double)rand() / RAND_MAX;
	vdivsd	(%rsp), %xmm0, %xmm0	# %sfp, tmp232, r
# main.c:49:     return r * (max - min) + min;
	vaddsd	%xmm6, %xmm0, %xmm0	# tmp377, r, tmp235
# main.c:191:             B[i][j] = drand(MIN, MAX);
	addq	%r13, %rbp	# ivtmp.407, _41
# main.c:190:         for (int j = 0; j < N; j++)
	addq	$8, %r13	#, ivtmp.407
# main.c:191:             B[i][j] = drand(MIN, MAX);
	vmovsd	%xmm0, 0(%rbp)	# tmp235, *_41
# main.c:190:         for (int j = 0; j < N; j++)
	cmpq	%r13, %r12	# ivtmp.407, _49
	jne	.L212	#,
# main.c:189:     for (int i = 0; i < M; i++)
	movl	12(%rsp), %eax	# %sfp, _122
# main.c:189:     for (int i = 0; i < M; i++)
	addl	$1, %r14d	#, i
# main.c:189:     for (int i = 0; i < M; i++)
	addq	$8, %rbx	#, ivtmp.412
	cmpl	%eax, %r14d	# _122, i
	jl	.L211	#,
# main.c:193:     C = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movq	%r15, %rsi	# _13,
	movl	$32, %edi	#,
	movl	%eax, %ebp	# _122, _122
	call	aligned_alloc@PLT	#
	movq	%rax, %r15	# tmp293, C
	movq	40(%rsp), %rax	# %sfp, _123
	leal	-1(%rax), %ecx	#, tmp272
	movl	%ecx, 12(%rsp)	# tmp272, %sfp
# main.c:194:     for (int i = 0; i < L; i++) {
	testl	%eax, %eax	# _123
	jle	.L210	#,
.L204:
	movl	12(%rsp), %r12d	# %sfp, tmp240
# main.c:195:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	80(%rsp), %r13	# %sfp, _120
# main.c:196:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	movq	%r15, (%rsp)	# C, %sfp
	movq	%r15, %rbx	# C, ivtmp.402
	movl	88(%rsp), %r14d	# %sfp, tmp244
	leaq	8(%r15,%r12,8), %r12	#, _173
	movl	76(%rsp), %r15d	# %sfp, _120
# main.c:195:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	salq	$3, %r13	#, _120
# main.c:196:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	leaq	8(,%r14,8), %r14	#, _200
	.p2align 4,,10
	.p2align 3
.L214:
# main.c:195:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movl	$32, %edi	#,
	movq	%r13, %rsi	# _43,
	call	aligned_alloc@PLT	#
# main.c:195:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, (%rbx)	# tmp246, MEM[(double * *)_161]
# main.c:195:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, %rdi	# tmp294, tmp246
# main.c:196:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	testl	%r15d, %r15d	# _120
	jle	.L215	#,
# main.c:196:         for (int j = 0; j < N; j++) C[i][j] = 0.0;
	movq	%r14, %rdx	# _200,
	xorl	%esi, %esi	#
	call	memset@PLT	#
.L215:
# main.c:194:     for (int i = 0; i < L; i++) {
	addq	$8, %rbx	#, ivtmp.402
	cmpq	%r12, %rbx	# _173, ivtmp.402
	jne	.L214	#,
	movq	(%rsp), %r15	# %sfp, C
.L210:
# main.c:205:     gettimeofday(&start, NULL);
	leaq	96(%rsp), %rdi	#, tmp251
	xorl	%esi, %esi	#
	call	gettimeofday@PLT	#
# main.c:207:     switch (method) {
	movq	56(%rsp), %rax	# %sfp, _116
	cmpl	$5, %eax	#, _116
	ja	.L216	#,
	leaq	.L218(%rip), %rdx	#, tmp253
	movl	%eax, %eax	# _116, _117
	movslq	(%rdx,%rax,4), %rax	#, tmp255
	addq	%rdx, %rax	# tmp253, tmp256
	notrack jmp	*%rax	# tmp256
	.section	.rodata
	.align 4
	.align 4
.L218:
	.long	.L223-.L218
	.long	.L222-.L218
	.long	.L221-.L218
	.long	.L220-.L218
	.long	.L219-.L218
	.long	.L217-.L218
	.section	.text.startup
.L219:
# main.c:212:         case METHOD_SIMD:      subword_parallelism_matrix_multiply(A, B, C, L, M, N); break;
	movl	24(%rsp), %r9d	# %sfp,
	movl	16(%rsp), %r8d	# %sfp,
	movq	%r15, %rdx	# C,
	leaq	112(%rsp), %rbx	#, tmp275
	movl	72(%rsp), %ecx	# %sfp,
	movq	32(%rsp), %rsi	# %sfp,
	movq	48(%rsp), %rdi	# %sfp,
	call	subword_parallelism_matrix_multiply	#
	.p2align 4,,10
	.p2align 3
.L224:
# main.c:219:     gettimeofday(&stop, NULL);
	xorl	%esi, %esi	#
	movq	%rbx, %rdi	# tmp275,
	call	gettimeofday@PLT	#
# main.c:220:     timersub(&stop, &start, &total);
	movq	112(%rsp), %rdx	# MEM[(struct timeval *)_171].tv_sec, MEM[(struct timeval *)_171].tv_sec
	movq	120(%rsp), %rax	# MEM[(struct timeval *)_171].tv_usec, MEM[(struct timeval *)_171].tv_usec
	subq	96(%rsp), %rdx	# start.tv_sec, total$tv_sec
	subq	104(%rsp), %rax	# start.tv_usec, total$tv_usec
	jns	.L225	#,
# main.c:220:     timersub(&stop, &start, &total);
	subq	$1, %rdx	#, total$tv_sec
	addq	$1000000, %rax	#, total$tv_usec
.L225:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	pushq	%rax	# total$tv_usec
	.cfi_def_cfa_offset 232
	movl	%ebp, %ecx	# _122,
	leaq	.LC8(%rip), %rsi	#, tmp267
	movl	$2, %edi	#,
	pushq	%rdx	# total$tv_sec
	.cfi_def_cfa_offset 240
	movq	40(%rsp), %r14	# %sfp, _119
	xorl	%eax, %eax	#
	movl	88(%rsp), %ebx	# %sfp, _124
	movl	72(%rsp), %r9d	# %sfp,
	movl	%r14d, %r8d	# _119,
	movl	%ebx, %edx	# _124,
	call	__printf_chk@PLT	#
# main.c:227:     free_matrices(A, B, C, L, M, N);
	movl	32(%rsp), %r8d	# %sfp,
	movl	%ebx, %ecx	# _124,
	movq	%r15, %rdx	# C,
	movq	48(%rsp), %rsi	# %sfp,
	movq	64(%rsp), %rdi	# %sfp,
	movl	%r14d, %r9d	# _119,
	call	free_matrices	#
# main.c:229: }
	popq	%rdx	#
	.cfi_def_cfa_offset 232
	popq	%rcx	#
	.cfi_def_cfa_offset 224
	movq	152(%rsp), %rax	# D.41564, tmp301
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp301
	jne	.L245	#,
	addq	$168, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
.L217:
	.cfi_restore_state
# main.c:122:     #pragma omp parallel for schedule(dynamic)
	movl	24(%rsp), %eax	# %sfp, tmp388
	leaq	112(%rsp), %rbx	#, tmp275
	xorl	%ecx, %ecx	#
	xorl	%edx, %edx	#
	movq	%rbx, %rsi	# tmp275,
	leaq	combined_matrix_multiply._omp_fn.0(%rip), %rdi	#, tmp262
	movq	%r15, 128(%rsp)	# C, MEM[(struct .omp_data_s.5 *)_171].C
	movl	%eax, 144(%rsp)	# tmp388, MEM[(struct .omp_data_s.5 *)_171].N
	movl	16(%rsp), %eax	# %sfp, tmp389
	movl	%eax, 140(%rsp)	# tmp389, MEM[(struct .omp_data_s.5 *)_171].M
	movl	40(%rsp), %eax	# %sfp, tmp390
	movl	%eax, 136(%rsp)	# tmp390, MEM[(struct .omp_data_s.5 *)_171].L
	movq	32(%rsp), %rax	# %sfp, B
	movq	%rax, 120(%rsp)	# B, MEM[(struct .omp_data_s.5 *)_171].B
	movq	48(%rsp), %rax	# %sfp, A
	movq	%rax, 112(%rsp)	# A, MEM[(struct .omp_data_s.5 *)_171].A
	call	GOMP_parallel@PLT	#
# main.c:146: }
	jmp	.L224	#
.L223:
# main.c:208:         case METHOD_BASELINE:  matrix_multiply(A, B, C, L, M, N);                    break;
	movl	24(%rsp), %r9d	# %sfp,
	movl	16(%rsp), %r8d	# %sfp,
	movq	%r15, %rdx	# C,
	leaq	112(%rsp), %rbx	#, tmp275
	movl	72(%rsp), %ecx	# %sfp,
	movq	32(%rsp), %rsi	# %sfp,
	movq	48(%rsp), %rdi	# %sfp,
	call	matrix_multiply	#
# main.c:208:         case METHOD_BASELINE:  matrix_multiply(A, B, C, L, M, N);                    break;
	jmp	.L224	#
.L222:
# main.c:209:         case METHOD_UNROLLED:  unrolled_matrix_multiply(A, B, C, L, M, N);            break;
	movl	24(%rsp), %r9d	# %sfp,
	movl	16(%rsp), %r8d	# %sfp,
	movq	%r15, %rdx	# C,
	leaq	112(%rsp), %rbx	#, tmp275
	movl	72(%rsp), %ecx	# %sfp,
	movq	32(%rsp), %rsi	# %sfp,
	movq	48(%rsp), %rdi	# %sfp,
	call	unrolled_matrix_multiply	#
# main.c:209:         case METHOD_UNROLLED:  unrolled_matrix_multiply(A, B, C, L, M, N);            break;
	jmp	.L224	#
.L221:
# main.c:78:     #pragma omp parallel for
	movl	24(%rsp), %eax	# %sfp, tmp384
	vmovd	40(%rsp), %xmm7	# %sfp, tmp385
	xorl	%ecx, %ecx	#
	xorl	%edx, %edx	#
	vpinsrd	$1, 16(%rsp), %xmm7, %xmm0	# %sfp, tmp385, tmp258
	leaq	112(%rsp), %rbx	#, tmp275
	leaq	multicore_matrix_multiply._omp_fn.0(%rip), %rdi	#, tmp260
	movq	%r15, 128(%rsp)	# C, MEM[(struct .omp_data_s.0 *)_171].C
	movl	%eax, 144(%rsp)	# tmp384, MEM[(struct .omp_data_s.0 *)_171].N
	movq	32(%rsp), %rax	# %sfp, B
	movq	%rbx, %rsi	# tmp275,
	vmovq	%xmm0, 136(%rsp)	# tmp258, MEM <vector(2) int> [(int *)_171]
	movq	%rax, 120(%rsp)	# B, MEM[(struct .omp_data_s.0 *)_171].B
	movq	48(%rsp), %rax	# %sfp, A
	movq	%rax, 112(%rsp)	# A, MEM[(struct .omp_data_s.0 *)_171].A
	call	GOMP_parallel@PLT	#
# main.c:83: }
	jmp	.L224	#
.L220:
# main.c:211:         case METHOD_BLOCKED:   blocked_matrix_multiply(A, B, C, L, M, N);             break;
	movl	24(%rsp), %r9d	# %sfp,
	movl	16(%rsp), %r8d	# %sfp,
	movq	%r15, %rdx	# C,
	leaq	112(%rsp), %rbx	#, tmp275
	movl	72(%rsp), %ecx	# %sfp,
	movq	32(%rsp), %rsi	# %sfp,
	movq	48(%rsp), %rdi	# %sfp,
	call	blocked_matrix_multiply	#
# main.c:211:         case METHOD_BLOCKED:   blocked_matrix_multiply(A, B, C, L, M, N);             break;
	jmp	.L224	#
.L196:
# main.c:182:     B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
	movq	%r14, %rsi	# _212,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
# main.c:183:     for (int i = 0; i < M; i++)
	cmpl	$0, 16(%rsp)	#, %sfp
# main.c:182:     B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
	movq	%rax, 32(%rsp)	# tmp285, %sfp
# main.c:183:     for (int i = 0; i < M; i++)
	jg	.L199	#,
.L238:
# main.c:193:     C = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movq	%r15, %rsi	# _13,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, %r15	# tmp295, C
	jmp	.L210	#
.L201:
	movq	%r15, %rsi	# _13,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, %r15	# tmp288, C
	movq	24(%rsp), %rax	# %sfp, _119
	movslq	%eax, %rcx	# _119, _120
	subl	$1, %eax	#, tmp271
	movq	%rcx, 80(%rsp)	# _120, %sfp
	movl	%eax, 88(%rsp)	# tmp271, %sfp
	jmp	.L204	#
.L244:
	movq	%r15, %rsi	# _13,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, %r15	# tmp290, C
	movq	24(%rsp), %rax	# %sfp, _119
	subl	$1, %eax	#, tmp271
	movl	%eax, 88(%rsp)	# tmp271, %sfp
	jmp	.L204	#
.L205:
	vmovsd	.LC3(%rip), %xmm7	#, tmp274
	cmpl	$0, 24(%rsp)	#, %sfp
	vmovsd	%xmm7, (%rsp)	# tmp274, %sfp
	jg	.L209	#,
	jmp	.L238	#
.L245:
# main.c:229: }
	call	__stack_chk_fail@PLT	#
.L228:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC5(%rip), %rdi	#, tmp199
	call	puts@PLT	#
# main.c:173:         print_help_and_exit(argv);
	movq	64(%rsp), %rdi	# %sfp,
	call	print_help_and_exit	#
.L243:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC4(%rip), %rdi	#, tmp185
	call	puts@PLT	#
# main.c:161:         print_help_and_exit(argv);
	movq	64(%rsp), %rdi	# %sfp,
	call	print_help_and_exit	#
.L216:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	92(%rsp), %edx	# %sfp,
	movl	$2, %edi	#,
	leaq	.LC7(%rip), %rsi	#, tmp263
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# main.c:216:             print_help_and_exit(argv);
	movq	64(%rsp), %rdi	# %sfp,
	call	print_help_and_exit	#
	.cfi_endproc
.LFE6653:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	-4194304
	.long	1105199103
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
