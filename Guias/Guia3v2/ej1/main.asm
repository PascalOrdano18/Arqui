

section .text
GLOBAL main
EXTERN hola

main:
	call hola

	mov eax, 1
	mov ebx, 0
	int 80h

