section .text
	GLOBAL _start
	EXTERN numtostr

_start:
	mov eax, 10 ; numero hasta el cual sumar
	mov ecx, 0  ; en ecx guardo la suma
	cmp eax, 0 ; si es cero retorno, esto es para chequear por si me inputean un numero, pero ahora uso solo el 10
	jz _end


_loop:
	add ecx, eax
	dec eax
	cmp ecx, 0
	jnz _loop

	push buffer ; creo que numtostr espero los parametros asi
	push ecx	
	call numtostr

_end:
	mov eax, 1
	mov ebx, 0
	int 80h 

section .data
	buffer times 20 db 0
