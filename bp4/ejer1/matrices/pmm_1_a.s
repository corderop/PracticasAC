	.file	"pmm_1_a.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Falta tama\303\261o de la matriz (debe de ser cuadrada)\n"
	.align 8
.LC1:
	.string	"El tama\303\261o no puede ser menor a 2 y mayor que "
	.align 8
.LC5:
	.string	"Tama\303\261o matriz: %i\n Tiempo de ejecuci\303\263n: %f\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"m1[%i][%i] = %f\n"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Tama\303\261o vectores: %i\n Tiempo de ejecuci\303\263n: %f\n Primera componente: %f\n \303\232ltima componente: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$1, %edi
	jle	.L21
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %r15
	movl	%eax, %ebx
	leal	-2(%rax), %eax
	cmpl	$11583, %eax
	ja	.L3
	leal	-1(%r15), %ebp
	movsd	.LC3(%rip), %xmm0
	leaq	m1(%rip), %r13
	leaq	1(%rbp), %rax
	leaq	m2(%rip), %rcx
	imulq	$92688, %rax, %rdi
	leaq	0(,%rax,8), %rdx
	negq	%rax
	leaq	m3(%rip), %r12
	leaq	0(,%rax,8), %rsi
	.p2align 4,,10
	.p2align 3
.L4:
	leaq	(%rsi,%rdx), %rax
	.p2align 4,,10
	.p2align 3
.L5:
	movq	$0x000000000, 0(%r13,%rax)
	movsd	%xmm0, (%rcx,%rax)
	movsd	%xmm0, (%r12,%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L5
	addq	$92680, %rdx
	cmpq	%rdx, %rdi
	jne	.L4
	call	clock@PLT
	leaq	m2(%rip), %r8
	leaq	m1(%rip), %r14
	movq	%rax, 8(%rsp)
	imulq	$92680, %rbp, %rax
	movq	%r14, %r13
	movq	%r14, %r10
	leaq	92680(%r8), %r11
	addq	%rax, %r11
	leaq	8+m3(%rip), %rax
	leaq	(%rax,%rbp,8), %r9
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%r12, %rdi
	movq	%r10, %rsi
	.p2align 4,,10
	.p2align 3
.L11:
	movsd	(%rsi), %xmm0
	movq	%rdi, %rdx
	movq	%r8, %rax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	(%rax), %xmm1
	mulsd	(%rdx), %xmm1
	addl	$5, %ecx
	addq	$40, %rax
	addq	$463400, %rdx
	addsd	%xmm1, %xmm0
	movsd	-32(%rax), %xmm1
	mulsd	-370720(%rdx), %xmm1
	addsd	%xmm1, %xmm0
	movsd	-24(%rax), %xmm1
	mulsd	-278040(%rdx), %xmm1
	addsd	%xmm1, %xmm0
	movsd	-16(%rax), %xmm1
	mulsd	-185360(%rdx), %xmm1
	addsd	%xmm1, %xmm0
	movsd	-8(%rax), %xmm1
	mulsd	-92680(%rdx), %xmm1
	addsd	%xmm1, %xmm0
	cmpl	%ecx, %ebx
	ja	.L8
	addq	$8, %rdi
	movsd	%xmm0, (%rsi)
	addq	$8, %rsi
	cmpq	%rdi, %r9
	jne	.L11
	addq	$92680, %r8
	addq	$92680, %r10
	cmpq	%r8, %r11
	jne	.L7
	call	clock@PLT
	pxor	%xmm0, %xmm0
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC4(%rip), %xmm0
	cmpl	$11, %r15d
	jbe	.L22
	imulq	$92688, %rbp, %rbp
	movl	%r15d, %esi
	movsd	m1(%rip), %xmm1
	leaq	.LC7(%rip), %rdi
	movl	$3, %eax
	movsd	0(%r13,%rbp), %xmm2
	call	printf@PLT
.L15:
	addq	$24, %rsp
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
.L22:
	.cfi_restore_state
	movl	%r15d, %esi
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	xorl	%r12d, %r12d
	call	printf@PLT
	leaq	.LC6(%rip), %r13
.L13:
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L14:
	movsd	(%r14,%rbx,8), %xmm0
	movl	%ebx, %edx
	movl	%r12d, %esi
	movq	%r13, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	%rbx, %rax
	addq	$1, %rbx
	cmpq	%rax, %rbp
	jne	.L14
	addl	$1, %r12d
	addq	$92680, %r14
	cmpl	%r15d, %r12d
	jne	.L13
	jmp	.L15
.L3:
	movq	stderr(%rip), %rcx
	movl	$46, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	fwrite@PLT
	orl	$-1, %edi
	call	exit@PLT
.L21:
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
	.comm	m3,1073697800,32
	.comm	m2,1073697800,32
	.comm	m1,1073697800,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1073741824
	.align 8
.LC4:
	.long	0
	.long	1093567616
	.ident	"GCC: (Arch Linux 9.3.0-1) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
