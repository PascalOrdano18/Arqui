section .text
	global _start
	extern print

_start:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8] ; pointer to argv
	mov ecx, 0	; counter/index for env vars
_loop:
	mov ebx, 0
	inc ecx
	cmp dword [eax + ecx * 4], 0 ; si da cero llegamos al final de los argumentos
	jne _loop
	jmp _end 
	
_loopString:
	mov esi, byte [var + ebx]
	mov edi, [eax + ecx * 4]
	mov edi, byte [edi + ebx]
	cmp esi, edi
	jne _loop
	inc ebx
	cmp ebx, length
	jne _loopString
	
	mov ebx, [eax + ecx * 4]
	add ebx, length
	call print

_end:
	mov esp, ebp
	pop ebp
	ret



section .data
	var db "USER=", 0
	length db 5
section .bss
	user_name resb 128
