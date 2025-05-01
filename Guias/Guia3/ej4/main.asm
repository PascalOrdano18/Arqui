global get_seven

get_seven:
	push ebp
	mov ebp, esp

	mov eax, 7
	
	mov esp, ebp
	pop ebp
	ret
