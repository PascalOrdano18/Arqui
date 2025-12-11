


section .text
GLOBAL _start

_start:
	mov ecx, 0   ; contador, indice del array (string)
	mov eax, cadena   ;puntero al inicio de la cadena
	jmp checkForNullTerminator

increasePointer:
	inc ecx
	jmp checkForNullTerminator
	
checkForNullTerminator:
	mov edx, eax
	add edx, ecx  ; edx es el puntero al char actual
	cmp ecx, len
	je printString
	jmp checkLetter	

checkLetter:
	cmp byte [edx], 'a'
	jl increasePointer
	cmp byte [edx], 'z'
	jg increasePointer
	jmp makeCapitalLetter 

makeCapitalLetter:
	sub byte [edx], difference 	
	jmp increasePointer


printString:
	mov eax, 4
	mov ebx, 1
	mov ecx, cadena
	mov edx, len
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h


section .data
	cadena db "h4ppy c0ding", 10	
	len equ $-cadena
	difference equ 'a'-'A'
