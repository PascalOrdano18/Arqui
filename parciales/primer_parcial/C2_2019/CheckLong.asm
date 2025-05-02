
section .data
	message db "Hola Mundo", 0
	len db 10

global CheckLong


section .text
	
CheckLong:
	push ebp
	mov ebp, esp

	push ebx
	
	mov eax, message
	mov ebx, [len]
	mov ecx, 0
	
.loop:
	cmp [eax + ecx], 0   ; llegamos al \0 ?
	je check_result
	inc ecx
	jmp .loop


.check_result:
	inc ecx ; ecx was our index, at max it was len - 1, but we want to compare it with len
	sub ecx, ebx  ; calculated_len - len
	mov eax, ebx   ; we save on eax the result
	
.end:
	pop ebx
	
	mov esp, ebp
	pop ebp

	ret

