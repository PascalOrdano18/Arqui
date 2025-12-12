
; Escribir un programa que dado un array de números enteros, de 4 bytes, encuentre el menor, y lo imprima por salida estándar.

; importantisimo que son numeros de 4 bytes
; ese dato me dice que no puedo hacer comparaciones a nivel de byte
; ni usar los registros low, debo usar el registro entero


section .text

GLOBAL _start
EXTERN num2str

_start:
	push ebp
	mov ebp, esp
	
	mov eax, array
	mov ecx, 0
	mov edx, [eax] ; pongo el primer elemento en edx

loop:
	cmp ecx, len
	je print

	cmp edx, [eax + ecx * 4]
	jg changeSmaller
	inc ecx
	jmp loop


changeSmaller:
	mov edx, [eax + ecx * 4]
	inc ecx
	jmp loop


print:
	push buffer
	push edx
	call num2str
	add esp, 8

	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	mov edx, 64 

	int 80h

end:
	mov eax, 1
	mov ebx, 0
	int 80h

section .data	
	array dd 32, 10, 5, 3, 31, 444, 100, 256
	len equ 8
section .bss
	buffer resb 20

