section .text
	global _start
	extern print

_start:
	mov eax, 2
	int 80h

	cmp eax, 0 ; en eax esta el valor de retorno del fork. si eax==0 => estamos en el hijo
	jz _hijo

_padre:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_padre
	mov edx, lengthP
	int 80h
	
	jmp _end


_hijo:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_hijo
	mov edx, lengthH
	int 80h
	
_end:
	mov eax, 1
	mov ebx, 0
	int 80h


section .data
	msg_padre db "Soy el Padre", 10
	msg_hijo db "Soy el Hijo", 10
	
	lengthP equ $ - msg_padre
	lengthH equ $ - msg_hijo
