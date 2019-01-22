[bits 16]
switch_to_pm:
    cli                         ; disable interrupts
    lgdt [gdt_descriptor]       ; load the GDT descriptor
    mov eax, cr0
    or eax, 0x1                 ; enable 32bit mode in cr0
    mov cr0, eax
    jmp CODE_SEG:init_pm        ; far jump (32b mde) - safely away from cpu


[bits 32]
init_pm:                ; use 32b instructions
    mov ax, DATA_SEG    ; update seg registers
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000    ; update stack on top of free space
    mov esp, ebp

    call BEGIN_PM       ; call useful code
