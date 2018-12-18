mov ah, 0x0e        ; tty
mov al, [x_val]     ; doesn't work
int 0x10

mov bx, 0x7c0
mov ds, bx          ; review
mov al, [x_val]
int 0x10

mov al, [es:x_val]  ; bootsector not initiated, gonna break m8
int 0x10

mov bx, 0x7c0       ; perfecto
mov es, bx
mov al, [es:x_val]
int 0x10

jmp $

x_val:
    db "x"

times 510-($-$$) db 0
dw 0xaa55
