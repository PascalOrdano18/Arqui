global get_len
global sys_write

get_len:
	push ebp
	mov ebp, esp
	mov eax, 0
	mov edx, [ebp + 8] ; primer argumento, en este caso el char* str

	

.len_loop:
	cmp byte [edx + eax], 0   ; comparo con el null terminator \0
	je .end_len
	inc eax
	jmp .len_loop
	

sys_write:
	mov ebp, esp
	push ebp	

	push ebx

	mov eax, 0x4
	mov ebx, [ebp + 8] ;fd
	mov ecx, [ebp + 12] ; buffer
	mov edx, [ebp + 16] ; len
	int 80h


	pop ebx
	mov esp, ebp
	pop ebp
	
	ret

	
.end_len:
	mov esp, ebp
	pop ebp

	ret	

