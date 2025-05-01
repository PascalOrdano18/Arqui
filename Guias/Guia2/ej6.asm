section .text
	GLOBAL _start
	EXTERN numtostr
	
_start:
	mov ebx, 8 ; ebx = n
	mov eax, 1 ; en eax guardo la respuesta
_loop:
	mul ebx ; multiplico ebx * eax
	dec ebx
	
	cmp ebx, 1
	jnz _loop

	push buffer
	push eax
	call numtostr

_end:
	mov eax, 1
	mov ebx, 0
	int 80h

section .data
	buffer times 20 db 0
