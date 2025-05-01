section .text
	GLOBAL _start
	EXTERN numtostr

_start:
	mov ecx, 0 ; indice para recorrer el array (ecx * 4) 
	mov eax, [numbers] ; guardo el primer numero en eax
	mov ebx, numbers
_loop:
	inc ecx
	cmp ecx, length
	jz _end

	cmp eax, [ebx + ecx*4]
	jle _loop
		
	mov eax, [ebx + ecx*4]
	jmp _loop
_end:
	push buffer
	push eax	
	call numtostr

	mov eax, 1
	mov ebx, 0
	int 80h

section .data
	buffer times 20 db 0
	numbers dd 5, 8, 200, 9, 140, 40, 12    ; dd = define double word (4 bytes)
	length equ ($ - numbers) / 4 ; length = tamano total, se lo pedi a gpt
