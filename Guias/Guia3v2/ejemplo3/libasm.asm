GLOBAL pid

pid:	
	push ebp
	mov ebp, esp

	mov eax, 0x14 ; syscall getpid
	int 80h  ; guarda el resultado en eax

	mov esp, ebp
	pop ebp

	ret
