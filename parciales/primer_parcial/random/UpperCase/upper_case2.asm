global to_upper

section .text

to_upper:
	push ebp
	mov ebp, esp
	
	mov ecx, [ebp + 8]  ; array ptr
	
	mov edx, 0  ; flag

.loop:
	cmp byte [ecx], 0   ; have we reached the null terminator?
	je .end

	cmp byte [ecx], ' '  ; is it a space
	je .update_flag

	cmp edx, 1 ; is the flag on?
	je .next_char

	; if the flag is off -> Validate if 'a' < char < 'z'

	cmp byte [ecx], 'a'
	jl .next_char
	cmp byte [ecx], 'z'
	jg .next_char
	
	; if the flag is off and char is valid -> turn to upper case
	sub byte [ecx], 32   ; turn char upper case
	inc edx  ; now the flag is set to 1
	jmp .next_char


.next_char:
	inc ecx
	jmp .loop

.update_flag:
	dec edx
	jmp .next_char

.end:
	mov esp, ebp
	pop ebp
	
	ret
