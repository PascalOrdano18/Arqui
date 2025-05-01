section .text
	global _start
	extern print
	extern toString
	extern strlen
	extern exit

_start:

	push ebp
	mov ebp, esp

	mov ecx, DWORD[ebp + 4] ; #args
	dec ecx
	mov ebx, cadena
	call printParams

	mov esp, ebp
	pop ebp

	mov ebx, 0
	call exit

printParams:
	cmp ecx, 0
	je .endFunc
	add ebp, 12
	
.loop:
	mov ebx, [ebp]
	call print
	mov ebx, endString
	call print	
	add ebp, 4
	dec ecx
	cmp ecx, 0
	jne .loop
.endFunc:
	ret

section .data
	endString db 10, 0
section .bss
	cadena resb 20

