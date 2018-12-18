mov ah, 0x0e        ; tty mode
mov bp, 0x80000     ; tall point of the stack
mov sp, bp          ; mv line 2 into the stack

push 'A'
push 'B'
push 'C'            ; push these values into the stack


mov al, [0x7ffe]
int 0x10


mov al, [0x8000]
int 0x10


pop bx              ; manipulate into lower byte
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10


mov al, [0x8000]     ; mv all pop'd data from the stack into garbage
int 0x10


jmp $
times 510-($-$$) db 0
dw 0xaa55
