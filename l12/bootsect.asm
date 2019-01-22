[org 0x7c00]
KERNEL_OFFSET equ 0x1000        ; link to kernel

    mov [BOOT_DRIVE], dl        ; the bios sets the boot drive in DL mode
    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print                  ; print current mode
    call print_nl               ; new line

    call load_kernel            ; loads kernel from disk
    call switch_to_pm           ; disable interrupts, load GDT, jumps to BEGIN_PM
    jmp $                       ; closing statement



%include "./helpers/boot_sect_print.asm"
%include "./helpers/boot_sect_print_hex.asm"
%include "./helpers/boot_sect_disk.asm"
%include "./helpers/32bit-gdt.asm"
%include "./helpers/32bit-print.asm"
%include "./helpers/32bit-switch.asm"



[bits 16]
load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call print                  ; print first kernel msg (loading msg)
    call print_nl               ; new line

    mov bx, KERNEL_OFFSET       ; read from the disk
    mov dh, 2
    mov dl, [BOOT_DRIVE]        ;
    call disk_load              ; load jOS
    ret



[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE      ; move into protected mode
    call print_string_pm        ; print if we are in protected mode
    call KERNEL_OFFSET          ; give kernel control
    jmp $                       ; closing statement



BOOT_DRIVE db 0                                         ; store boot drive in mem incase it is over written
MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE db "Landed in 32-bit Protected Mode", 0
MSG_LOAD_KERNEL db "Loading kernel into memory", 0


times 510 - ($-$$) db 0                                 ; again, let BIOS know we have an OS
dw 0xaa55