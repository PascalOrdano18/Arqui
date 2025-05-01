section .text

global num2str

_num2str:

	; Primero chequeo que el numero no sea 0
	cmp eax, 0
	jnz convert  ; si no es 0 empiezo a convertir numeros a ascii
	mov byte edi, '0'
	inc edi
	jmp end

_convert:
	mov edx, 0
	mov ecx, 10
	div ecx   ; divide eax por 10, eax = cociente, edx = resto
	
	add dl, '0'  ; convierte el numero a caracter ascii 
	; se le suma '0' al registro dl porque el resto de la division esta en edx (32 bits, 4 bytes), pero lo que queremos es sumarle el valor de un byte unicamente, entonces usamos el registro low, el dl (8 bits, 1 byte)
	push edx
	inc edi

	cmp eax, 0
	jnz convert
	
	mov edi, ebx

_write:
	pop edx		; saca un digito de la pila y lo escribo en edi (ese digito es dl)
	mov [edi], dl
	inc edi
	
	cmp edi, ebx
	jne write

_end:
	mov byte [edi], 0
	
	mov eax, 4
	mov ebx, 1
	mov ecx, [edi]
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
	
