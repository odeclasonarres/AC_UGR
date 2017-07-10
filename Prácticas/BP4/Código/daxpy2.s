	.file	"daxpy.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Sintaxis de ejecucion: ./daxpy <Tam_vector> <Constante_multiplicativa>\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
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
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	cmpl	$2, %edi
	jle	.L14
	movq	8(%rsi), %rdi
	movq	%rsi, %r13
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%r13), %rdi
	movq	%rax, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	movslq	%ebx, %rbx
	movl	%eax, %r12d
	call	strtol@PLT
	movl	%eax, %r14d
	leaq	18(,%rbx,4), %rax
	leaq	-64(%rbp), %rsi
	xorl	%edi, %edi
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	movq	%rsp, %rbx
	subq	%rax, %rsp
	call	clock_gettime@PLT
	movq	%rsp, %r13
	movl	$5000, %ecx
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%eax, %eax
	testl	%r12d, %r12d
	jle	.L8
	.p2align 4,,10
	.p2align 3
.L9:
	movl	$1, (%rbx,%rax,4)
	movl	$1, 0(%r13,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r12d
	jg	.L9
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movl	0(%r13,%rax,4), %edx
	imull	%r14d, %edx
	addl	%edx, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r12d
	jg	.L5
.L8:
	subl	$1, %ecx
	jne	.L3
	leaq	-48(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	-40(%rbp), %rax
	subq	-56(%rbp), %rax
	leaq	.LC2(%rip), %rdi
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	-48(%rbp), %rax
	subq	-64(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	printf@PLT
	leaq	-32(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L14:
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 6.2.0-11) 6.2.0 20161103"
	.section	.note.GNU-stack,"",@progbits
