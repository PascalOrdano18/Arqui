global pid

pid:
	push ebp
	mov ebp, esp
	
	mov eax, 0x14
	int 80h
	
	mov esp, ebp
	pop ebp

	ret
