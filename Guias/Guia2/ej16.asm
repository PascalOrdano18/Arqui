section .text
	global _start


_start:
	push ebp
	mov ebp, esp	

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 80h
	

	mov eax, 3
	mov ebx, 0
	mov ecx, buffer
	mov edx, 100
	int 80h
	
	mov esi, eax
	dec esi
	mov ecx, -1

_loop:
	inc ecx
	cmp ecx, esi
	je _print

	mov al, byte [buffer + ecx]
	cmp al, 'a'
	jl _loop	
	cmp al, 'z'
	jg _loop

	sub byte [buffer + ecx], 32
	jmp _loop

_print:

	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	mov edx, esi 
	int 80h
	
_end:
	mov eax, 1
	mov ebx, 0	
	int 80h




section .data:
	msg db "Ingrese una palabra", 10
	len equ $ - msg

section .bss:
	buffer resb 100
