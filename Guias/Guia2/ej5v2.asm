
; Dado un número n y un valor k, imprimir todos los valores múltiplos de n desde 1 hasta k

; solucion rebuscada pero buena para practicar asembler

section .text
EXTERN num2str
GLOBAL _start
_start:
    push ebp
    mov ebp, esp

    mov eax, 5 ; n = 5 = eax
    mov ebx, 50; k = 50 = ebx

    mov ecx, 0 ; ecx va a ser la suma hasta k

loop:
    cmp ecx, ebx
    jg end
    
    add ecx, eax

    push eax
    push ebx
    push ecx

    push buffer
    push ecx
    call num2str
    add esp, 8

    pop ecx
    pop ebx
    pop eax

    push eax
    push ebx
    push ecx

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 20
	int 80h

	pop ecx
	pop ebx
	pop eax
	


    jmp loop


end:
    mov eax, 1
    mov ebx, 0
    int 80h


section .bss
    buffer resb 64




