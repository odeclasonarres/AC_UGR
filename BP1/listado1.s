	.file	"listado1.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\302\272 componentes del vector"
	.align 8
.LC1:
	.string	"Error en la reserva de espacio para los vectores"
	.align 8
.LC4:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	cmpl	$1, %edi
	jle	.L18
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %ebx
	movq	%rax, %r13
	movl	%eax, %r14d
	leaq	0(,%rbx,8), %r15
	movq	%r15, %rdi
	call	malloc@PLT
	movq	%r15, %rdi
	movq	%rax, %rbp
	call	malloc@PLT
	movq	%r15, %rdi
	movq	%rax, %r12
	call	malloc@PLT
	testq	%rbp, %rbp
	movq	%rax, %r15
	sete	%dl
	testq	%r12, %r12
	sete	%al
	orb	%al, %dl
	jne	.L3
	testq	%r15, %r15
	je	.L3
	testl	%r13d, %r13d
	je	.L19
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	movsd	.LC2(%rip), %xmm3
	cvtsi2sdq	%rbx, %xmm1
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L8:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm7
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm2
	subsd	%xmm0, %xmm7
	addsd	%xmm1, %xmm2
	movsd	%xmm7, (%r12,%rax,8)
	movsd	%xmm2, 0(%rbp,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r14d
	ja	.L8
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L9:
	movsd	0(%rbp,%rax,8), %xmm0
	addsd	(%r12,%rax,8), %xmm0
	movsd	%xmm0, (%r15,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %r14d
	ja	.L9
.L10:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leal	-1(%r13), %ecx
	pxor	%xmm0, %xmm0
	leaq	.LC4(%rip), %rdi
	pxor	%xmm1, %xmm1
	movl	%r13d, %esi
	movsd	(%r15,%rcx,8), %xmm6
	movq	%rcx, %rdx
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movsd	(%r12,%rcx,8), %xmm5
	movsd	0(%rbp,%rcx,8), %xmm4
	movl	%ecx, %r8d
	movsd	(%r15), %xmm3
	movsd	(%r12), %xmm2
	cvtsi2sdq	%rax, %xmm1
	movl	$7, %eax
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	0(%rbp), %xmm1
	call	printf@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%r15, %rdi
	call	free@PLT
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	jmp	.L10
.L3:
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$-2, %edi
	call	exit@PLT
.L18:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2576980378
	.long	1069128089
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 6.2.0-11) 6.2.0 20161103"
	.section	.note.GNU-stack,"",@progbits
