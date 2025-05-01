section .text
	GLOBAL _start
	EXTERN numtostr

_start:
	mov ebx, numbers ; en ebx guardo el array
	mov ecx, -1 ; indice para recorrer el array
  ; Uso bubble sort para ordenar
	mov edx, 0  ; flag para saber si termine
_loop:
	inc ecx
	cmp ecx, length - 1
	je _restartLoop

	mov esi, [ebx + ecx * 4]
	cmp esi, [ebx + (ecx + 1) * 4]  ; comparo dos contiguos
	jle _loop
	
	mov edx, 1 ; cambio la flag

	mov eax, [ebx + ecx * 4]
	mov esi, [ebx + (ecx + 1) * 4]
	mov [ebx + ecx * 4], esi
	mov [ebx + (ecx + 1) * 4], eax

	jmp _loop

_restartLoop:
	cmp edx, 0   ; si la flag esta en 0, no cambie nada, ya termine
	je _prePrint

	mov ecx, 0
	mov edx, 0  ; reseteo la flag
	jmp _loop

_prePrint:
	mov ecx, -1
_print:
	inc ecx
	push buffer
	mov esi, [ebx + ecx * 4]
	push esi
	call numtostr
	add esp, 4
	
	cmp ecx, length - 1
	jle _print

_end:
	mov eax, 1
	mov ebx, 0
	int 80h


section .data
	numbers dd 9, 8, 7, 6, 5, 4, 3, 2, 1
	length equ ($ - numbers) / 4

section .bss
	buffer resb 39
