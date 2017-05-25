	.file	"pmm-secuencial-modificadoA.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"falta el n\303\272mero de filas/columnas\n"
	.align 8
.LC1:
	.string	"Ultimo valor de i para N=%d: %d\n\n"
.LC3:
	.string	"matriz1:"
.LC4:
	.string	"%d "
.LC5:
	.string	"matriz2:"
	.align 8
.LC6:
	.string	"\nResultado de multiplicaci\303\263n:"
.LC7:
	.string	"matriz[0][0]:%d\n"
.LC8:
	.string	"matriz[N-1][N-1]:%d\n"
	.align 8
.LC9:
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
	movl	-32(%rbp), %ecx
	movl	$715827883, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	testl	%edx, %edx
	jne	.L21
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -20(%rbp)
	jmp	.L22
.L27:
	movl	$0, -24(%rbp)
	jmp	.L23
.L26:
	movl	$0, -28(%rbp)
	jmp	.L24
.L25:
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
	addq	$1, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
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
	addq	$2, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
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
	addq	$3, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$3, %rdx
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
	addq	$4, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
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
	addq	$5, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$5, %rdx
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
	addl	$6, -28(%rbp)
.L24:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L25
	addl	$1, -24(%rbp)
.L23:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L26
	addl	$1, -20(%rbp)
.L22:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L27
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	jmp	.L28
.L21:
	movl	-32(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jne	.L29
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -20(%rbp)
	jmp	.L30
.L35:
	movl	$0, -24(%rbp)
	jmp	.L31
.L34:
	movl	$0, -28(%rbp)
	jmp	.L32
.L33:
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
	addq	$1, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
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
	addq	$2, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
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
	addq	$3, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$3, %rdx
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
	addq	$4, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$4, %rdx
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
	addl	$5, -28(%rbp)
.L32:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L33
	addl	$1, -24(%rbp)
.L31:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L34
	addl	$1, -20(%rbp)
.L30:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L35
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	jmp	.L28
.L29:
	movl	-32(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L36
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -20(%rbp)
	jmp	.L37
.L42:
	movl	$0, -24(%rbp)
	jmp	.L38
.L41:
	movl	$0, -28(%rbp)
	jmp	.L39
.L40:
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
	addq	$1, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
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
	addq	$2, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
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
	addq	$3, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$3, %rdx
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
	addl	$4, -28(%rbp)
.L39:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L40
	addl	$1, -24(%rbp)
.L38:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L41
	addl	$1, -20(%rbp)
.L37:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L42
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	jmp	.L28
.L36:
	movl	-32(%rbp), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jne	.L43
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -20(%rbp)
	jmp	.L44
.L49:
	movl	$0, -24(%rbp)
	jmp	.L45
.L48:
	movl	$0, -28(%rbp)
	jmp	.L46
.L47:
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
	addq	$1, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
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
	addq	$2, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
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
	addl	$3, -28(%rbp)
.L46:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L47
	addl	$1, -24(%rbp)
.L45:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L48
	addl	$1, -20(%rbp)
.L44:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L49
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	jmp	.L28
.L43:
	movl	-32(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L50
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -20(%rbp)
	jmp	.L51
.L56:
	movl	$0, -24(%rbp)
	jmp	.L52
.L55:
	movl	$0, -28(%rbp)
	jmp	.L53
.L54:
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
	addq	$1, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
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
	addl	$2, -28(%rbp)
.L53:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L54
	addl	$1, -24(%rbp)
.L52:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L55
	addl	$1, -20(%rbp)
.L51:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L56
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	jmp	.L28
.L50:
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -20(%rbp)
	jmp	.L57
.L62:
	movl	$0, -24(%rbp)
	jmp	.L58
.L61:
	movl	$0, -28(%rbp)
	jmp	.L59
.L60:
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
.L59:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L60
	addl	$1, -24(%rbp)
.L58:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L61
	addl	$1, -20(%rbp)
.L57:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L62
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
.L28:
	movl	-20(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-32(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
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
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	cmpl	$9, -32(%rbp)
	jg	.L63
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$0, -20(%rbp)
	jmp	.L64
.L67:
	movl	$0, -24(%rbp)
	jmp	.L65
.L66:
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
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -24(%rbp)
.L65:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L66
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -20(%rbp)
.L64:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L67
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$0, -20(%rbp)
	jmp	.L68
.L71:
	movl	$0, -24(%rbp)
	jmp	.L69
.L70:
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
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -24(%rbp)
.L69:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L70
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -20(%rbp)
.L68:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L71
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$0, -20(%rbp)
	jmp	.L72
.L75:
	movl	$0, -24(%rbp)
	jmp	.L73
.L74:
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
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -24(%rbp)
.L73:
	movl	-24(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L74
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -20(%rbp)
.L72:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L75
	jmp	.L76
.L63:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
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
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L76:
	movq	-64(%rbp), %rax
	movq	%rax, -120(%rbp)
	movsd	-120(%rbp), %xmm0
	leaq	.LC9(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, -20(%rbp)
	jmp	.L77
.L78:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -20(%rbp)
.L77:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L78
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, -20(%rbp)
	jmp	.L79
.L80:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -20(%rbp)
.L79:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L80
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, -20(%rbp)
	jmp	.L81
.L82:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -20(%rbp)
.L81:
	movl	-20(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L82
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
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 6.2.0-11) 6.2.0 20161103"
	.section	.note.GNU-stack,"",@progbits
