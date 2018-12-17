mov ah, 0x0e    ; talk to you mode
mov al, 'J'     ; instruction to insert into display register
int 0x10        ; hang/wait, new instruction coming
mov al, 'O'
int 0x10
mov al, 'S'
int 0x10
mov al, '!'
int 0x10
int 0x10
int 0x10        ; hang/input last instruction

jmp $ ; begin at infinite loop (nothing)

; apply boot key
times 510 - ($-$$) db 0
dw 0xaa55
