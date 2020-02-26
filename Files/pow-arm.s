	.text
	.file	"pow.c"
	.globl	power
	.align	2
	.type	power,@function
power:
	stp	x29, x30, [sp, #-16]!
	mov	 x29, sp
	sub	sp, sp, #32
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	ldr	w1, [sp, #12]
	cbnz	w1, .LBB0_2
	orr	x8, xzr, #0x1
	stur	x8, [x29, #-8]
	b	.LBB0_3
.LBB0_2:
	ldr	x8, [sp, #16]
	ldr	x0, [sp, #16]
	ldr	w9, [sp, #12]
	sub	w1, w9, #1
	str		x8, [sp]
	bl	power
	ldr		x8, [sp]
	mul		x8, x8, x0
	stur	x8, [x29, #-8]
.LBB0_3:
	ldur	x0, [x29, #-8]
	mov	 sp, x29
	ldp	x29, x30, [sp], #16
	ret
.Lfunc_end0:
	.size	power, .Lfunc_end0-power


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
