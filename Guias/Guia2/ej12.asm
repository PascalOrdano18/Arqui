section .text
	global _start
	extern numtostr

_start:
	push ebp
	mov ebp, esp
	mov eax, 0 ; eax has the byte count

_loop:
	push buffer
	call numtostr

	add eax, 4
	sub ebp, 4
	
	mov ecx, [ebp] ; intento acceder, da seg fault si ya recorri todo
	jmp _loop

_end:
	mov esp, ebp
	pop ebp
	
	mov eax, 1
	mov ebx, 0
	int 80h	

section .bss
	buffer resb 40
