print:
    pusha       ; print the value in the stack


start:
    mov al, [bx]    ; print val of the string (we passsed in *main.asm)
    cmp al, 0       ; if nothing on screen, finish
    je done

    mov ah, 0x0e
    int 0x10
    
    add bx, 1       ; increment base pointer (index) for the loop
    jmp start


done:
    popa            ; clear the stack (entirely)
    ret


print_nl:
    pusha           ; clear the stack (relatively)
    mov ah, 0x0e
    mov al, 0x0a    ; new line character
    int 0x10        ; hang, next instruction for the screen/cpu
    mov al, 0x0d    ; ?
    int 0x10
    popa
    ret
