	call	clock_gettime
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movsd	v1(%rax), %xmm0
	addq	$8, %rax
	addsd	v2-8(%rax), %xmm0
	movsd	%xmm0, v3-8(%rax)
	cmpq	%rbx, %rax
	jne	.L7
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
