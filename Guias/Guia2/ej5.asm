section .text
	GLOBAL _start
	EXTERN numtostr
_start:
	mov eax, 8 ; n
	mov ebx, 50 ; k
	mov ecx, 0 ; itero por ecx, le voy sumando n cada iteracion
_loop:
	add ecx, eax
	cmp ecx, ebx
	
	; aqui deberia agregar el valor de ecx a una cadena

	jg  _end ; si ecx > k -> termino

	push buffer
	push ecx
	
	call numtostr
	jmp _loop

_end:
	mov eax, 1
	mov ebx, 0
	
	int 80h
	
section .data
	buffer times 20 db 0
