[org 0x7c00]        ; bootloader offset
    mov bp, 0x9000  ; set the stack
    mov sp, bp      ; ^

    mov bx, MSG_REAL_MODE
    call print      ; executed after BIOS messages

    call switch_to_pm
    jmp $           ; never executed ?


; rewrote these files
%include "boot_sect_print.asm"
%include "32bit-gdt.asm"
%include "32bit-print.asm"
%include "32bit-switch.asm"

[bits 32]
BEGIN_PM:           ; here, after the switch to 32bit protected mode
    mov ebx, MSG_PROT_MODE
    call print_string_pm        ; top left corner (no manip. yet)
    jmp $


MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PROT_MODE db "Loaded 32-bit protected mode", 0


; bootsector
times 510-($-$$) db 0
dw 0xaa55
