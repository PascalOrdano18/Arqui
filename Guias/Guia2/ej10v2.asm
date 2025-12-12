; Escriba un programa que imprima en pantalla la cantidad de argumentos que tiene dicho programa

section .text

GLOBAL _start
EXTERN num2str

_start:
	push ebp
	mov ebp, esp
	
	mov eax, 4
	mov ebx, 1
	mov ecx, argsAmount
	mov edx, lenArgsAmount
	int 80h

	push ebx
	push ecx
	push edx

	; llamo a num2str para imprimir el argc
	mov eax, [ebp + 4] ; ARGC
	push buffer
	push eax


	call num2str
	add esp, 8

	pop edx
	pop ecx
	pop ebx
	
	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	mov edx, 20
	int 80h
	
	mov ecx, 0  ; argv s index
	push ecx	
	jmp printNewLine
loop:
	pop ecx
	cmp ecx, [ebp + 4] 
	jg end

	mov eax, 4
	mov ebx, 1
	mov ecx, argv1
	mov edx, lenArgv1
	int 80h

	push ebx
	push ecx
	push edx
	
	mov eax, ecx ; tiene el indice del argv
	push buffer
	push eax
	call num2str
	add esp, 8

	pop edx
	pop ecx
	pop ebx

	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	mov edx, 20
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, argv2
	mov edx, lenArgv2
	int 80h


	mov eax, 4
	mov ebx, 1
	mov ecx, [ebp + 8 + ecx * 4]
	mov edx, 20
	
	inc ecx
	push ecx
	jmp printNewLine	
printNewLine:
	mov eax, 4
	mov ebx, 1
	mov ecx, newLine 
	mov edx, 1
	int 80h

	jmp loop
end:
	mov esp, ebp
	pop ebp
	mov eax, 1
	mov ebx, 0
	int 80h
section .data
	argsAmount db "Cantidad de argumentos: "
	lenArgsAmount equ $-argsAmount
	argv1 db "argv["
	lenArgv1 equ $-argv1
	argv2 db "]: "
	lenArgv2 equ $-argv2
	newLine db 10 ; \n 
section .bss
	buffer resb 20


