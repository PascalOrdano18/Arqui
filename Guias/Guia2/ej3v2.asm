;Agregar a la biblioteca una función que recibe un número y una zona de memoria, y transforme el número en un string, terminado con cero, en la zona de memoria pasada como parámetro

; esto se llama desde otro lado como:
;   push numero
;   push puntero
;   call num2str



section .text

GLOBAL _start
GLOBAL num2str

_start:
	mov eax, 1234

	push buffer
	push eax
	
	call num2str

	add esp, 8  ; con esto limpio el stack frame de la funcion num2str

	;; prueba a ver si se armo bien el string

	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	mov edx, 20
	int 80h


	mov eax, 1
	mov ebx, 0
	int 80h

num2str:
	push ebp
	mov ebp, esp
	
	; se suman de a 4 porque es una arquitectura de 32 bits, es decir, cada direccion tiene 4 bytes
	mov eax, [ebp + 8] ; arme mi stack frame, ahora ebp + 8 tiene el numbero
	mov edi, [ebp + 12] ;    edi es el puntero donde debe quedar el string
	mov esi, edi

	mov ecx, 0


loop:
	cmp eax, 0  ; eax es el cociente, si es cero, ya no divido mas
	je write

	; me preparo para dividir
	; el resto queda en edx, que va a ser el numero digito a pasar a string
	xor edx, edx
	mov ebx, 10 ; ebx es el divisor
	div ebx    ; acabo de dividir eax / ebx , dejando el resto en edx
	
	; uso dl porque es la parte baja de edx, son 8 bits, un byte, lo que ocupa mi char.
	; esto me sirve para poner en el lugar del array ese byte exacto, volviendo la operacion legal,; byte a byte
	add dl, '0'  ; le sumo el ascii del cero, ahora converti el numero a su ascii
	push edx
	inc ecx
	jmp loop
	

write:
	pop eax
	mov [esi], eax
	inc esi
	dec ecx
	cmp ecx, 0 
	jne write


end:
	mov byte [esi + 1], 0
	mov esp, ebp
	pop ebp

	ret

section .bss
	buffer resb 16


