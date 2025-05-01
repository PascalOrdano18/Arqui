section .text
	GLOBAL _start
	EXTERN numtostr

_start:
	push buffer
	mov eax, [esp + 4]
	push eax
	call numtostr
	
	mov eax, 1
	mov ebx, 0	
	int 80h

section .bss
	buffer resb 20
