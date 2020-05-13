	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Falta tama\303\261o de la matriz (debe de ser cuadrada)\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	" Tiempo: %f\n"
.LC5:
	.string	"y[0] = %f\ny[N-1] = %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
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
	subq	$40, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L15
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %edx
	leaq	15(,%rdx,8), %rdx
	shrq	$4, %rdx
	salq	$4, %rdx
	subq	%rdx, %rsp
	leaq	7(%rsp), %rbx
	subq	%rdx, %rsp
	movq	%rbx, %r13
	movq	%rsp, %r15
	andq	$-8, %rbx
	shrq	$3, %r13
	testl	%eax, %eax
	je	.L3
	leal	-1(%rax), %edx
	movsd	.LC1(%rip), %xmm1
	xorl	%eax, %eax
	movsd	.LC2(%rip), %xmm0
	movq	%rdx, %r12
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rax, %rcx
	movsd	%xmm1, (%rbx,%rax,8)
	movsd	%xmm0, (%r15,%rax,8)
	addq	$1, %rax
	cmpq	%rdx, %rcx
	jne	.L4
	movq	%rdx, -72(%rbp)
	call	clock@PLT
	movq	-72(%rbp), %rdx
	movq	%rax, %r14
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L6:
	movsd	(%r15,%rax,8), %xmm0
	movq	%rax, %rcx
	addsd	%xmm0, %xmm0
	addsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
	addq	$1, %rax
	cmpq	%rdx, %rcx
	jne	.L6
.L7:
	call	clock@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC4(%rip), %rdi
	subq	%r14, %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC3(%rip), %xmm0
	call	printf@PLT
	movsd	(%rbx,%r12,8), %xmm1
	movl	$2, %eax
	movsd	0(,%r13,8), %xmm0
	leaq	.LC5(%rip), %rdi
	call	printf@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L16
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
.L3:
	.cfi_restore_state
	call	clock@PLT
	movl	$4294967295, %r12d
	movq	%rax, %r14
	jmp	.L7
.L16:
	call	__stack_chk_fail@PLT
.L15:
	movq	stderr(%rip), %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE22:
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
