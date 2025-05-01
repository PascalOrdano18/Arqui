section .text
	global _start
	extern numtostr
	extern print
_start:

	push ebp
	mov ebp, esp

	mov eax, 20
	int 80h
	
	push buffer
	push eax
	call numtostr

	mov esp, ebp	
	pop ebp

	mov eax, 1
	mov ebx, 0
	int 80h

section .bss
	buffer resb 20
