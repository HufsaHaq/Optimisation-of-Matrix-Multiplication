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
# main.c:104:     #pragma omp parallel for
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
# main.c:111:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%r12,%r11,8), %r13	# MEM[(double * *)C_15 + ivtmp.54_79 * 8], _31
# main.c:111:                 C[i][j] += A[i][k] * B[k][j];
	movq	0(%rbp,%r11,8), %rdi	# MEM[(double * *)A_17 + ivtmp.54_79 * 8], _37
	xorl	%ecx, %ecx	# ivtmp.51
	.p2align 4,,10
	.p2align 3
.L7:
# main.c:111:                 C[i][j] += A[i][k] * B[k][j];
	leaq	0(%r13,%rcx), %rsi	#, _34
	xorl	%eax, %eax	# ivtmp.46
	vmovsd	(%rsi), %xmm1	# *_34, _47
	.p2align 4,,10
	.p2align 3
.L5:
# main.c:111:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%r9,%rax), %rdx	# MEM[(double * *)B_16 + ivtmp.46_89 * 1], MEM[(double * *)B_16 + ivtmp.46_89 * 1]
# main.c:111:                 C[i][j] += A[i][k] * B[k][j];
	vmovsd	(%rdx,%rcx), %xmm0	# *_44, *_44
	vmulsd	(%rdi,%rax), %xmm0, %xmm0	# MEM[(double *)_37 + ivtmp.46_89 * 1], *_44, tmp122
# main.c:110:             for(int k=0; k<M; k++){
	addq	$8, %rax	#, ivtmp.46
# main.c:111:                 C[i][j] += A[i][k] * B[k][j];
	vaddsd	%xmm0, %xmm1, %xmm1	# tmp122, _47, _47
	vmovsd	%xmm1, (%rsi)	# _47, *_34
# main.c:110:             for(int k=0; k<M; k++){
	cmpq	%rax, %r8	# ivtmp.46, _84
	jne	.L5	#,
# main.c:108:         for(int j=0; j<N; j++) {
	addq	$8, %rcx	#, ivtmp.51
	cmpq	%rcx, %r10	# ivtmp.51, _80
	jne	.L7	#,
	addq	$1, %r11	#, ivtmp.54
	cmpl	%r11d, %ebx	# ivtmp.54, _25
	jg	.L6	#,
.L14:
# main.c:104:     #pragma omp parallel for
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
# main.c:104:     #pragma omp parallel for
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
# main.c:175:     #pragma omp parallel for schedule(dynamic)
	movl	32(%rdi), %esi	# *.omp_data_i_18(D).N, N
	movq	(%rdi), %rax	# *.omp_data_i_18(D).A, A
# main.c:175:     #pragma omp parallel for schedule(dynamic)
	movq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp358
	movq	%rdx, 248(%rsp)	# tmp358, D.41304
	xorl	%edx, %edx	# tmp358
# main.c:175:     #pragma omp parallel for schedule(dynamic)
	movl	28(%rdi), %ebx	# *.omp_data_i_18(D).M, M
	movq	16(%rdi), %r13	# *.omp_data_i_18(D).C, C
	movl	$128, %edx	#,
	movl	%esi, 108(%rsp)	# N, %sfp
	movslq	24(%rdi), %rsi	# *.omp_data_i_18(D).L,
	leaq	240(%rsp), %r9	#, tmp329
	movq	%rax, 96(%rsp)	# A, %sfp
	leaq	232(%rsp), %rax	#, tmp328
	movq	8(%rdi), %r14	# *.omp_data_i_18(D).B, B
	xorl	%edi, %edi	#
	movq	%rax, %r8	# tmp328,
	movq	%r9, 80(%rsp)	# tmp329, %sfp
	movq	%rsi, %r12	#,
	movq	%rax, 88(%rsp)	# tmp328, %sfp
	call	GOMP_loop_nonmonotonic_dynamic_start@PLT	#
	testb	%al, %al	# tmp356
	jne	.L22	#,
.L18:
	call	GOMP_loop_end_nowait@PLT	#
# main.c:175:     #pragma omp parallel for schedule(dynamic)
	movq	248(%rsp), %rax	# D.41304, tmp360
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
# main.c:193:                         for (int j=j_vec_end; j<j_end; j++)
	cmpl	%r14d, %r11d	# _6, j_end
	jle	.L81	#,
	.p2align 4,,10
	.p2align 3
.L31:
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	movq	0(%r13), %rcx	# MEM[(double * *)_180], _61
	cmpl	$1, 192(%rsp)	#, %sfp
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	movq	(%rsi), %rax	# MEM[(double * *)_266], _56
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	movq	(%rdx), %r8	# MEM[(double * *)_157], _65
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
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
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	xorl	%ecx, %ecx	# ivtmp.115
	.p2align 4,,10
	.p2align 3
.L35:
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	vmulpd	(%r12,%rcx), %ymm1, %ymm0	# MEM <vector(4) double> [(double *)vectp.79_199 + ivtmp.115_124 * 1], vect_cst__198, vect__68.81
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
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
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	vmovddup	(%rdi), %xmm0	# *_62, tmp306
	addq	%r12, %rbx	# _176, tmp304
	vmulpd	(%r8,%rbx,8), %xmm0, %xmm0	# MEM <vector(2) double> [(double *)vectp.93_253], tmp306, vect__99.95
	leaq	(%rax,%rbx,8), %r12	#, vectp.90
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	vaddpd	(%r12), %xmm0, %xmm0	# MEM <vector(2) double> [(double *)vectp.90_243], vect__99.95, vect__95.96
	vmovupd	%xmm0, (%r12)	# vect__95.96, MEM <vector(2) double> [(double *)vectp.90_243]
	testb	$1, %cl	#, niters.85
	je	.L37	#,
	movl	164(%rsp), %ebx	# %sfp, j
	andl	$-2, %ecx	#, niters_vector_mult_vf.87
	addl	%ebx, %ecx	# j, tmp.88
.L39:
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	movslq	%ecx, %rcx	# tmp.88, tmp.88
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	vmovsd	(%r8,%rcx,8), %xmm0	# *_226, *_226
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	leaq	(%rax,%rcx,8), %rax	#, _223
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	vmulsd	(%rdi), %xmm0, %xmm0	# *_62, *_226, tmp313
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	vaddsd	(%rax), %xmm0, %xmm0	# *_223, tmp313, tmp315
	vmovsd	%xmm0, (%rax)	# tmp315, *_223
.L37:
# main.c:183:                     for (int k=sk; k<k_end; k++) {
	movq	184(%rsp), %rax	# %sfp, _155
	addq	$8, %rdx	#, ivtmp.134
	cmpq	%rax, %rdx	# _155, ivtmp.134
	jne	.L28	#,
# main.c:182:                 for (int i=si; i<i_end; i++) {
	movq	136(%rsp), %rax	# %sfp, _265
	addq	$8, %rsi	#, ivtmp.142
	addq	$8, %r13	#, ivtmp.143
	cmpq	%rax, %rsi	# _265, ivtmp.142
	jne	.L26	#,
# main.c:178:             for (int sj=0; sj<N; sj+=BLOCK_SIZE) {
	subq	$-128, 112(%rsp)	#, %sfp
	movq	%rax, %r8	# _265, _265
	movq	120(%rsp), %rdi	# %sfp, _282
	movq	128(%rsp), %rax	# %sfp, _279
	movq	24(%rsp), %rbx	# %sfp, ivtmp.165
	movq	16(%rsp), %r15	# %sfp, ivtmp.166
	movq	112(%rsp), %rsi	# %sfp, ivtmp.151
	addq	$1024, 200(%rsp)	#, %sfp
	cmpl	%esi, 108(%rsp)	# tmp487, %sfp
	jg	.L29	#,
	movq	%rbx, %r10	# ivtmp.165, ivtmp.165
	movq	48(%rsp), %r13	# %sfp, C
	movq	40(%rsp), %r14	# %sfp, B
	movq	32(%rsp), %rcx	# %sfp, ivtmp.158
	movl	60(%rsp), %ebx	# %sfp, M
.L24:
# main.c:177:         for (int sk=0; sk<M; sk+=BLOCK_SIZE) {
	subq	$-128, %rcx	#, ivtmp.158
	cmpl	%ecx, %ebx	# ivtmp.158, M
	jg	.L27	#,
	movl	104(%rsp), %r12d	# %sfp, L
	movl	76(%rsp), %eax	# %sfp, _31
	movq	%r10, %r11	# ivtmp.165, ivtmp.165
	movq	64(%rsp), %rdi	# %sfp, ivtmp.167
	movl	72(%rsp), %esi	# %sfp, si
.L21:
	movl	%esi, %edx	# si, si
	addq	$1024, %r11	#, ivtmp.165
	addq	$1024, %r15	#, ivtmp.166
	subq	$-128, %rdi	#, ivtmp.167
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
# main.c:179:                 int i_end = si + BLOCK_SIZE < L ? si + BLOCK_SIZE : L;
	leal	128(%rdx), %esi	#, si
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
# main.c:177:         for (int sk=0; sk<M; sk+=BLOCK_SIZE) {
	leal	128(%rcx), %r11d	#, tmp260
# main.c:180:                 int k_end = sk + BLOCK_SIZE < M ? sk + BLOCK_SIZE : M;
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
# main.c:181:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	movq	112(%rsp), %rcx	# %sfp, ivtmp.151
# main.c:181:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	movl	108(%rsp), %esi	# %sfp, N
# main.c:185:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	movq	%r15, %r13	# ivtmp.166, ivtmp.143
	movq	%r8, 136(%rsp)	# _265, %sfp
	movq	%rax, 128(%rsp)	# _279, %sfp
# main.c:181:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	leal	128(%rcx), %r11d	#, tmp265
	movl	%ecx, 196(%rsp)	# tmp464, %sfp
# main.c:181:                 int j_end = sj + BLOCK_SIZE < N ? sj + BLOCK_SIZE : N;
	cmpl	%esi, %r11d	# N, tmp265
	movq	%rdi, 120(%rsp)	# _282, %sfp
	cmovg	%esi, %r11d	# tmp265,, N, j_end
	movq	%rbx, 24(%rsp)	# ivtmp.165, %sfp
	movq	%r15, 16(%rsp)	# ivtmp.166, %sfp
# main.c:185:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	movl	%r11d, %esi	# j_end, tmp266
	subl	%ecx, %esi	# tmp462, tmp266
# main.c:185:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	leal	3(%rsi), %edx	#, tmp269
	cmovns	%esi, %edx	# tmp269,, tmp266, tmp268
	movl	%r11d, %esi	# j_end, _178
# main.c:185:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
	andl	$-4, %edx	#, _92
# main.c:185:                         int j_vec_end = sj + ((j_end - sj) / MM256_STRIDE) * MM256_STRIDE;
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
# main.c:184:                         __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
	movq	0(%r13), %rax	# MEM[(double * *)_180], tmp283
# main.c:187:                         for (int j=sj; j<j_vec_end; j+=MM256_STRIDE) {
	movl	196(%rsp), %ebx	# %sfp, sj
# main.c:184:                         __m256d a_ik = _mm256_broadcast_sd(&A[i][k]);
	addq	%r10, %rax	# ivtmp.130, tmp283
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:736:   return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
	vbroadcastsd	(%rax), %ymm1	#, _83
# main.c:187:                         for (int j=sj; j<j_vec_end; j+=MM256_STRIDE) {
	movq	200(%rsp), %rax	# %sfp, ivtmp.125
	cmpl	%ebx, %r14d	# sj, _6
	jle	.L82	#,
	.p2align 4,,10
	.p2align 3
.L30:
# main.c:188:                             __m256d c = _mm256_load_pd(&C[i][j]);
	movq	(%rsi), %rcx	# MEM[(double * *)_267], _76
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	movq	(%rdx), %rdi	# MEM[(double * *)_158], MEM[(double * *)_158]
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:314:   return (__m256d) ((__v4df)__A * (__v4df)__B);
	vmulpd	(%rdi,%rax), %ymm1, %ymm0	# MEM[(__m256d * {ref-all})_80], _83, tmp323
# main.c:188:                             __m256d c = _mm256_load_pd(&C[i][j]);
	addq	%rax, %rcx	# ivtmp.125, _76
# main.c:187:                         for (int j=sj; j<j_vec_end; j+=MM256_STRIDE) {
	addq	$32, %rax	#, ivtmp.125
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:143:   return (__m256d) ((__v4df)__A + (__v4df)__B);
	vaddpd	(%rcx), %ymm0, %ymm0	# MEM[(__m256d * {ref-all})_76], tmp323, tmp324
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:875:   *(__m256d *)__P = __A;
	vmovapd	%ymm0, (%rcx)	# tmp324, MEM[(__m256d * {ref-all})_76]
# main.c:187:                         for (int j=sj; j<j_vec_end; j+=MM256_STRIDE) {
	cmpq	%r9, %rax	# _244, ivtmp.125
	jne	.L30	#,
# main.c:193:                         for (int j=j_vec_end; j<j_end; j++)
	cmpl	%r14d, %r11d	# _6, j_end
	jg	.L31	#,
.L81:
	addq	$8, %r10	#, ivtmp.130
	jmp	.L37	#
	.p2align 4,,10
	.p2align 3
.L47:
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	movq	216(%rsp), %rcx	# %sfp, ivtmp.105
	.p2align 4,,10
	.p2align 3
.L41:
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	vmovsd	(%r8,%rcx,8), %xmm0	# MEM[(double *)_65 + ivtmp.105_119 * 8], MEM[(double *)_65 + ivtmp.105_119 * 8]
	vmulsd	(%rdi), %xmm0, %xmm0	# *_62, MEM[(double *)_65 + ivtmp.105_119 * 8], tmp317
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	vaddsd	(%rax,%rcx,8), %xmm0, %xmm0	# MEM[(double *)_56 + ivtmp.105_119 * 8], tmp317, tmp319
	vmovsd	%xmm0, (%rax,%rcx,8)	# tmp319, MEM[(double *)_56 + ivtmp.105_119 * 8]
# main.c:193:                         for (int j=j_vec_end; j<j_end; j++)
	addq	$1, %rcx	#, ivtmp.105
	cmpl	%ecx, %r11d	# ivtmp.105, j_end
	jg	.L41	#,
	jmp	.L37	#
	.p2align 4,,10
	.p2align 3
.L46:
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	movq	216(%rsp), %rcx	# %sfp, ivtmp.105
	addq	$8, %r10	#, ivtmp.130
	jmp	.L41	#
.L48:
# main.c:193:                         for (int j=j_vec_end; j<j_end; j++)
	movl	%r14d, 164(%rsp)	# _6, %sfp
# main.c:194:                             C[i][j] += A[i][k] * B[k][j];
	movl	192(%rsp), %ecx	# %sfp, niters.85
	xorl	%ebx, %ebx	#
	jmp	.L34	#
.L49:
# main.c:193:                         for (int j=j_vec_end; j<j_end; j++)
	movl	152(%rsp), %ecx	# %sfp, tmp.88
	jmp	.L39	#
.L80:
# main.c:175:     #pragma omp parallel for schedule(dynamic)
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
# main.c:32: void print_help_and_exit(char **argv) {
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	(%rdi), %rdx	# *argv_3(D), *argv_3(D)
	movl	$2, %edi	#,
	call	__printf_chk@PLT	#
	leaq	.LC1(%rip), %rdi	#, tmp86
	call	puts@PLT	#
# main.c:35:     exit(0);
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
# main.c:39:     for(int i=0; i<rows; i++) {
	testl	%esi, %esi	# rows
	jle	.L97	#,
# main.c:38: void print_matrix(double **mat, int rows, int cols) {
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
# main.c:40:         for(int j=0; j<cols; j++){
	testl	%ebx, %ebx	# cols
	jle	.L94	#,
	leaq	.LC2(%rip), %r12	#, tmp102
	.p2align 4,,10
	.p2align 3
.L89:
# main.c:38: void print_matrix(double **mat, int rows, int cols) {
	xorl	%ebx, %ebx	# ivtmp.181
	.p2align 4,,10
	.p2align 3
.L88:
# main.c:41:             printf("%f ", mat[i][j]);
	movq	(%r14), %rax	# MEM[(double * *)_36], MEM[(double * *)_36]
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%r12, %rsi	# tmp102,
	movl	$2, %edi	#,
	vmovsd	(%rax,%rbx), %xmm0	# *_7, *_7
	movl	$1, %eax	#,
# main.c:40:         for(int j=0; j<cols; j++){
	addq	$8, %rbx	#, ivtmp.181
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# main.c:40:         for(int j=0; j<cols; j++){
	cmpq	%rbx, %rbp	# ivtmp.181, _24
	jne	.L88	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$10, %edi	#,
# main.c:39:     for(int i=0; i<rows; i++) {
	addq	$8, %r14	#, ivtmp.186
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	putchar@PLT	#
# main.c:39:     for(int i=0; i<rows; i++) {
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
# main.c:39:     for(int i=0; i<rows; i++) {
	addq	$8, %r14	#, ivtmp.186
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	putchar@PLT	#
# main.c:39:     for(int i=0; i<rows; i++) {
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
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	call	rand@PLT	#
# main.c:49:     random_double = (random_double * (max - min)) + min;
	vmovsd	8(%rsp), %xmm0	# %sfp, min
	vmovsd	(%rsp), %xmm1	# %sfp, max
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	vxorps	%xmm2, %xmm2, %xmm2	# tmp98
	vcvtsi2sdl	%eax, %xmm2, %xmm2	# tmp97, tmp98, tmp99
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	vdivsd	.LC3(%rip), %xmm2, %xmm2	#, tmp90, random_double
# main.c:51: }
	addq	$24, %rsp	#,
	.cfi_def_cfa_offset 8
# main.c:49:     random_double = (random_double * (max - min)) + min;
	vsubsd	%xmm0, %xmm1, %xmm1	# min, max, tmp93
# main.c:49:     random_double = (random_double * (max - min)) + min;
	vmulsd	%xmm1, %xmm2, %xmm1	# tmp93, random_double, _4
# main.c:49:     random_double = (random_double * (max - min)) + min;
	vaddsd	%xmm0, %xmm1, %xmm0	# min, _4, random_double
# main.c:51: }
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
# main.c:60:     for(int i=0; i<L; i++) {
	testl	%ecx, %ecx	# L
	jle	.L113	#,
# main.c:58: void matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
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
# main.c:60:     for(int i=0; i<L; i++) {
	xorl	%r13d, %r13d	# ivtmp.213
	leaq	0(,%rcx,8), %r12	#, _61
	leaq	0(,%rdx,8), %rbp	#, _65
	leaq	0(,%rax,8), %r8	#, _69
	.p2align 4,,10
	.p2align 3
.L105:
# main.c:65:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%rbx,%r13), %r9	# MEM[(double * *)C_33(D) + ivtmp.213_64 * 1], _4
# main.c:65:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%r10,%r13), %rdi	# MEM[(double * *)A_34(D) + ivtmp.213_64 * 1], _10
	xorl	%ecx, %ecx	# ivtmp.206
	.p2align 4,,10
	.p2align 3
.L108:
# main.c:65:                 C[i][j] += A[i][k] * B[k][j];
	leaq	(%r9,%rcx), %rsi	#, _7
	xorl	%eax, %eax	# ivtmp.202
	vmovsd	(%rsi), %xmm1	# *_7, _20
	.p2align 4,,10
	.p2align 3
.L106:
# main.c:65:                 C[i][j] += A[i][k] * B[k][j];
	movq	(%r11,%rax), %rdx	# MEM[(double * *)B_35(D) + ivtmp.202_74 * 1], MEM[(double * *)B_35(D) + ivtmp.202_74 * 1]
# main.c:65:                 C[i][j] += A[i][k] * B[k][j];
	vmovsd	(%rdx,%rcx), %xmm0	# *_17, *_17
	vmulsd	(%rdi,%rax), %xmm0, %xmm0	# MEM[(double *)_10 + ivtmp.202_74 * 1], *_17, tmp110
# main.c:64:             for(int k=0; k<M; k++){
	addq	$8, %rax	#, ivtmp.202
# main.c:65:                 C[i][j] += A[i][k] * B[k][j];
	vaddsd	%xmm0, %xmm1, %xmm1	# tmp110, _20, _20
	vmovsd	%xmm1, (%rsi)	# _20, *_7
# main.c:64:             for(int k=0; k<M; k++){
	cmpq	%rax, %r8	# ivtmp.202, _69
	jne	.L106	#,
# main.c:62:         for(int j=0; j<N; j++) {
	addq	$8, %rcx	#, ivtmp.206
	cmpq	%rcx, %rbp	# ivtmp.206, _65
	jne	.L108	#,
# main.c:60:     for(int i=0; i<L; i++) {
	addq	$8, %r13	#, ivtmp.213
	cmpq	%r13, %r12	# ivtmp.213, _61
	jne	.L105	#,
.L111:
# main.c:69: }
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
# main.c:76: void unrolled_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%rdi, 40(%rsp)	# tmp222, %sfp
	movq	%fs:40, %rcx	# MEM[(<address-space-1> long unsigned int *)40B], tmp228
	movq	%rcx, 152(%rsp)	# tmp228, D.41418
	xorl	%ecx, %ecx	# tmp228
# main.c:78:     for(int i=0; i<L; i++) {
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
# main.c:83:                 C_temp[u] = C[i][j+u];
	vmovupd	(%rax), %ymm5	# MEM <vector(4) double> [(double *)_16], tmp298
	movq	%r14, %rcx	# ivtmp.262, ivtmp.262
	movl	%edx, %r9d	# j, ivtmp.263
	vmovapd	%ymm5, 96(%rsp)	# tmp298, MEM <vector(4) double> [(double *)&C_temp]
.L126:
# main.c:87:                 for(int k=0; k<M; k++){
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
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	movslq	%r9d, %rdx	# ivtmp.263, ivtmp.263
	cmpl	$2, 80(%rsp)	#, %sfp
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
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
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	vmulpd	(%r12,%rax), %ymm0, %ymm0	# MEM <vector(4) double> [(double *)_14 + ivtmp.251_172 * 1], vect__25.233, vect__26.234
	addq	$32, %rax	#, ivtmp.251
	vaddsd	%xmm2, %xmm0, %xmm2	# C_temp_I_lsm.221, stmp__27.235, stmp__27.235
	vunpckhpd	%xmm0, %xmm0, %xmm1	# tmp187, stmp__27.235
	vextractf128	$0x1, %ymm0, %xmm0	# vect__26.234, tmp189
	vaddsd	%xmm2, %xmm1, %xmm1	# stmp__27.235, stmp__27.235, stmp__27.235
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	vaddsd	%xmm0, %xmm1, %xmm1	# stmp__27.235, stmp__27.235, stmp__27.235
	vunpckhpd	%xmm0, %xmm0, %xmm0	# tmp189, stmp__27.235
	vaddsd	%xmm0, %xmm1, %xmm2	# stmp__27.235, stmp__27.235, C_temp_I_lsm.221
	cmpq	%rax, %r11	# ivtmp.251, _117
	jne	.L120	#,
	movl	84(%rsp), %r9d	# %sfp, ivtmp.263
	testl	%r15d, %r15d	# tmp214
	je	.L121	#,
# main.c:87:                 for(int k=0; k<M; k++){
	movl	76(%rsp), %eax	# %sfp, k
.L119:
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	movslq	%eax, %rdi	# k, k
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	movq	(%r10,%rdi,8), %rcx	# *_24, *_24
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	leaq	0(,%rdi,8), %rsi	#, _18
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	vmovsd	(%rcx,%rdx,8), %xmm0	# *_26, *_26
	vmulsd	(%r12,%rdi,8), %xmm0, %xmm0	# *_19, *_26, tmp196
# main.c:87:                 for(int k=0; k<M; k++){
	leal	1(%rax), %edi	#, k
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	vaddsd	%xmm0, %xmm2, %xmm2	# tmp196, C_temp_I_lsm.221, C_temp_I_lsm.221
# main.c:87:                 for(int k=0; k<M; k++){
	cmpl	%edi, %ebx	# k, M
	jle	.L121	#,
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	movq	8(%r10,%rsi), %rdi	# *_95, *_95
# main.c:87:                 for(int k=0; k<M; k++){
	addl	$2, %eax	#, k
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	vmovsd	(%rdi,%rdx,8), %xmm0	# *_97, *_97
	vmulsd	8(%r12,%rsi), %xmm0, %xmm0	# *_92, *_97, tmp200
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	vaddsd	%xmm0, %xmm2, %xmm2	# tmp200, C_temp_I_lsm.221, C_temp_I_lsm.221
# main.c:87:                 for(int k=0; k<M; k++){
	cmpl	%eax, %ebx	# k, M
	jle	.L121	#,
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	movq	16(%r10,%rsi), %rax	# *_134, *_134
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	vmovsd	(%rax,%rdx,8), %xmm0	# *_131, *_131
	vmulsd	16(%r12,%rsi), %xmm0, %xmm0	# *_136, *_131, tmp204
# main.c:88:                     C_temp[u] += A[i][k] * B[k][j+u];
	vaddsd	%xmm0, %xmm2, %xmm2	# tmp204, C_temp_I_lsm.221, C_temp_I_lsm.221
.L121:
	movq	88(%rsp), %rax	# %sfp, ivtmp.262
# main.c:85:             for (int u=0; u<UNROLL; u++){
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
# main.c:92:                 C[i][j+u] = C_temp[u];
	vmovapd	96(%rsp), %ymm4	# MEM <vector(4) double> [(double *)&C_temp], tmp297
# main.c:80:         for(int j=0; j<N; j+=UNROLL) {
	addl	$4, %edx	#, j
# main.c:80:         for(int j=0; j<N; j+=UNROLL) {
	addq	$32, %rax	#, ivtmp.269
# main.c:92:                 C[i][j+u] = C_temp[u];
	vmovupd	%ymm4, -32(%rax)	# tmp297, MEM <vector(4) double> [(double *)_16]
# main.c:80:         for(int j=0; j<N; j+=UNROLL) {
	cmpl	%edx, %esi	# j, N
	jg	.L127	#,
# main.c:78:     for(int i=0; i<L; i++) {
	movq	%r13, %r12	# _107, _107
	movq	32(%rsp), %rax	# %sfp, _155
	movl	%esi, %r13d	# N, N
	movq	%rdi, %rsi	# ivtmp.277, ivtmp.277
	addq	$8, %rsi	#, ivtmp.277
	cmpq	%rax, %rsi	# _155, ivtmp.277
	jne	.L118	#,
	vzeroupper
.L116:
# main.c:96: }
	movq	152(%rsp), %rax	# D.41418, tmp229
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
# main.c:85:             for (int u=0; u<UNROLL; u++){
	addq	$8, %rcx	#, ivtmp.262
	addl	$1, %r9d	#, ivtmp.263
	cmpq	%rcx, %r13	# ivtmp.262, _107
	jne	.L126	#,
	jmp	.L123	#
.L129:
# main.c:87:                 for(int k=0; k<M; k++){
	xorl	%eax, %eax	# k
	jmp	.L119	#
.L141:
# main.c:96: }
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
# main.c:103: void multicore_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
	movq	%rax, 40(%rsp)	# tmp98, D.41422
	xorl	%eax, %eax	# tmp98
# main.c:104:     #pragma omp parallel for
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
# main.c:115: }
	movq	40(%rsp), %rax	# D.41422, tmp99
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
	.globl	do_block
	.type	do_block, @function
do_block:
.LFB6648:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%esi, %rax	# sj,
	movslq	%edx, %rdx	# tmp155, sk
	movslq	%edi, %rsi	# tmp153, si
	salq	$3, %rsi	#, ivtmp.325
	movq	%rcx, %r11	# tmp156, A
	movq	%r8, %rcx	# B, tmp157
	leaq	0(,%rdx,8), %r8	#, _96
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	movq	%r8, %r10	# _96, _96
	pushq	%r14	#
	pushq	%r13	#
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	leaq	1024(%rsi), %r13	#, _108
	pushq	%r12	#
	.cfi_offset 12, -48
	movq	%r9, %r12	# tmp158, C
	leaq	(%rcx,%r8), %r9	#, vectp.291
	movq	%rsi, %r8	# ivtmp.325, ivtmp.325
	pushq	%rbx	#
	.cfi_offset 3, -56
	leaq	0(,%rax,8), %rbx	#, ivtmp.313
	leaq	1024(%rbx), %rdi	#, _109
	andq	$-32, %rsp	#,
.L148:
	movq	(%r11,%r8), %rsi	# MEM[(double * *)A_38(D) + ivtmp.325_100 * 1], vectp.288
# main.c:120:             double C_ij = C[i][j];
	movq	(%r12,%r8), %rdx	# MEM[(double * *)C_33(D) + ivtmp.325_100 * 1], _4
	movq	%rbx, -16(%rsp)	# ivtmp.313, %sfp
# main.c:122:                 C_ij += A[i][k] * B[k][j];
	movq	%rbx, %rcx	# ivtmp.313, ivtmp.313
	addq	%r10, %rsi	# _96, vectp.288
	.p2align 4,,10
	.p2align 3
.L150:
# main.c:120:             double C_ij = C[i][j];
	movq	%rdx, -8(%rsp)	# _4, %sfp
	vmovsd	(%rdx,%rcx), %xmm1	# MEM[(double *)_4 + ivtmp.313_14 * 1], C_ij
	xorl	%eax, %eax	# ivtmp.301
	.p2align 4,,10
	.p2align 3
.L149:
	leaq	(%r9,%rax), %rdx	#, _18
# main.c:122:                 C_ij += A[i][k] * B[k][j];
	movq	(%rdx), %r14	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_18], 64, 0>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_18], 64, 0>
	movq	16(%rdx), %r15	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_18], 64, 128>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_18], 64, 128>
	movq	8(%rdx), %rbx	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_18], 64, 64>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_18], 64, 64>
	movq	24(%rdx), %rdx	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_18], 64, 192>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_18], 64, 192>
	vmovsd	(%r15,%rcx), %xmm2	# MEM[(double *)_76], MEM[(double *)_76]
	vmovsd	(%r14,%rcx), %xmm0	# MEM[(double *)_84], MEM[(double *)_84]
	vmovhpd	(%rdx,%rcx), %xmm2, %xmm2	# MEM[(double *)_72], MEM[(double *)_76], tmp139
	vmovhpd	(%rbx,%rcx), %xmm0, %xmm0	# MEM[(double *)_80], MEM[(double *)_84], tmp142
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0	# tmp139, tmp142, vect__17.293
# main.c:122:                 C_ij += A[i][k] * B[k][j];
	vmulpd	(%rsi,%rax), %ymm0, %ymm0	# MEM <vector(4) double> [(double *)vectp.288_98 + ivtmp.301_16 * 1], vect__17.293, vect__18.294
	addq	$32, %rax	#, ivtmp.301
	vaddsd	%xmm0, %xmm1, %xmm1	# stmp_C_ij_40.295, C_ij, stmp_C_ij_40.295
	vunpckhpd	%xmm0, %xmm0, %xmm3	# tmp146, stmp_C_ij_40.295
	vextractf128	$0x1, %ymm0, %xmm0	# vect__18.294, tmp148
	vaddsd	%xmm1, %xmm3, %xmm3	# stmp_C_ij_40.295, stmp_C_ij_40.295, stmp_C_ij_40.295
# main.c:122:                 C_ij += A[i][k] * B[k][j];
	vaddsd	%xmm3, %xmm0, %xmm1	# stmp_C_ij_40.295, stmp_C_ij_40.295, stmp_C_ij_40.295
	vunpckhpd	%xmm0, %xmm0, %xmm0	# tmp148, stmp_C_ij_40.295
	vaddsd	%xmm0, %xmm1, %xmm1	# stmp_C_ij_40.295, stmp_C_ij_40.295, C_ij
	cmpq	$1024, %rax	#, ivtmp.301
	jne	.L149	#,
# main.c:124:             C[i][j] = C_ij;
	movq	-8(%rsp), %rdx	# %sfp, _4
	vmovsd	%xmm1, (%rdx,%rcx)	# C_ij, MEM[(double *)_4 + ivtmp.313_14 * 1]
# main.c:119:         for (int j=sj; j<sj+BLOCK_SIZE; j++){
	addq	$8, %rcx	#, ivtmp.313
	cmpq	%rdi, %rcx	# _109, ivtmp.313
	jne	.L150	#,
# main.c:118:     for (int i=si; i<si+BLOCK_SIZE; i++){
	addq	$8, %r8	#, ivtmp.325
	movq	-16(%rsp), %rbx	# %sfp, ivtmp.313
	cmpq	%r13, %r8	# _108, ivtmp.325
	jne	.L148	#,
	vzeroupper
# main.c:127: }
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
.LFE6648:
	.size	do_block, .-do_block
	.p2align 4
	.globl	blocked_matrix_multiply
	.type	blocked_matrix_multiply, @function
blocked_matrix_multiply:
.LFB6649:
	.cfi_startproc
	endbr64	
	movl	%ecx, %r10d	# tmp166, L
# main.c:136:     for(int sj=0; sj<L; sj+=BLOCK_SIZE) {
	testl	%ecx, %ecx	# L
	jle	.L174	#,
	movl	%r9d, %ecx	# tmp168, N
	testl	%r9d, %r9d	# N
	jle	.L174	#,
	movl	%r8d, %eax	# tmp167, M
	testl	%r8d, %r8d	# M
	jle	.L174	#,
# main.c:134: void blocked_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	subl	$1, %eax	#, tmp137
	shrl	$7, %eax	#, tmp138
	addl	$1, %eax	#,
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	salq	$10, %rax	#, tmp140
	pushq	%r14	#
	movq	%rax, %r9	# tmp140, _95
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movq	%rdi, %r14	# tmp163, A
	movl	%ecx, %eax	# N, N
	pushq	%r13	#
	.cfi_offset 13, -40
	movq	%rsi, %r13	# tmp164, B
	pushq	%r12	#
	.cfi_offset 12, -48
# main.c:136:     for(int sj=0; sj<L; sj+=BLOCK_SIZE) {
	movl	$1024, %r12d	#, ivtmp.390
# main.c:134: void blocked_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	pushq	%rbx	#
	.cfi_offset 3, -56
	movq	%rdx, %rbx	# tmp165, C
# main.c:136:     for(int sj=0; sj<L; sj+=BLOCK_SIZE) {
	xorl	%edx, %edx	# sj
# main.c:134: void blocked_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	andq	$-32, %rsp	#,
.L159:
	movl	%edx, -44(%rsp)	# sj, %sfp
	movq	%r9, %rdi	# _95, _95
# main.c:120:             double C_ij = C[i][j];
	movl	$1024, %r8d	#, ivtmp.384
# main.c:138:         for(int si=0; si<N; si+=BLOCK_SIZE) {
	xorl	%esi, %esi	# si
	leaq	-1024(%r12), %r15	#, ivtmp.361
	movq	%r12, %r9	# ivtmp.390, ivtmp.390
.L167:
	leaq	-1024(%r8), %rcx	#, ivtmp.373
	movq	%r8, %r11	# ivtmp.384, ivtmp.384
# main.c:120:             double C_ij = C[i][j];
	xorl	%edx, %edx	# ivtmp.379
	movl	%esi, %r8d	# si, si
	movq	%rcx, -40(%rsp)	# ivtmp.373, %sfp
	movl	%r10d, %esi	# L, L
.L166:
	movl	%eax, -48(%rsp)	# N, %sfp
	leaq	0(%r13,%rdx), %r10	#, vectp.339
	movq	-40(%rsp), %rcx	# %sfp, ivtmp.373
	movl	%r8d, %r12d	# si, si
	movq	%r10, -32(%rsp)	# vectp.339, %sfp
	movl	%esi, %r8d	# L, L
	movq	%rdi, %r10	# _95, _95
.L164:
	movq	(%r14,%rcx), %rdi	# MEM[(double * *)A_13(D) + ivtmp.373_141 * 1], vectp.336
# main.c:120:             double C_ij = C[i][j];
	movq	(%rbx,%rcx), %rax	# MEM[(double * *)C_15(D) + ivtmp.373_141 * 1], _22
	movq	%r10, -8(%rsp)	# _95, %sfp
	movl	%r12d, %r10d	# si, si
	movq	%r11, %r12	# ivtmp.384, ivtmp.384
	movq	-8(%rsp), %r11	# %sfp, _95
	movq	%r15, %rsi	# ivtmp.361, ivtmp.361
	addq	%rdx, %rdi	# ivtmp.379, vectp.336
	movq	%rdi, -24(%rsp)	# vectp.336, %sfp
	movq	%rdx, %rdi	# ivtmp.379, ivtmp.379
	.p2align 4,,10
	.p2align 3
.L161:
# main.c:120:             double C_ij = C[i][j];
	movq	%rax, -56(%rsp)	# _22, %sfp
	vmovsd	(%rax,%rsi), %xmm1	# MEM[(double *)_22 + ivtmp.361_35 * 1], C_ij
	xorl	%edx, %edx	# ivtmp.349
	movq	%rcx, -64(%rsp)	# ivtmp.373, %sfp
.L160:
	movq	-32(%rsp), %rax	# %sfp, vectp.339
	addq	%rdx, %rax	# ivtmp.349, _25
# main.c:122:                 C_ij += A[i][k] * B[k][j];
	movq	(%rax), %rcx	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 0>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 0>
	movq	%rcx, -8(%rsp)	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 0>, %sfp
	movq	8(%rax), %rcx	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 64>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 64>
	movq	%rcx, -16(%rsp)	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 64>, %sfp
	movq	16(%rax), %rcx	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 128>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 128>
	movq	24(%rax), %rax	# BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 192>, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 192>
	vmovsd	(%rcx,%rsi), %xmm2	# MEM[(double *)_116], MEM[(double *)_116]
	movq	-8(%rsp), %rcx	# %sfp, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 0>
	vmovsd	(%rcx,%rsi), %xmm0	# MEM[(double *)_124], MEM[(double *)_124]
	movq	-16(%rsp), %rcx	# %sfp, BIT_FIELD_REF <MEM <vector(4) long unsigned int> [(double * *)_25], 64, 64>
	vmovhpd	(%rax,%rsi), %xmm2, %xmm2	# MEM[(double *)_112], MEM[(double *)_116], tmp146
# main.c:122:                 C_ij += A[i][k] * B[k][j];
	movq	-24(%rsp), %rax	# %sfp, vectp.336
# main.c:122:                 C_ij += A[i][k] * B[k][j];
	vmovhpd	(%rcx,%rsi), %xmm0, %xmm0	# MEM[(double *)_120], MEM[(double *)_124], tmp149
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0	# tmp146, tmp149, vect__38.341
# main.c:122:                 C_ij += A[i][k] * B[k][j];
	vmulpd	(%rax,%rdx), %ymm0, %ymm0	# MEM <vector(4) double> [(double *)vectp.336_143 + ivtmp.349_37 * 1], vect__38.341, vect__39.342
	addq	$32, %rdx	#, ivtmp.349
	vaddsd	%xmm0, %xmm1, %xmm1	# stmp_C_ij_41.343, C_ij, stmp_C_ij_41.343
	vunpckhpd	%xmm0, %xmm0, %xmm2	# tmp153, stmp_C_ij_41.343
	vextractf128	$0x1, %ymm0, %xmm0	# vect__39.342, tmp155
	vaddsd	%xmm1, %xmm2, %xmm2	# stmp_C_ij_41.343, stmp_C_ij_41.343, stmp_C_ij_41.343
# main.c:122:                 C_ij += A[i][k] * B[k][j];
	vaddsd	%xmm2, %xmm0, %xmm1	# stmp_C_ij_41.343, stmp_C_ij_41.343, stmp_C_ij_41.343
	vunpckhpd	%xmm0, %xmm0, %xmm0	# tmp155, stmp_C_ij_41.343
	vaddsd	%xmm0, %xmm1, %xmm1	# stmp_C_ij_41.343, stmp_C_ij_41.343, C_ij
	cmpq	$1024, %rdx	#, ivtmp.349
	jne	.L160	#,
# main.c:124:             C[i][j] = C_ij;
	movq	-56(%rsp), %rax	# %sfp, _22
	movq	-64(%rsp), %rcx	# %sfp, ivtmp.373
	vmovsd	%xmm1, (%rax,%rsi)	# C_ij, MEM[(double *)_22 + ivtmp.361_35 * 1]
# main.c:119:         for (int j=sj; j<sj+BLOCK_SIZE; j++){
	addq	$8, %rsi	#, ivtmp.361
	cmpq	%r9, %rsi	# ivtmp.390, ivtmp.361
	jne	.L161	#,
# main.c:118:     for (int i=si; i<si+BLOCK_SIZE; i++){
	movq	%r11, %rax	# _95, _95
	addq	$8, %rcx	#, ivtmp.373
	movq	%r12, %r11	# ivtmp.384, ivtmp.384
	movq	%rdi, %rdx	# ivtmp.379, ivtmp.379
	movl	%r10d, %r12d	# si, si
	movq	%rax, %r10	# _95, _95
	cmpq	%rcx, %r11	# ivtmp.373, ivtmp.384
	jne	.L164	#,
# main.c:140:             for(int sk=0; sk<M; sk+=BLOCK_SIZE){
	addq	$1024, %rdx	#, ivtmp.379
	movq	%rax, %rdi	# _95, _95
	movl	%r8d, %esi	# L, L
	movl	-48(%rsp), %eax	# %sfp, N
	movl	%r12d, %r8d	# si, si
	cmpq	%rdx, %r10	# ivtmp.379, _95
	jne	.L166	#,
# main.c:138:         for(int si=0; si<N; si+=BLOCK_SIZE) {
	movl	%esi, %r10d	# L, L
	movl	%r12d, %esi	# si, si
	movq	%r11, %r8	# ivtmp.384, ivtmp.384
	subl	$-128, %esi	#, si
# main.c:138:         for(int si=0; si<N; si+=BLOCK_SIZE) {
	addq	$1024, %r8	#, ivtmp.384
	cmpl	%esi, %eax	# si, N
	jg	.L167	#,
# main.c:136:     for(int sj=0; sj<L; sj+=BLOCK_SIZE) {
	movl	-44(%rsp), %edx	# %sfp, sj
	movq	%r9, %r12	# ivtmp.390, ivtmp.390
	movq	%rdi, %r9	# _95, _95
# main.c:136:     for(int sj=0; sj<L; sj+=BLOCK_SIZE) {
	addq	$1024, %r12	#, ivtmp.390
# main.c:136:     for(int sj=0; sj<L; sj+=BLOCK_SIZE) {
	subl	$-128, %edx	#, sj
# main.c:136:     for(int sj=0; sj<L; sj+=BLOCK_SIZE) {
	cmpl	%edx, %r10d	# sj, L
	jg	.L159	#,
	vzeroupper
# main.c:145: }
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
.L174:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
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
# main.c:154:     for(int i=0; i<L; i++) {
	testl	%edx, %edx	# L
	jle	.L190	#,
	movl	%r9d, %eax	# tmp137, N
	testl	%r9d, %r9d	# N
	jle	.L190	#,
# main.c:152: void subword_parallelism_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %r9	# A, ivtmp.414
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
.L180:
# main.c:152: void subword_parallelism_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	xorl	%ecx, %ecx	# ivtmp.408
	.p2align 4,,10
	.p2align 3
.L183:
# main.c:157:             __m256d c0 = _mm256_load_pd(&C[i][j]);
	movq	(%r11), %r8	# MEM[(double * *)_74], MEM[(double * *)_74]
	leaq	(%r8,%rcx), %rax	#, _67
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	vmovapd	(%rax), %ymm1	# MEM[(__m256d * {ref-all})_7], c0
# main.c:159:             for(int k=0; k<M; k++){
	testl	%r12d, %r12d	# M
	jle	.L181	#,
	movq	(%r9), %rsi	# MEM[(double * *)_75], MEM[(double * *)_75]
	xorl	%eax, %eax	# ivtmp.401
	.p2align 4,,10
	.p2align 3
.L182:
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:869:   return *(__m256d *)__P;
	movq	(%r10,%rax), %rdx	# MEM[(double * *)B_35(D) + ivtmp.401_62 * 1], MEM[(double * *)B_35(D) + ivtmp.401_62 * 1]
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:736:   return (__m256d) __builtin_ia32_vbroadcastsd256 (__X);
	vbroadcastsd	(%rsi,%rax), %ymm0	#* ivtmp.401, tmp124
# main.c:159:             for(int k=0; k<M; k++){
	addq	$8, %rax	#, ivtmp.401
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:314:   return (__m256d) ((__v4df)__A * (__v4df)__B);
	vmulpd	(%rdx,%rcx), %ymm0, %ymm0	# MEM[(__m256d * {ref-all})_15], tmp124, tmp128
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:143:   return (__m256d) ((__v4df)__A + (__v4df)__B);
	vaddpd	%ymm0, %ymm1, %ymm1	# tmp128, c0, c0
# main.c:159:             for(int k=0; k<M; k++){
	cmpq	%rax, %rdi	# ivtmp.401, _47
	jne	.L182	#,
# main.c:164:             _mm256_store_pd(&C[i][j], c0);
	leaq	(%r8,%rcx), %rax	#, _67
.L181:
# main.c:156:         for(int j=0; j<N; j+=MM256_STRIDE) {
	addq	$32, %rcx	#, ivtmp.408
# /usr/lib/gcc/x86_64-linux-gnu/13/include/avxintrin.h:875:   *(__m256d *)__P = __A;
	vmovapd	%ymm1, (%rax)	# c0, MEM[(__m256d * {ref-all})prephitmp_68]
# main.c:156:         for(int j=0; j<N; j+=MM256_STRIDE) {
	cmpq	%rcx, %rbx	# ivtmp.408, _22
	jne	.L183	#,
# main.c:154:     for(int i=0; i<L; i++) {
	addq	$8, %r9	#, ivtmp.414
	addq	$8, %r11	#, ivtmp.413
	cmpq	%r13, %r9	# _72, ivtmp.414
	jne	.L180	#,
	vzeroupper
# main.c:167: }
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
.L190:
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
# main.c:174: void combined_matrix_multiply(double **A, double **B, double **C, int L, int M, int N) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
	movq	%rax, 40(%rsp)	# tmp98, D.41584
	xorl	%eax, %eax	# tmp98
# main.c:175:     #pragma omp parallel for schedule(dynamic)
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
# main.c:200: }
	movq	40(%rsp), %rax	# D.41584, tmp99
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp99
	jne	.L197	#,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L197:
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
# main.c:208: void free_matrices(double **A, double **B, double **C, int L, int M, int N) {
	movq	%rdx, 8(%rsp)	# C, %sfp
# main.c:209:     for(int i=0; i<L; i++) {
	testl	%ecx, %ecx	# L
	jle	.L199	#,
	movslq	%ecx, %rcx	# L, L
	movq	%rdi, %r14	# A, ivtmp.432
	movq	%rdx, %rbx	# C, ivtmp.433
	leaq	(%rdi,%rcx,8), %r15	#, _52
	.p2align 4,,10
	.p2align 3
.L200:
# main.c:210:         free(A[i]);
	movq	(%r14), %rdi	# MEM[(double * *)_47], MEM[(double * *)_47]
# main.c:209:     for(int i=0; i<L; i++) {
	addq	$8, %r14	#, ivtmp.432
	addq	$8, %rbx	#, ivtmp.433
# main.c:210:         free(A[i]);
	call	free@PLT	#
# main.c:211:         free(C[i]);
	movq	-8(%rbx), %rdi	# MEM[(double * *)_48], MEM[(double * *)_48]
	call	free@PLT	#
# main.c:209:     for(int i=0; i<L; i++) {
	cmpq	%r15, %r14	# _52, ivtmp.432
	jne	.L200	#,
.L199:
# main.c:213:     for(int i=0; i<M; i++) {
	testl	%ebp, %ebp	# M
	jle	.L201	#,
	movq	%r12, %rbx	# B, ivtmp.427
	leaq	(%r12,%rbp,8), %rbp	#, _29
	.p2align 4,,10
	.p2align 3
.L202:
# main.c:214:         free(B[i]);
	movq	(%rbx), %rdi	# MEM[(double * *)_39], MEM[(double * *)_39]
# main.c:213:     for(int i=0; i<M; i++) {
	addq	$8, %rbx	#, ivtmp.427
# main.c:214:         free(B[i]);
	call	free@PLT	#
# main.c:213:     for(int i=0; i<M; i++) {
	cmpq	%rbx, %rbp	# ivtmp.427, _29
	jne	.L202	#,
.L201:
# main.c:216:     free(A);
	movq	%r13, %rdi	# A,
	call	free@PLT	#
# main.c:217:     free(B);
	movq	%r12, %rdi	# B,
	call	free@PLT	#
# main.c:218:     free(C);
	movq	8(%rsp), %rdi	# %sfp,
# main.c:219: }
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
# main.c:218:     free(C);
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
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"ERROR: cannot allocate memory for matrix A"
	.align 8
.LC7:
	.string	"ERROR: cannot allocate memory for matrix B"
	.align 8
.LC9:
	.string	"ERROR: cannot allocate memory for matrix C"
	.section	.rodata.str1.1
.LC10:
	.string	"ERROR: unknown method %d\n"
	.section	.rodata.str1.8
	.align 8
.LC11:
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
	movq	%rsi, %r15	# tmp283, argv
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
# main.c:221: int main(int argc, char **argv) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp302
	movq	%rax, 152(%rsp)	# tmp302, D.41664
	xorl	%eax, %eax	# tmp302
# main.c:230:     if(argc != 6) {
	cmpl	$6, %edi	#, tmp282
	jne	.L289	#,
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_79(D) + 8B], MEM[(char * *)argv_79(D) + 8B]
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	call	strtol@PLT	#
	movq	16(%r15), %rdi	# MEM[(char * *)argv_79(D) + 16B], MEM[(char * *)argv_79(D) + 16B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	movq	%rax, %r13	# tmp284, _124
	movq	%rax, 8(%rsp)	# _124, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, 52(%rsp)	# tmp346, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
	movq	24(%r15), %rdi	# MEM[(char * *)argv_79(D) + 24B], MEM[(char * *)argv_79(D) + 24B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	movq	%rax, %r12	# tmp285, _122
	movq	%rax, 24(%rsp)	# _122, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, 80(%rsp)	# tmp347, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
	movq	32(%r15), %rdi	# MEM[(char * *)argv_79(D) + 32B], MEM[(char * *)argv_79(D) + 32B]
	xorl	%esi, %esi	#
	movl	$10, %edx	#,
	movq	%rax, 16(%rsp)	# _120, %sfp
	movq	%rax, %r14	# tmp286, _120
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, %ebp	# _120, _121
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	call	strtol@PLT	#
	movq	40(%r15), %rdi	# MEM[(char * *)argv_79(D) + 40B], MEM[(char * *)argv_79(D) + 40B]
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	movq	%rax, %rbx	# tmp287, _119
	call	strtol@PLT	#
# main.c:240:     srand(seed);
	movl	%ebx, %edi	# _119, _119
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	%rax, 56(%rsp)	# _117, %sfp
# /usr/include/stdlib.h:483:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, 92(%rsp)	# tmp348, %sfp
# main.c:240:     srand(seed);
	call	srand@PLT	#
# main.c:242:     if( !L || !M || !N ) {
	testl	%r13d, %r13d	# _124
	sete	%al	#, tmp199
# main.c:242:     if( !L || !M || !N ) {
	testl	%r12d, %r12d	# _122
	sete	%dl	#, tmp201
# main.c:242:     if( !L || !M || !N ) {
	orb	%dl, %al	# tmp201, tmp303
	jne	.L250	#,
	testl	%r14d, %r14d	# _120
	je	.L250	#,
# main.c:248:     omp_set_num_threads(OMP_THREADS);
	movl	$4, %edi	#,
	call	omp_set_num_threads@PLT	#
# main.c:254:     A = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movq	8(%rsp), %rbx	# %sfp, _124
	movl	$32, %edi	#,
	movslq	%ebx, %rax	# _124, _125
	salq	$3, %rax	#, _13
	movq	%rax, %rsi	# _13,
	movq	%rax, 64(%rsp)	# _13, %sfp
	call	aligned_alloc@PLT	#
	movq	%rax, 32(%rsp)	# A, %sfp
# main.c:255:     if(A == NULL) {
	testq	%rax, %rax	# A
	je	.L210	#,
# main.c:268:     B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
	movslq	24(%rsp), %r12	# %sfp, _123
	salq	$3, %r12	#, _212
# main.c:259:     for(int i=0; i<L; i++) {
	testl	%ebx, %ebx	# _124
	jle	.L216	#,
	movq	%rax, %rcx	# A, A
	movq	%rax, %r13	# A, ivtmp.482
	movq	8(%rsp), %rax	# %sfp, _124
	subl	$1, %eax	#, tmp212
	leaq	8(%rcx,%rax,8), %rbx	#, _249
	.p2align 4,,10
	.p2align 3
.L215:
# main.c:260:         A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
	movq	%r12, %rsi	# _212,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
# main.c:260:         A[i] = aligned_alloc(MEM_ALIGN, M * sizeof(double));
	movq	%rax, 0(%r13)	# tmp215, MEM[(double * *)_242]
# main.c:261:         if(A[i] == NULL) {
	testq	%rax, %rax	# tmp215
	je	.L210	#,
# main.c:259:     for(int i=0; i<L; i++) {
	addq	$8, %r13	#, ivtmp.482
	cmpq	%rbx, %r13	# _249, ivtmp.482
	jne	.L215	#,
.L216:
# main.c:268:     B = aligned_alloc(MEM_ALIGN, M * sizeof(double *));
	movq	%r12, %rsi	# _212,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, 40(%rsp)	# B, %sfp
# main.c:269:     if(B == NULL) {
	testq	%rax, %rax	# B
	je	.L212	#,
# main.c:273:     for(int i=0; i<M; i++) {
	movl	24(%rsp), %edi	# %sfp,
	testl	%edi, %edi	#
	jle	.L290	#,
	movq	%rax, %rcx	# B, B
# main.c:274:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movslq	16(%rsp), %rax	# %sfp, _121
	movq	%rcx, %r14	# B, ivtmp.477
	movq	%rax, 72(%rsp)	# _121, %sfp
	leaq	0(,%rax,8), %r13	#, _23
	movl	24(%rsp), %eax	# %sfp, tmp357
	leal	-1(%rax), %r12d	#,
	movl	%r12d, 84(%rsp)	# tmp278, %sfp
	addq	$1, %r12	#, tmp281
	leaq	(%rcx,%r12,8), %rbx	#, _238
	.p2align 4,,10
	.p2align 3
.L219:
	movq	%r13, %rsi	# _23,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
# main.c:274:         B[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, (%r14)	# tmp221, MEM[(double * *)_231]
# main.c:275:         if(B[i] == NULL) {
	testq	%rax, %rax	# tmp221
	je	.L212	#,
# main.c:273:     for(int i=0; i<M; i++) {
	addq	$8, %r14	#, ivtmp.477
	cmpq	%rbx, %r14	# _238, ivtmp.477
	jne	.L219	#,
# main.c:281:     for(int i=0; i<L; i++)
	movl	8(%rsp), %esi	# %sfp,
	testl	%esi, %esi	#
	jle	.L225	#,
# main.c:281:     for(int i=0; i<L; i++)
	xorl	%r14d, %r14d	# i
	movl	%ebp, 88(%rsp)	# _121, %sfp
	movq	32(%rsp), %rbx	# %sfp, ivtmp.473
	salq	$3, %r12	#, _223
	vmovsd	.LC3(%rip), %xmm7	#, tmp277
	movl	%r14d, %eax	# i, i
	movl	52(%rsp), %r14d	# %sfp, _125
	vmovsd	%xmm7, (%rsp)	# tmp277, %sfp
	.p2align 4,,10
	.p2align 3
.L223:
	movl	%eax, 48(%rsp)	# i, %sfp
# main.c:221: int main(int argc, char **argv) {
	xorl	%r13d, %r13d	# ivtmp.468
	.p2align 4,,10
	.p2align 3
.L226:
# main.c:283:             A[i][j] = drand(MIN, MAX);
	movq	(%rbx), %rbp	# MEM[(double * *)_227], _34
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	call	rand@PLT	#
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp362
# main.c:49:     random_double = (random_double * (max - min)) + min;
	vxorpd	%xmm3, %xmm3, %xmm3	# tmp364
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	vcvtsi2sdl	%eax, %xmm1, %xmm0	# tmp293, tmp362, tmp300
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	vdivsd	(%rsp), %xmm0, %xmm0	# %sfp, tmp224, random_double
# main.c:49:     random_double = (random_double * (max - min)) + min;
	vaddsd	%xmm3, %xmm0, %xmm0	# tmp364, random_double, random_double
# main.c:283:             A[i][j] = drand(MIN, MAX);
	addq	%r13, %rbp	# ivtmp.468, _34
# main.c:282:         for(int j=0; j<M; j++)
	addq	$8, %r13	#, ivtmp.468
# main.c:283:             A[i][j] = drand(MIN, MAX);
	vmovsd	%xmm0, 0(%rbp)	# random_double, *_34
# main.c:282:         for(int j=0; j<M; j++)
	cmpq	%r12, %r13	# _223, ivtmp.468
	jne	.L226	#,
# main.c:281:     for(int i=0; i<L; i++)
	movl	48(%rsp), %eax	# %sfp, i
# main.c:281:     for(int i=0; i<L; i++)
	addq	$8, %rbx	#, ivtmp.473
# main.c:281:     for(int i=0; i<L; i++)
	addl	$1, %eax	#, i
# main.c:281:     for(int i=0; i<L; i++)
	cmpl	%r14d, %eax	# _125, i
	jl	.L223	#,
	movl	88(%rsp), %ebp	# %sfp, _121
.L225:
	movq	16(%rsp), %rcx	# %sfp, _120
	testl	%ecx, %ecx	# _120
	jle	.L227	#,
	movq	40(%rsp), %rax	# %sfp, B
	movl	84(%rsp), %r14d	# %sfp, tmp229
	movl	%ebp, 48(%rsp)	# _121, %sfp
	vmovsd	.LC3(%rip), %xmm7	#, tmp277
	movq	%rax, %r12	# B, ivtmp.464
	leaq	8(%rax,%r14,8), %r14	#, _68
	leal	-1(%rcx), %eax	#, tmp233
	leaq	8(,%rax,8), %rbx	#, _49
	vmovsd	%xmm7, (%rsp)	# tmp277, %sfp
	movq	%r12, %rbp	# ivtmp.464, ivtmp.464
	.p2align 4,,10
	.p2align 3
.L228:
# main.c:281:     for(int i=0; i<L; i++)
	xorl	%r13d, %r13d	# ivtmp.459
	.p2align 4,,10
	.p2align 3
.L229:
# main.c:287:             B[i][j] = drand(MIN, MAX);
	movq	0(%rbp), %r12	# MEM[(double * *)_67], _41
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	call	rand@PLT	#
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	vxorpd	%xmm4, %xmm4, %xmm4	# tmp371
# main.c:49:     random_double = (random_double * (max - min)) + min;
	vxorpd	%xmm6, %xmm6, %xmm6	# tmp373
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	vcvtsi2sdl	%eax, %xmm4, %xmm0	# tmp294, tmp371, tmp301
# main.c:48:     double random_double = (double) rand() / RAND_MAX;
	vdivsd	(%rsp), %xmm0, %xmm0	# %sfp, tmp236, random_double
# main.c:49:     random_double = (random_double * (max - min)) + min;
	vaddsd	%xmm6, %xmm0, %xmm0	# tmp373, random_double, random_double
# main.c:287:             B[i][j] = drand(MIN, MAX);
	addq	%r13, %r12	# ivtmp.459, _41
# main.c:286:         for(int j=0; j<N; j++)
	addq	$8, %r13	#, ivtmp.459
# main.c:287:             B[i][j] = drand(MIN, MAX);
	vmovsd	%xmm0, (%r12)	# random_double, *_41
# main.c:286:         for(int j=0; j<N; j++)
	cmpq	%r13, %rbx	# ivtmp.459, _49
	jne	.L229	#,
# main.c:285:     for(int i=0; i<M; i++)
	addq	$8, %rbp	#, ivtmp.464
	cmpq	%rbp, %r14	# ivtmp.464, _68
	jne	.L228	#,
	movl	48(%rsp), %ebp	# %sfp, _121
.L227:
# main.c:290:     C = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movq	64(%rsp), %rsi	# %sfp,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, (%rsp)	# C, %sfp
# main.c:291:     if(C == NULL) {
	testq	%rax, %rax	# C
	je	.L234	#,
# main.c:295:     for(int i=0; i<L; i++) {
	movl	8(%rsp), %ecx	# %sfp,
	testl	%ecx, %ecx	#
	jle	.L248	#,
.L232:
	movq	8(%rsp), %rax	# %sfp, _124
	movq	(%rsp), %rcx	# %sfp, C
# main.c:296:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	72(%rsp), %r13	# %sfp, _121
	subl	$1, %eax	#, tmp244
	movq	%rcx, %rbx	# C, ivtmp.454
	leaq	8(%rcx,%rax,8), %r12	#, _173
# main.c:303:             C[i][j] = 0.0;
	movq	16(%rsp), %rax	# %sfp, _120
# main.c:296:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	salq	$3, %r13	#, _121
# main.c:303:             C[i][j] = 0.0;
	subl	$1, %eax	#, tmp248
	leaq	8(,%rax,8), %r14	#, _178
	.p2align 4,,10
	.p2align 3
.L236:
# main.c:296:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movl	$32, %edi	#,
	movq	%r13, %rsi	# _43,
	call	aligned_alloc@PLT	#
# main.c:296:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, (%rbx)	# tmp250, MEM[(double * *)_72]
# main.c:296:         C[i] = aligned_alloc(MEM_ALIGN, N * sizeof(double));
	movq	%rax, %rdi	# tmp296, tmp250
# main.c:297:         if(C[i] == NULL) {
	testq	%rax, %rax	# tmp250
	je	.L234	#,
# main.c:302:         for(int j=0; j<N; j++){
	testl	%ebp, %ebp	# _121
	jle	.L237	#,
# main.c:303:             C[i][j] = 0.0;
	movq	%r14, %rdx	# _178,
	xorl	%esi, %esi	#
	call	memset@PLT	#
.L237:
# main.c:295:     for(int i=0; i<L; i++) {
	addq	$8, %rbx	#, ivtmp.454
	cmpq	%r12, %rbx	# _173, ivtmp.454
	jne	.L236	#,
.L248:
# main.c:321:     gettimeofday(&start, NULL);
	leaq	96(%rsp), %rdi	#, tmp255
	xorl	%esi, %esi	#
	call	gettimeofday@PLT	#
# main.c:324:     switch (method) {
	movq	56(%rsp), %rax	# %sfp, _117
	cmpl	$5, %eax	#, _117
	ja	.L238	#,
	leaq	.L240(%rip), %rdx	#, tmp257
	movl	%eax, %eax	# _117, _118
	movslq	(%rdx,%rax,4), %rax	#, tmp259
	addq	%rdx, %rax	# tmp257, tmp260
	notrack jmp	*%rax	# tmp260
	.section	.rodata
	.align 4
	.align 4
.L240:
	.long	.L245-.L240
	.long	.L244-.L240
	.long	.L243-.L240
	.long	.L242-.L240
	.long	.L241-.L240
	.long	.L239-.L240
	.section	.text.startup
.L241:
# main.c:329:         case METHOD_SIMD:      subword_parallelism_matrix_multiply(A, B, C, L, M, N); break;
	movl	16(%rsp), %r9d	# %sfp,
	movl	24(%rsp), %r8d	# %sfp,
	leaq	112(%rsp), %rbx	#, tmp279
	movl	52(%rsp), %ecx	# %sfp,
	movq	(%rsp), %rdx	# %sfp,
	movq	40(%rsp), %rsi	# %sfp,
	movq	32(%rsp), %rdi	# %sfp,
	call	subword_parallelism_matrix_multiply	#
.L246:
# main.c:336:     gettimeofday(&stop, NULL);
	xorl	%esi, %esi	#
	movq	%rbx, %rdi	# tmp279,
	call	gettimeofday@PLT	#
# main.c:337:     timersub(&stop, &start, &total);
	movq	112(%rsp), %rdx	# MEM[(struct timeval *)_170].tv_sec, MEM[(struct timeval *)_170].tv_sec
	movq	120(%rsp), %rax	# MEM[(struct timeval *)_170].tv_usec, MEM[(struct timeval *)_170].tv_usec
	subq	96(%rsp), %rdx	# start.tv_sec, total$tv_sec
	subq	104(%rsp), %rax	# start.tv_usec, total$tv_usec
	jns	.L247	#,
# main.c:337:     timersub(&stop, &start, &total);
	subq	$1, %rdx	#, total$tv_sec
	addq	$1000000, %rax	#, total$tv_usec
.L247:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	pushq	%rax	# total$tv_usec
	.cfi_def_cfa_offset 232
	leaq	.LC11(%rip), %rsi	#, tmp272
	movl	$2, %edi	#,
	xorl	%eax, %eax	#
	pushq	%rdx	# total$tv_sec
	.cfi_def_cfa_offset 240
	movq	32(%rsp), %r15	# %sfp, _120
	movl	68(%rsp), %ebx	# %sfp, _125
	movl	72(%rsp), %r9d	# %sfp,
	movl	96(%rsp), %ecx	# %sfp,
	movl	%r15d, %r8d	# _120,
	movl	%ebx, %edx	# _125,
	call	__printf_chk@PLT	#
# main.c:365:     free_matrices(A, B, C, L, M, N);
	movl	40(%rsp), %r8d	# %sfp,
	movl	%r15d, %r9d	# _120,
	movl	%ebx, %ecx	# _125,
	movq	16(%rsp), %rdx	# %sfp,
	movq	56(%rsp), %rsi	# %sfp,
	movq	48(%rsp), %rdi	# %sfp,
	call	free_matrices	#
# main.c:367:     return 0;
	popq	%rax	#
	.cfi_def_cfa_offset 232
	popq	%rdx	#
	.cfi_def_cfa_offset 224
.L214:
# main.c:368: }
	movq	152(%rsp), %rax	# D.41664, tmp304
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp304
	jne	.L291	#,
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
.L239:
	.cfi_restore_state
# main.c:175:     #pragma omp parallel for schedule(dynamic)
	movl	16(%rsp), %eax	# %sfp, tmp384
	leaq	112(%rsp), %rbx	#, tmp279
	xorl	%ecx, %ecx	#
	xorl	%edx, %edx	#
	movq	%rbx, %rsi	# tmp279,
	leaq	combined_matrix_multiply._omp_fn.0(%rip), %rdi	#, tmp267
	movl	%eax, 144(%rsp)	# tmp384, MEM[(struct .omp_data_s.5 *)_170].N
	movl	24(%rsp), %eax	# %sfp, tmp385
	movl	%eax, 140(%rsp)	# tmp385, MEM[(struct .omp_data_s.5 *)_170].M
	movl	8(%rsp), %eax	# %sfp, tmp386
	movl	%eax, 136(%rsp)	# tmp386, MEM[(struct .omp_data_s.5 *)_170].L
	movq	(%rsp), %rax	# %sfp, C
	movq	%rax, 128(%rsp)	# C, MEM[(struct .omp_data_s.5 *)_170].C
	movq	40(%rsp), %rax	# %sfp, B
	movq	%rax, 120(%rsp)	# B, MEM[(struct .omp_data_s.5 *)_170].B
	movq	32(%rsp), %rax	# %sfp, A
	movq	%rax, 112(%rsp)	# A, MEM[(struct .omp_data_s.5 *)_170].A
	call	GOMP_parallel@PLT	#
# main.c:200: }
	jmp	.L246	#
.L245:
# main.c:325:         case METHOD_BASELINE:  matrix_multiply(A, B, C, L, M, N);                    break;
	movl	16(%rsp), %r9d	# %sfp,
	movl	24(%rsp), %r8d	# %sfp,
	leaq	112(%rsp), %rbx	#, tmp279
	movl	52(%rsp), %ecx	# %sfp,
	movq	(%rsp), %rdx	# %sfp,
	movq	40(%rsp), %rsi	# %sfp,
	movq	32(%rsp), %rdi	# %sfp,
	call	matrix_multiply	#
# main.c:325:         case METHOD_BASELINE:  matrix_multiply(A, B, C, L, M, N);                    break;
	jmp	.L246	#
.L244:
# main.c:326:         case METHOD_UNROLLED:  unrolled_matrix_multiply(A, B, C, L, M, N);            break;
	movl	16(%rsp), %r9d	# %sfp,
	movl	24(%rsp), %r8d	# %sfp,
	leaq	112(%rsp), %rbx	#, tmp279
	movl	52(%rsp), %ecx	# %sfp,
	movq	(%rsp), %rdx	# %sfp,
	movq	40(%rsp), %rsi	# %sfp,
	movq	32(%rsp), %rdi	# %sfp,
	call	unrolled_matrix_multiply	#
# main.c:326:         case METHOD_UNROLLED:  unrolled_matrix_multiply(A, B, C, L, M, N);            break;
	jmp	.L246	#
.L243:
# main.c:104:     #pragma omp parallel for
	movl	16(%rsp), %eax	# %sfp, tmp379
	vmovd	8(%rsp), %xmm7	# %sfp, tmp380
	xorl	%ecx, %ecx	#
	xorl	%edx, %edx	#
	vpinsrd	$1, 24(%rsp), %xmm7, %xmm0	# %sfp, tmp380, tmp262
	leaq	112(%rsp), %rbx	#, tmp279
	vmovq	32(%rsp), %xmm7	# %sfp, A
	leaq	multicore_matrix_multiply._omp_fn.0(%rip), %rdi	#, tmp265
	movl	%eax, 144(%rsp)	# tmp379, MEM[(struct .omp_data_s.0 *)_170].N
	movq	(%rsp), %rax	# %sfp, C
	movq	%rbx, %rsi	# tmp279,
	vmovq	%xmm0, 136(%rsp)	# tmp262, MEM <vector(2) int> [(int *)_170]
	vpinsrq	$1, 40(%rsp), %xmm7, %xmm0	# %sfp, A, tmp263
	movq	%rax, 128(%rsp)	# C, MEM[(struct .omp_data_s.0 *)_170].C
	vmovdqa	%xmm0, 112(%rsp)	# tmp263, MEM <vector(2) long unsigned int> [(double * * *)_170]
	call	GOMP_parallel@PLT	#
# main.c:115: }
	jmp	.L246	#
.L242:
# main.c:328:         case METHOD_BLOCKED:   blocked_matrix_multiply(A, B, C, L, M, N);             break;
	movl	16(%rsp), %r9d	# %sfp,
	movl	24(%rsp), %r8d	# %sfp,
	leaq	112(%rsp), %rbx	#, tmp279
	movl	52(%rsp), %ecx	# %sfp,
	movq	(%rsp), %rdx	# %sfp,
	movq	40(%rsp), %rsi	# %sfp,
	movq	32(%rsp), %rdi	# %sfp,
	call	blocked_matrix_multiply	#
# main.c:328:         case METHOD_BLOCKED:   blocked_matrix_multiply(A, B, C, L, M, N);             break;
	jmp	.L246	#
.L290:
# main.c:281:     for(int i=0; i<L; i++)
	cmpl	$0, 8(%rsp)	#, %sfp
	jle	.L292	#,
# main.c:290:     C = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movq	64(%rsp), %rsi	# %sfp,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, (%rsp)	# C, %sfp
# main.c:291:     if(C == NULL) {
	testq	%rax, %rax	# C
	je	.L234	#,
	movslq	16(%rsp), %rax	# %sfp, _121
	movq	%rax, 72(%rsp)	# _121, %sfp
	jmp	.L232	#
.L291:
# main.c:368: }
	call	__stack_chk_fail@PLT	#
.L212:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC7(%rip), %rdi	#, tmp216
	call	puts@PLT	#
# main.c:271:         return 0;
	jmp	.L214	#
.L210:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC6(%rip), %rdi	#, tmp210
	call	puts@PLT	#
# main.c:257:         return 0;
	jmp	.L214	#
.L250:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC5(%rip), %rdi	#, tmp205
	call	puts@PLT	#
# main.c:244:         print_help_and_exit(argv);
	movq	%r15, %rdi	# argv,
	call	print_help_and_exit	#
.L289:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC4(%rip), %rdi	#, tmp191
	call	puts@PLT	#
# main.c:232:         print_help_and_exit(argv);
	movq	%r15, %rdi	# argv,
	call	print_help_and_exit	#
.L238:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	92(%rsp), %edx	# %sfp,
	movl	$2, %edi	#,
	leaq	.LC10(%rip), %rsi	#, tmp268
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# main.c:333:             print_help_and_exit(argv);
	movq	%r15, %rdi	# argv,
	call	print_help_and_exit	#
.L292:
# main.c:290:     C = aligned_alloc(MEM_ALIGN, L * sizeof(double *));
	movq	64(%rsp), %rsi	# %sfp,
	movl	$32, %edi	#,
	call	aligned_alloc@PLT	#
	movq	%rax, (%rsp)	# C, %sfp
# main.c:291:     if(C == NULL) {
	testq	%rax, %rax	# C
	jne	.L248	#,
.L234:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC9(%rip), %rdi	#, tmp241
	call	puts@PLT	#
# main.c:293:         return 0;
	jmp	.L214	#
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
