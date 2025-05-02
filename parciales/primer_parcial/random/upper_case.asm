; Turn the first letter of every word capital letter
; Receive the text from a C function as a char*

global to_upper

section .text

to_upper:
	push ebp
	mov ebp, esp

	;
	mov esi, [ebp + 8]  ;  eax = text.  The argument provided from the C function
	mov ecx, 0  ; create the flag here
	jmp .loop

.update_flag:
	mov ecx, 0   ; ecx = flag. 1 if we already uppercased the first letter, 0 if not. Turns back to 0 when we reach a ' '
.next_char:
	inc esi ; incrementamos el pointer

.loop:
	mov dl, [esi]
	cmp dl, 0  ; Have we reached the null terminator?
	je .end

	cmp ecx, 0
	jne .next_char

	cmp dl, ' '
	je .update_flag
	
	; flag = 0 & 'a' < char < 'z'
	cmp dl, 'a'
	jl .next_char
	cmp dl, 'z'
	jg .next_char

	sub dl, 32  ; make it capital letter
	mov byte [esi], dl   ; write back the changed char to upercase to esi
	mov ecx, 1  ; update the flag
	jmp .next_char	

.end:
	mov esp, ebp
	pop ebp

	ret


	




