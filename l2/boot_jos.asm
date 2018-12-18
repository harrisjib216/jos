; this code isn't actually run/ran
; skipping some instructions to learn


x_marks_the_spot: ; define a variable
    db "X"


# test 1
mov al, x_marks_the_spot    ; fail, prints the mem address
..


# test 2
mov al, x_marks_the_spot    ; almost, but the boot/boot sector is placed in address 0x7c00, we need to insert the bootsector first
..


# test 3
mov bx, x_marks_the_spot    ; insert our variable into bx
mov bx, 0x7c00              ; next, insert the boot
mv al, [bx]                 ; now, print the contents


# test 4
mov al, [0x7c2d]            ; mv X in binary into the boot (shortcut) but this is inefficent since we'd update '2d + 0x7C00' with whichever value/lette
