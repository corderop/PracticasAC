	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Falta tama\303\261o de la matriz (debe de ser cuadrada)\n"
.LC4:
	.string	" Tiempo: %f\n"
.LC5:
	.string	"y[0] = %f\ny[N-1] = %f\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB6:
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
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	decl	%edi
	jg	.L2
	movq	stderr(%rip), %rsi
	leaq	.LC0(%rip), %rdi
	call	fputs@PLT
	orl	$-1, %edi
	call	exit@PLT
.L2:
	movq	8(%rsi), %rdi
	call	atoi@PLT
	movsd	.LC1(%rip), %xmm0
	movsd	.LC2(%rip), %xmm1
	movl	%eax, %r12d
	movl	%eax, %eax
	leaq	15(,%rax,8), %rax
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	leaq	7(%rsp), %rbx
	subq	%rax, %rsp
	xorl	%eax, %eax
	movq	%rbx, %r13
	movq	%rsp, %r15
	andq	$-8, %rbx
	shrq	$3, %r13
.L3:
	cmpl	%eax, %r12d
	jbe	.L10
	movsd	%xmm0, (%rbx,%rax,8)
	movsd	%xmm1, (%r15,%rax,8)
	incq	%rax
	jmp	.L3
.L10:
	call	clock@PLT
	movq	%rax, %r14
	xorl	%eax, %eax
.L5:
	cmpl	%eax, %r12d
	jbe	.L11
	movsd	(%r15,%rax,8), %xmm0
	addsd	%xmm0, %xmm0
	addsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
	incq	%rax
	jmp	.L5
.L11:
	call	clock@PLT
	leaq	.LC4(%rip), %rdi
	subq	%r14, %rax
	cvtsi2sdq	%rax, %xmm0
	movb	$1, %al
	divsd	.LC3(%rip), %xmm0
	call	printf@PLT
	leal	-1(%r12), %eax
	movsd	0(,%r13,8), %xmm0
	leaq	.LC5(%rip), %rdi
	movsd	(%rbx,%rax,8), %xmm1
	movb	$2, %al
	call	printf@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1074266112
	.align 8
.LC3:
	.long	0
	.long	1093567616
	.ident	"GCC: (Arch Linux 9.3.0-1) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
