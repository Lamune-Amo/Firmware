
# this section should be fixed: lamune OS packing
all:
	@echo "makefile"
	@./bin/as boot.s -o boot.o
	@./bin/ld -T setup.ld boot.o -o boot
#@./bin/objcopy -O binary elf_binary boot_binary
#@rm elf_binary
