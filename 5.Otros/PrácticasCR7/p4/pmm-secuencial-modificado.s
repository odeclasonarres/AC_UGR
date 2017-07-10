	.file	"pmm-secuencial-modificado.c"
	.intel_syntax noprefix
	.section	.rodata
	.align 8
.LC0:
	.string	"falta el n\303\272mero de filas/columnas\n"
.LC1:
	.string	"Empieza multiplicacion"
.LC2:
	.string	"Termina multiplicacion"
	.align 8
.LC3:
	.string	"Ultimo valor de i para N=%d: %d\n\n"
.LC5:
	.string	"matriz1:"
.LC6:
	.string	"%d "
.LC7:
	.string	"matriz2:"
	.align 8
.LC8:
	.string	"\nResultado de multiplicaci\303\263n:"
.LC9:
	.string	"matriz[0][0]:%d\n"
.LC10:
	.string	"matriz[N-1][N-1]:%d\n"
	.align 8
.LC11:
	.string	"\nTiempo en ejecutar matriz1xmatriz2:%8.6f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB499:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 152
	.cfi_offset 3, -24
	mov	DWORD PTR [rbp-132], edi
	mov	QWORD PTR [rbp-144], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR [rbp-24], rax
	xor	eax, eax
	cmp	DWORD PTR [rbp-132], 1
	jg	.L2
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 35
	mov	esi, 1
	mov	edi, OFFSET FLAT:.LC0
	call	fwrite
	mov	edi, -1
	call	exit
.L2:
	mov	rax, QWORD PTR [rbp-144]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi
	mov	DWORD PTR [rbp-104], eax
	mov	eax, DWORD PTR [rbp-104]
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbp-96], rax
	mov	DWORD PTR [rbp-128], 0
	jmp	.L3
.L4:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-96]
	lea	rbx, [rdx+rax]
	mov	eax, DWORD PTR [rbp-104]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbx], rax
	add	DWORD PTR [rbp-128], 1
.L3:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L4
	mov	eax, DWORD PTR [rbp-104]
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbp-88], rax
	mov	DWORD PTR [rbp-128], 0
	jmp	.L5
.L6:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-88]
	lea	rbx, [rdx+rax]
	mov	eax, DWORD PTR [rbp-104]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbx], rax
	add	DWORD PTR [rbp-128], 1
.L5:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L6
	mov	eax, DWORD PTR [rbp-104]
	cdqe
	sal	rax, 3
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbp-80], rax
	mov	DWORD PTR [rbp-128], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-80]
	lea	rbx, [rdx+rax]
	mov	eax, DWORD PTR [rbp-104]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc
	mov	QWORD PTR [rbx], rax
	add	DWORD PTR [rbp-128], 1
.L7:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L8
	mov	DWORD PTR [rbp-128], 0
	jmp	.L9
.L12:
	mov	DWORD PTR [rbp-124], 0
	jmp	.L10
.L11:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-96]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-124]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	mov	DWORD PTR [rax], 0
	add	DWORD PTR [rbp-124], 1
.L10:
	mov	eax, DWORD PTR [rbp-124]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L11
	add	DWORD PTR [rbp-128], 1
.L9:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L12
	mov	DWORD PTR [rbp-128], 0
	jmp	.L13
.L16:
	mov	DWORD PTR [rbp-124], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-88]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-124]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	mov	edx, DWORD PTR [rbp-128]
	add	edx, 1
	mov	DWORD PTR [rax], edx
	add	DWORD PTR [rbp-124], 1
.L14:
	mov	eax, DWORD PTR [rbp-124]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L15
	add	DWORD PTR [rbp-128], 1
.L13:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L16
	mov	DWORD PTR [rbp-128], 0
	jmp	.L17
.L20:
	mov	DWORD PTR [rbp-124], 0
	jmp	.L18
.L19:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-80]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-124]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	mov	DWORD PTR [rax], 1
	add	DWORD PTR [rbp-124], 1
.L18:
	mov	eax, DWORD PTR [rbp-124]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L19
	add	DWORD PTR [rbp-128], 1
.L17:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L20
	mov	eax, DWORD PTR [rbp-104]
	lea	edx, [rax+7]
	test	eax, eax
	cmoveq	eax, edx
	sar	eax, 3
	mov	DWORD PTR [rbp-100], eax
	mov	edi, OFFSET FLAT:.LC1
	call	puts
	lea	rax, [rbp-64]
	mov	rsi, rax
	mov	edi, 0
	call	clock_gettime
	mov	DWORD PTR [rbp-116], 0
	jmp	.L21
.L30:
	mov	DWORD PTR [rbp-112], 0
	jmp	.L22
.L29:
	mov	DWORD PTR [rbp-128], 0
	jmp	.L23
.L28:
	mov	eax, DWORD PTR [rbp-116]
	mov	DWORD PTR [rbp-124], eax
	jmp	.L24
.L27:
	mov	DWORD PTR [rbp-108], 0
	mov	eax, DWORD PTR [rbp-112]
	mov	DWORD PTR [rbp-120], eax
	jmp	.L25
.L26:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-88]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-120]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR [rbp-120]
	cdqe
	lea	rcx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-80]
	add	rax, rcx
	mov	rax, QWORD PTR [rax]
	mov	ecx, DWORD PTR [rbp-124]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	imul	eax, edx
	add	DWORD PTR [rbp-108], eax
	add	DWORD PTR [rbp-120], 1
.L25:
	mov	edx, DWORD PTR [rbp-112]
	mov	eax, DWORD PTR [rbp-100]
	add	edx, eax
	mov	eax, DWORD PTR [rbp-104]
	cmp	edx, eax
	cmovle	eax, edx
	cmp	eax, DWORD PTR [rbp-120]
	jg	.L26
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-96]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-124]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	mov	edx, DWORD PTR [rbp-128]
	movsx	rdx, edx
	lea	rcx, [0+rdx*8]
	mov	rdx, QWORD PTR [rbp-96]
	add	rdx, rcx
	mov	rdx, QWORD PTR [rdx]
	mov	ecx, DWORD PTR [rbp-124]
	movsx	rcx, ecx
	sal	rcx, 2
	add	rdx, rcx
	mov	ecx, DWORD PTR [rdx]
	mov	edx, DWORD PTR [rbp-108]
	add	edx, ecx
	mov	DWORD PTR [rax], edx
	add	DWORD PTR [rbp-124], 1
.L24:
	mov	edx, DWORD PTR [rbp-116]
	mov	eax, DWORD PTR [rbp-100]
	add	edx, eax
	mov	eax, DWORD PTR [rbp-104]
	cmp	edx, eax
	cmovle	eax, edx
	cmp	eax, DWORD PTR [rbp-124]
	jg	.L27
	add	DWORD PTR [rbp-128], 1
.L23:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L28
	mov	eax, DWORD PTR [rbp-100]
	add	DWORD PTR [rbp-112], eax
.L22:
	mov	eax, DWORD PTR [rbp-112]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L29
	mov	eax, DWORD PTR [rbp-100]
	add	DWORD PTR [rbp-116], eax
.L21:
	mov	eax, DWORD PTR [rbp-116]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L30
	lea	rax, [rbp-48]
	mov	rsi, rax
	mov	edi, 0
	call	clock_gettime
	mov	edi, OFFSET FLAT:.LC2
	call	puts
	mov	eax, DWORD PTR [rbp-128]
	lea	edx, [rax-1]
	mov	eax, DWORD PTR [rbp-104]
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC3
	mov	eax, 0
	call	printf
	mov	rdx, QWORD PTR [rbp-48]
	mov	rax, QWORD PTR [rbp-64]
	sub	rdx, rax
	mov	rax, rdx
	pxor	xmm1, xmm1
	cvtsi2sdq	xmm1, rax
	mov	rdx, QWORD PTR [rbp-40]
	mov	rax, QWORD PTR [rbp-56]
	sub	rdx, rax
	mov	rax, rdx
	pxor	xmm0, xmm0
	cvtsi2sdq	xmm0, rax
	movsd	xmm2, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm2
	addsd	xmm1, xmm0
	movq	rax, xmm1
	mov	QWORD PTR [rbp-72], rax
	cmp	DWORD PTR [rbp-104], 9
	jg	.L31
	mov	edi, OFFSET FLAT:.LC5
	call	puts
	mov	DWORD PTR [rbp-128], 0
	jmp	.L32
.L35:
	mov	DWORD PTR [rbp-124], 0
	jmp	.L33
.L34:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-88]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-124]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC6
	mov	eax, 0
	call	printf
	add	DWORD PTR [rbp-124], 1
.L33:
	mov	eax, DWORD PTR [rbp-124]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L34
	mov	edi, 10
	call	putchar
	add	DWORD PTR [rbp-128], 1
.L32:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L35
	mov	edi, OFFSET FLAT:.LC7
	call	puts
	mov	DWORD PTR [rbp-128], 0
	jmp	.L36
.L39:
	mov	DWORD PTR [rbp-124], 0
	jmp	.L37
.L38:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-80]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-124]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC6
	mov	eax, 0
	call	printf
	add	DWORD PTR [rbp-124], 1
.L37:
	mov	eax, DWORD PTR [rbp-124]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L38
	mov	edi, 10
	call	putchar
	add	DWORD PTR [rbp-128], 1
.L36:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L39
	mov	edi, OFFSET FLAT:.LC8 #empiezaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
	call	puts
	mov	DWORD PTR [rbp-128], 0
	jmp	.L40
.L43:
	mov	DWORD PTR [rbp-124], 0
	jmp	.L41
.L42:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-96]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-124]
	movsx	rdx, edx
	sal	rdx, 2
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC6
	mov	eax, 0
	call	printf
	add	DWORD PTR [rbp-124], 1
.L41:
	mov	eax, DWORD PTR [rbp-124]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L42
	mov	edi, 10
	call	putchar
	add	DWORD PTR [rbp-128], 1
.L40:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L43
	jmp	.L44
.L31:
	mov	rax, QWORD PTR [rbp-96]
	mov	rax, QWORD PTR [rax]
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC9
	mov	eax, 0
	call	printf
	mov	eax, DWORD PTR [rbp-104]
	cdqe
	sal	rax, 3
	lea	rdx, [rax-8]
	mov	rax, QWORD PTR [rbp-96]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR [rbp-104]
	movsx	rdx, edx
	sal	rdx, 2
	sub	rdx, 4
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	mov	edi, OFFSET FLAT:.LC10
	mov	eax, 0
	call	printf
.L44:
	mov	rax, QWORD PTR [rbp-72]
	mov	QWORD PTR [rbp-152], rax
	movsd	xmm0, QWORD PTR [rbp-152]
	mov	edi, OFFSET FLAT:.LC11 #terminaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
	mov	eax, 1
	call	printf
	mov	DWORD PTR [rbp-128], 0
	jmp	.L45
.L46:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-88]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free
	add	DWORD PTR [rbp-128], 1
.L45:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L46
	mov	rax, QWORD PTR [rbp-88]
	mov	rdi, rax
	call	free
	mov	DWORD PTR [rbp-128], 0
	jmp	.L47
.L48:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-80]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free
	add	DWORD PTR [rbp-128], 1
.L47:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L48
	mov	rax, QWORD PTR [rbp-80]
	mov	rdi, rax
	call	free
	mov	DWORD PTR [rbp-128], 0
	jmp	.L49
.L50:
	mov	eax, DWORD PTR [rbp-128]
	cdqe
	lea	rdx, [0+rax*8]
	mov	rax, QWORD PTR [rbp-96]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free
	add	DWORD PTR [rbp-128], 1
.L49:
	mov	eax, DWORD PTR [rbp-128]
	cmp	eax, DWORD PTR [rbp-104]
	jl	.L50
	mov	rax, QWORD PTR [rbp-96]
	mov	rdi, rax
	call	free
	mov	rax, QWORD PTR [rbp-24]
	xor	rax, QWORD PTR fs:40
	je	.L51
	call	__stack_chk_fail
.L51:
	add	rsp, 152
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE499:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
