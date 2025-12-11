
; Dado un número n y un valor k, imprimir todos los valores múltiplos de n desde 1 hasta k

; solucion rebuscada pero buena para practicar asembler

section .text
EXTERN num2str
GLOBAL _start
_start:
    pop ebp
    mov ebp, esp

    mov eax, 5 ; n = 5 = eax
    mov ebx, 50; k = 50 = ebx

    mov ecx, 1 ; ecx va a ser la suma hasta k

loop:
    cmp ecx, ebx
    jg end
    
    push ecx ; voy poniendo en la pila cada multiplo
    add ecx, eax

    push buffer
    push ecx
    call num2str
    add esp, 8
    
    jmp loop


end:
    mov eax, 1
    mov eax, 0
    int 80h


section .bss
    buffer resb 64




