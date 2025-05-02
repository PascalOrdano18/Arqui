; Turn the first letter of every word capital letter
; Receive the text from a C function as a char*

global to_upper

section .text

to_upper:
	push ebp
	mov ebp, esp

	;
	mov eax, [ebp + 8]  ;  eax = text.  The argument provided from the C function
	mov edx, [eax]
	mov ecx, 0  ; create the flag here
	jmp .loop

.update_flag:
	inc edx
	mov ecx, 0   ; ecx = flag. 1 if we already uppercased the first letter, 0 if not. Turns back to 0 when we reach a ' '

.loop:
	cmp edx, 0  ; Have we reached the null terminator?
	je .end

	cmp ecx, 0
	je .make_upper_case
	inc eax  ; we go to the next character on the text
	jmp .loop
	

.make_upper_case:
	cmp edx, ' '   ; are we on a space?
	jmp .update_flag
	cmp edx, 'a'
	jle .loop     ; if we are not 'a' < char < 'z' we loop again
	cmp edx, 'z'
	jge .loop
	 
	; If we got here, then we are on a non capital letter
	mov edx, edx + '0'  ; we make the letter capital letter
	inc ecx  ; we update the flag to 1, meaning we already uppercased it
	jmp .loop


.end:
	mov esp, ebp
	pop ebp

	ret


	




