	.text
	.file	"main"
	.globl	not_maion                       # -- Begin function not_maion
	.p2align	4, 0x90
	.type	not_maion,@function
not_maion:                              # @not_maion
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edi, -12(%rsp)
	movl	$2123504, -8(%rsp)              # imm = 0x2066F0
	addl	$2123504, %edi                  # imm = 0x2066F0
	movl	%edi, -4(%rsp)
	movb	$1, -13(%rsp)
	retq
.Lfunc_end0:
	.size	not_maion, .Lfunc_end0-not_maion
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
