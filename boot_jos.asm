; insert zeros into the first 510 bytes
loop:
    jmp loop 

; continued
times 510-($-$$) db 0

; apply the boot code
dw 0xaa55 
