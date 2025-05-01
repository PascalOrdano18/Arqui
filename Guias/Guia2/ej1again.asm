

GLOBAL _start
section .text


_start:	
	MOV ecx, cadena
	MOV edx, length
	MOV ebx, 1
	MOV eax, 4	
	INT 80H

	MOV eax, 1
	MOV ebx, 0
	INT 80H


section .data
	
cadena db "Hello World", 10
length equ $-cadena
