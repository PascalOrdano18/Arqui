
; 	8042 Status Register (port 64h read)

;   al hacer int 64h, obtenemos 8 bits que significan:

;   0 -> Output buffer full: 1 si hay datos para leer en el buffer de salida, 0 si no
;   1 -> Input buffer full: (60h / 64h)
;   0


;   al hacer int 60h, obtenemos la lectura del teclado

global set_read_keyboard

section .text

set_read_keyboard:
    push rbp
    mov rbp, rsp
    push rbx

; 0101 0101
; 0000 0001
; 0000 0001
read_keyboard:
    in al, 64h
    test al, 1
    je read_keyboard

    in al, 60h
    pop rbx
    mov rsp, rbp
    pop rbp

    ret
