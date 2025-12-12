

GLOBAL sys_write 


sys_write:
	push ebp
	mov ebp, esp

	push ebx ; preservo ebx
		
	mov eax, 4 ; para syscall write
	mov ebx, [ebp + 8] ; fd pasado por la funcion desde C
	mov ecx, [ebp + 12] ; void* buffer pasado por la funcion desde C
	mov edx, [ebp + 16] ; int size pasado desde C

	int 80h

	pop ebx

	
	mov esp, ebp
	pop ebp

	ret
