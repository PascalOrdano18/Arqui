section .text

GLOBAL _start

_start:
    mov ecx, 0

_loop:
    cmp ecx, length
    je _print

    mov al, [cadena + ecx]

    cmp al, 'a'
    jl _nextChar

    cmp al, 'z'
    jg _nextChar

    sub al, difference
    mov [cadena + ecx], al


_nextChar:
    inc ecx
    jmp _loop

_print:
    mov edx, length
    mov ecx, cadena
    mov eax, 4
    mov ebx, 1
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

section .data

cadena db "h4ppy c0ding", 10
length equ $-cadena
difference equ 'a'-'A'
