

section .text

global _start


_start:
	push ebp
	mov ebp, esp
	
	mov eax, 4
	mov ebx, 1
	mov ecx, [ebp + 16]
	mov edx, 200

	int 80h

	mov eax, 1
	mov ebx, 0
 	int 80h

