# AMO Firmware

Minimal ROM-resident firmware for the AMO CPU/SoC.

### What it does

This code performs only the entry point and memory initialization.

After initialization, it jumps to the kernel [Lamune](https://github.com/Lamune-Amo/Lamune).

### Interrupt Vectors

| Type         | Offset |
|--------------|--------|
| Reset        | 0x0    |
| Undefined    | 0x4    |
| IRQ          | 0x8    |
| SWI          | 0xC    |

On `Reset`, the firmware runs the initialization routine.

On `Undefined`, it halts (hangs).

For `IRQ` and `SWI`, the stubs immediately return, performing the original routine to continue.

At this early boot stage, interrupts are not meaningfully handled.

```
undefined:
	; alert
	; halt
	jmp .hlt

interrupt:
	ret r26

irq:
	ret r26
```