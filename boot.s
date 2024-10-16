.global start

.section .inittext
start:
	; vector table
	jmp reset
	jmp interrupt

; far away jump
reset:
	; initialize MEMORY

	; clear Video RAM
	mov r1, $4096
	mov r2, $8896
	mov r3, $0
.CL0:
	str [r1], r3
	add r1, r1, $4
	bne r1, r2, .CL0

	; jump to entry point for OS
	mov r0, $0x2400
	jal r0

	; halt
.hlt:
	jmp .hlt

interrupt:
	mov r0, $42 ; temporary
	jmp r0

.ltorg
