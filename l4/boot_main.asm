[org 0x7c00]    ; begin at the bootsector code

mov bx, HOWDY   ; base instruction: print our text/data passed
call print      ; print the base instruction
call print_nl   ; print a new line


mov bx, SeeYaLater    ; try it again
call print
call print_nl

mov dx, 0x12fe           ; specify hex point/stack variable
call print_hex          ; print dx

jmp $                   ; hang


; include other code (custom functions)
%include "boot_print.asm"
%include "boot_print_hex.asm"


HOWDY:          ; data for our variables
    db 'Hey neighbor', 0    ; 0 -> null byte/char, end string

SeeYaLater:     ; again
    db 'Bye, hasta manana!', 0


; begin booting
times 510-($-$$) db 0
dw 0xaa55
