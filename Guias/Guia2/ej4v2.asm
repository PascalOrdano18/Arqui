; Dado un número n, imprimir la suma de los primeros n números naturales
;(No utilizaruna fórmula).


; mov eax, 48
; push eax
; call nNaturales

section .text

GLOBAL _start
extern num2str


_start:
	push ebp
	mov ebp, esp
	; 32 bits -> 4 bytes 8-12 esta el push eax de la linea 6 (de otro programa)
	mov eax, 5 ; ejemplo, 5
	mov ecx, 0 	; ecx es el numero que toca sumar
	xor ebx, ebx ; ebx contiene la suma actual

loop:
	inc ecx	
	add ebx, ecx
		
	cmp ecx, eax
	jl loop

print:
	push buffer ; en ebx quedo la suma de los n numeros	
	push ebx
	call num2str
	
	add esp, 8 ; chequear luego -> debo arreglar mi esp ?  

	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	mov edx, 20
	int 80h

end:
	mov esp, ebp
	pop ebp

	mov eax, 1
	mov ebx, 0
	int 80h

section .bss
	buffer resb 16

