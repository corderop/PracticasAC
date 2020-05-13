	.file	"daxpy.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Falta tama\303\261o de la matriz (debe de ser cuadrada)\n"
.LC4:
	.string	" Tiempo: %f\n"
.LC5:
	.string	"y[0] = %f\ny[N-1] = %f\n"
	.text
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
	subq	$136, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -132(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpl	$1, -132(%rbp)
	jg	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$50, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	movq	-144(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -124(%rbp)
	movl	-124(%rbp), %eax
	movl	%eax, %edx
	subq	$1, %rdx
	movq	%rdx, -112(%rbp)
	movl	%eax, %edx
	movq	%rdx, -160(%rbp)
	movq	$0, -152(%rbp)
	movl	%eax, %edx
	movq	%rdx, -176(%rbp)
	movq	$0, -168(%rbp)
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -104(%rbp)
	movl	-124(%rbp), %eax
	movl	%eax, %edx
	subq	$1, %rdx
	movq	%rdx, -96(%rbp)
	movl	%eax, %edx
	movq	%rdx, %r14
	movl	$0, %r15d
	movl	%eax, %edx
	movq	%rdx, %r12
	movl	$0, %r13d
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -88(%rbp)
	movl	$2, -116(%rbp)
	movl	$0, -120(%rbp)
	jmp	.L3
.L4:
	movq	-104(%rbp), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, (%rax,%rdx,8)
	movq	-88(%rbp), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	movsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -120(%rbp)
.L3:
	movl	-120(%rbp), %eax
	cmpl	%eax, -124(%rbp)
	ja	.L4
	call	clock@PLT
	movq	%rax, -80(%rbp)
	movl	$0, -120(%rbp)
	jmp	.L5
.L6:
	cvtsi2sdl	-116(%rbp), %xmm1
	movq	-88(%rbp), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-104(%rbp), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm0
	addsd	%xmm1, %xmm0
	movq	-104(%rbp), %rax
	movl	-120(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -120(%rbp)
.L5:
	movl	-120(%rbp), %eax
	cmpl	%eax, -124(%rbp)
	ja	.L6
	call	clock@PLT
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	subq	-80(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-124(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-104(%rbp), %rax
	movl	%edx, %edx
	movsd	(%rax,%rdx,8), %xmm0
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	movq	%rbx, %rsp
	movl	$0, %eax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leaq	-40(%rbp), %rsp
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
	.section	.rodata
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
