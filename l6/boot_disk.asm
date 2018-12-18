disk_load:
    pusha       ; overwrite the stack for specific values
    push dx
    
    mov ah, 0x02    ; read command
    mov al, dh      ; sectors
    mov cl, 0x02    ; boot sector
    mov ch, 0x00    ; cylinder 0
    mov dh, 0x00    ; start from devices 0 = floppy, 1 = fl2, 0x80 = hdd, 0x81 hdd2

    int 0x13        ; bios interrupt <- [es:bx] where data is stored
    jc disk_error   ; if errors, place in carry bit
    pop dx
    cmp al, dh      ; cmp numbers of sectors
    jne sectors_error
    popa
    ret


disk_error:
    mov bx, DiskError
    call print
    call print_nl
    mov dh, ah      ; alert error code, dl = disk which dropped/made error
    call print_hex  ; print the error/disk (again)
    jmp disk_loop


sectors_error:
    mov bx, SectorsError
    call print


disk_loop:
    jmp $


DiskError: db "Disk read an error", 0
SectorsError: db "Incorrect num of sectors read", 0
