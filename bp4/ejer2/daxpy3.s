	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Falta tama\303\261o de la matriz (debe de ser cuadrada)\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	" Tiempo: %f\n"
.LC7:
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
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L22
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %r12
	movl	%eax, %eax
	leaq	15(,%rax,8), %rax
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	leaq	7(%rsp), %rbx
	subq	%rax, %rsp
	movq	%rbx, %r13
	movq	%rsp, %r14
	andq	$-8, %rbx
	shrq	$3, %r13
	testl	%r12d, %r12d
	je	.L3
	cmpl	$1, %r12d
	je	.L14
	movl	%r12d, %edx
	movapd	.LC1(%rip), %xmm1
	movapd	.LC2(%rip), %xmm0
	xorl	%eax, %eax
	shrl	%edx
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L5:
	movups	%xmm1, (%rbx,%rax)
	movups	%xmm0, (%r14,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L5
	movl	%r12d, %eax
	andl	$-2, %eax
	cmpl	%eax, %r12d
	je	.L23
.L4:
	movq	.LC3(%rip), %rcx
	cltq
	movq	.LC4(%rip), %rsi
	movq	%rcx, (%rbx,%rax,8)
	movq	%rsi, (%r14,%rax,8)
	call	clock@PLT
	movq	%rax, %r15
	cmpl	$1, %r12d
	je	.L24
.L8:
	movl	%r12d, %eax
	xorl	%edx, %edx
	shrl	%eax
	salq	$4, %rax
	.p2align 4,,10
	.p2align 3
.L10:
	movupd	(%r14,%rdx), %xmm0
	movupd	(%rbx,%rdx), %xmm3
	addpd	%xmm0, %xmm0
	addpd	%xmm3, %xmm0
	movups	%xmm0, (%rbx,%rdx)
	addq	$16, %rdx
	cmpq	%rdx, %rax
	jne	.L10
	movl	%r12d, %edx
	andl	$-2, %edx
	testb	$1, %r12b
	je	.L12
.L7:
	movslq	%edx, %rdx
	movsd	(%r14,%rdx,8), %xmm0
	leaq	(%rbx,%rdx,8), %rax
	addsd	%xmm0, %xmm0
	addsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
.L12:
	call	clock@PLT
	pxor	%xmm0, %xmm0
	leaq	.LC6(%rip), %rdi
	subq	%r15, %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC5(%rip), %xmm0
	call	printf@PLT
	leal	-1(%r12), %eax
	movsd	0(,%r13,8), %xmm0
	leaq	.LC7(%rip), %rdi
	movsd	(%rbx,%rax,8), %xmm1
	movl	$2, %eax
	call	printf@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L25
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
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L7
.L23:
	call	clock@PLT
	movq	%rax, %r15
	jmp	.L8
.L3:
	call	clock@PLT
	movq	%rax, %r15
	jmp	.L12
.L14:
	xorl	%eax, %eax
	jmp	.L4
.L25:
	call	__stack_chk_fail@PLT
.L22:
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 16
.LC2:
	.long	0
	.long	1074266112
	.long	0
	.long	1074266112
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	1074266112
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.ident	"GCC: (Arch Linux 9.3.0-1) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
