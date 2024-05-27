.global start

.section inittext
start:
	mov sp, stack_top
	; dump code
	mov r0, $0
	mov r1, $0

.ltorg

.section initdata
; stack
stack:
	.space 16384
stack_top:
