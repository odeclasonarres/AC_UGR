	.file	"pmm-secuencial.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"falta el n\303\272mero de filas/columnas\n"
.LC2:
	.string	"matriz1:"
.LC3:
	.string	"%d "
.LC4:
	.string	"matriz2:"
	.align 8
.LC5:
	.string	"\nResultado de multiplicaci\303\263n:"
.LC6:
	.string	"matriz[0][0]:%d\n"
.LC7:
	.string	"matriz[N-1][N-1]:%d\n"
	.align 8
.LC8:
	.string	"\nTiempo en ejecutar matriz1xmatriz2:%8.6f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	cmpl	$1, -100(%rbp)
	jg	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$35, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L3
.L4:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-32(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -20(%rbp)
.L3:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L4
	movl	-32(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -48(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L5
.L6:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-32(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -20(%rbp)
.L5:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L6
	movl	-32(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -56(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L7
.L8:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-32(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -20(%rbp)
.L7:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L8
	movl	$0, -20(%rbp)
	jmp	.L9
.L12:
	movl	$0, -24(%rbp)
	jmp	.L10
.L11:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$0, (%rax)
	addl	$1, -24(%rbp)
.L10:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L11
	addl	$1, -20(%rbp)
.L9:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L12
	movl	$0, -20(%rbp)
	jmp	.L13
.L16:
	movl	$0, -24(%rbp)
	jmp	.L14
.L15:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	-20(%rbp), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	addl	$1, -24(%rbp)
.L14:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L15
	addl	$1, -20(%rbp)
.L13:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L16
	movl	$0, -20(%rbp)
	jmp	.L17
.L20:
	movl	$0, -24(%rbp)
	jmp	.L18
.L19:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$1, (%rax)
	addl	$1, -24(%rbp)
.L18:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L19
	addl	$1, -20(%rbp)
.L17:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L20
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -20(%rbp)
	jmp	.L21
.L26:
	movl	$0, -24(%rbp)
	jmp	.L22
.L25:
	movl	$0, -28(%rbp)
	jmp	.L23
.L24:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movl	(%rdx), %ecx
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rsi
	movq	-48(%rbp), %rdx
	addq	%rsi, %rdx
	movq	(%rdx), %rdx
	movl	-28(%rbp), %esi
	movslq	%esi, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rdi
	movq	-56(%rbp), %rdx
	addq	%rdi, %rdx
	movq	(%rdx), %rdx
	movl	-24(%rbp), %edi
	movslq	%edi, %rdi
	salq	$2, %rdi
	addq	%rdi, %rdx
	movl	(%rdx), %edx
	imull	%esi, %edx
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -28(%rbp)
.L23:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L24
	addl	$1, -24(%rbp)
.L22:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L25
	addl	$1, -20(%rbp)
.L21:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L26
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-96(%rbp), %rdx
	movq	-80(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-88(%rbp), %rdx
	movq	-72(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC1(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	cmpl	$9, -32(%rbp)
	jg	.L27
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, -20(%rbp)
	jmp	.L28
.L31:
	movl	$0, -24(%rbp)
	jmp	.L29
.L30:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -24(%rbp)
.L29:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L30
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -20(%rbp)
.L28:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L31
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$0, -20(%rbp)
	jmp	.L32
.L35:
	movl	$0, -24(%rbp)
	jmp	.L33
.L34:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -24(%rbp)
.L33:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L34
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -20(%rbp)
.L32:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L35
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$0, -20(%rbp)
	jmp	.L36
.L39:
	movl	$0, -24(%rbp)
	jmp	.L37
.L38:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -24(%rbp)
.L37:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L38
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -20(%rbp)
.L36:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L39
	jmp	.L40
.L27:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-32(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	subq	$4, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L40:
	movq	-64(%rbp), %rax
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	leaq	.LC8(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, -20(%rbp)
	jmp	.L41
.L42:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -20(%rbp)
.L41:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L42
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, -20(%rbp)
	jmp	.L43
.L44:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -20(%rbp)
.L43:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L44
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, -20(%rbp)
	jmp	.L45
.L46:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -20(%rbp)
.L45:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L46
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 6.2.0-11) 6.2.0 20161103"
	.section	.note.GNU-stack,"",@progbits
