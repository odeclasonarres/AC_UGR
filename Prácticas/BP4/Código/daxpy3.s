	.file	"daxpy.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Sintaxis de ejecucion: ./daxpy <Tam_vector> <Constante_multiplicativa>\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"Tiempo (seg): %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	cmpl	$2, %edi
	jle	.L45
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movq	%rax, %r15
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, %r14d
	call	strtol@PLT
	movl	%eax, %r13d
	movslq	%r15d, %rax
	leaq	-80(%rbp), %rsi
	leaq	18(,%rax,4), %rax
	xorl	%edi, %edi
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	movq	%rsp, %rbx
	subq	%rax, %rsp
	call	clock_gettime@PLT
	movq	%rbx, %rsi
	movl	%r15d, %eax
	movl	%r13d, -120(%rbp)
	shrq	$2, %rsi
	movd	-120(%rbp), %xmm5
	movq	%rsp, %r12
	negq	%rsi
	movl	%r15d, -84(%rbp)
	andl	$3, %esi
	pshufd	$0, %xmm5, %xmm3
	cmpl	%r15d, %esi
	movdqa	.LC1(%rip), %xmm2
	cmova	%r15d, %esi
	cmpl	$6, %r15d
	movl	%esi, %ecx
	movdqa	%xmm3, %xmm4
	cmovbe	%r15d, %ecx
	subl	%ecx, %eax
	movl	%ecx, %r9d
	psrlq	$32, %xmm4
	movl	%eax, -112(%rbp)
	subl	$4, %eax
	salq	$2, %r9
	shrl	$2, %eax
	leaq	(%rbx,%r9), %r11
	addq	%rsp, %r9
	addl	$1, %eax
	movl	%eax, -92(%rbp)
	sall	$2, %eax
	movl	%eax, -116(%rbp)
	leal	-1(%r15), %eax
	movl	%eax, %edi
	subl	%ecx, %edi
	cmpl	$4, %r15d
	cmovbe	%r15d, %esi
	movl	%edi, -100(%rbp)
	movl	%r15d, %edi
	subl	%esi, %edi
	movl	%esi, %r8d
	subl	%esi, %eax
	leal	-4(%rdi), %edx
	movl	%edi, -104(%rbp)
	salq	$2, %r8
	leaq	(%rsp,%r8), %r10
	movl	%eax, -96(%rbp)
	addq	%rbx, %r8
	shrl	$2, %edx
	leal	1(%rdx), %edi
	movl	%edi, -88(%rbp)
	sall	$2, %edi
	movl	%edi, -108(%rbp)
	movl	$5000, %edi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L46:
	cmpl	$1, %ecx
	movl	$1, (%rbx)
	movl	$1, (%r12)
	je	.L27
	cmpl	$2, %ecx
	movl	$1, 4(%rbx)
	movl	$1, 4(%r12)
	je	.L28
	cmpl	$3, %ecx
	movl	$1, 8(%rbx)
	movl	$1, 8(%r12)
	je	.L29
	cmpl	$4, %ecx
	movl	$1, 12(%rbx)
	movl	$1, 12(%r12)
	je	.L30
	cmpl	$5, %ecx
	movl	$1, 16(%rbx)
	movl	$1, 16(%r12)
	je	.L31
	movl	$1, 20(%rbx)
	movl	$1, 20(%r12)
	movl	$6, %eax
.L19:
	cmpl	%ecx, -84(%rbp)
	je	.L20
.L18:
	cmpl	$2, -100(%rbp)
	jbe	.L21
	xorl	%edx, %edx
	xorl	%r15d, %r15d
.L4:
	movaps	%xmm2, (%r11,%rdx)
	addl	$1, %r15d
	movups	%xmm2, (%r9,%rdx)
	addq	$16, %rdx
	cmpl	-92(%rbp), %r15d
	jb	.L4
	movl	-116(%rbp), %edx
	addl	%edx, %eax
	cmpl	%edx, -112(%rbp)
	je	.L20
.L21:
	movslq	%eax, %rdx
	movl	$1, (%rbx,%rdx,4)
	movl	$1, (%r12,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r14d
	jle	.L20
	addl	$2, %eax
	movslq	%edx, %rdx
	cmpl	%eax, %r14d
	movl	$1, (%rbx,%rdx,4)
	movl	$1, (%r12,%rdx,4)
	jle	.L20
	cltq
	movl	$1, (%rbx,%rax,4)
	movl	$1, (%r12,%rax,4)
.L20:
	testl	%esi, %esi
	je	.L22
	movl	(%r12), %eax
	imull	%r13d, %eax
	addl	%eax, (%rbx)
	cmpl	$1, %esi
	movl	$1, %eax
	je	.L9
	movl	4(%r12), %eax
	imull	%r13d, %eax
	addl	%eax, 4(%rbx)
	cmpl	$2, %esi
	movl	$2, %eax
	je	.L9
	movl	8(%r12), %eax
	imull	%r13d, %eax
	addl	%eax, 8(%rbx)
	cmpl	$3, %esi
	movl	$3, %eax
	je	.L9
	movl	12(%r12), %eax
	imull	%r13d, %eax
	addl	%eax, 12(%rbx)
	movl	$4, %eax
.L9:
	cmpl	-84(%rbp), %esi
	je	.L17
.L8:
	cmpl	$2, -96(%rbp)
	jbe	.L11
	xorl	%edx, %edx
	xorl	%r15d, %r15d
.L12:
	movdqu	(%r10,%rdx), %xmm0
	addl	$1, %r15d
	movdqa	%xmm0, %xmm1
	psrlq	$32, %xmm0
	pmuludq	%xmm4, %xmm0
	pshufd	$8, %xmm0, %xmm0
	pmuludq	%xmm3, %xmm1
	pshufd	$8, %xmm1, %xmm1
	punpckldq	%xmm0, %xmm1
	movdqa	(%r8,%rdx), %xmm0
	paddd	%xmm1, %xmm0
	movaps	%xmm0, (%r8,%rdx)
	addq	$16, %rdx
	cmpl	%r15d, -88(%rbp)
	ja	.L12
	movl	-108(%rbp), %edx
	addl	%edx, %eax
	cmpl	%edx, -104(%rbp)
	je	.L17
.L11:
	movslq	%eax, %rdx
	movl	(%r12,%rdx,4), %r15d
	imull	%r13d, %r15d
	addl	%r15d, (%rbx,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%edx, %r14d
	jle	.L17
	movslq	%edx, %rdx
	addl	$2, %eax
	movl	(%r12,%rdx,4), %r15d
	imull	%r13d, %r15d
	addl	%r15d, (%rbx,%rdx,4)
	cmpl	%r14d, %eax
	jge	.L17
	cltq
	movl	(%r12,%rax,4), %edx
	imull	%r13d, %edx
	addl	%edx, (%rbx,%rax,4)
.L17:
	subl	$1, %edi
	je	.L16
.L3:
	testl	%r14d, %r14d
	jle	.L17
	testl	%ecx, %ecx
	jne	.L46
	xorl	%eax, %eax
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L22:
	xorl	%eax, %eax
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L28:
	movl	$2, %eax
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L27:
	movl	$1, %eax
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L31:
	movl	$5, %eax
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$4, %eax
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L29:
	movl	$3, %eax
	jmp	.L19
.L16:
	leaq	-64(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	-56(%rbp), %rax
	subq	-72(%rbp), %rax
	leaq	.LC3(%rip), %rdi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	-64(%rbp), %rax
	subq	-80(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	printf@PLT
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L45:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	leaq	.LC0(%rip), %rdi
	movl	$71, %edx
	movl	$1, %esi
	call	fwrite@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1
	.long	1
	.long	1
	.long	1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 6.2.0-11) 6.2.0 20161103"
	.section	.note.GNU-stack,"",@progbits
