[bits 32]	; 32 bit

VIDEO_MEM equ 0xb8000		; constant
Black_and_White equ 0x0f	; each char color


print:
	pusha
	mov edx, VIDEO_MEM


print_loop:
	mov al, [ebx]			; insert val of Video mem
	mov ah, Black_and_White		; input Black and White color into Video mem
	cmp al, 0			; check if string ended
	je print_done
	
	mov [edx], ax			; store char in video mem
	add ebx, 1			; increment base
	add ebx, 2			; next video mem pos
	

	jmp print_loop			; exec again if not finished


print_done:
	popa				; clear registers/stack
	ret				; finish
