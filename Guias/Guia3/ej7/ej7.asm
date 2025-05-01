global _start
extern main

section .text	
_start:
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 80h
	
	call main
	
	ret




section .data
	msg db "Mensaje desde assmbler", 10
	len equ $ - msg
