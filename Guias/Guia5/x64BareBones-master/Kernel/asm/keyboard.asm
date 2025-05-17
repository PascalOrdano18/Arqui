
; 	8042 Status Register (port 64h read)

;   al hacer int 64h, obtenemos 8 bits que significan:

;   0 -> Output buffer full: 1 si hay datos para leer en el buffer de salida, 0 si no
;   1 -> Input buffer full: (60h / 64h)
;   0


;   al hacer int 60h, obtenemos la lectura del teclado

GLOBAL set_read_keyboard

section .text

set_read_keyboard: push rbp
        mov rbp, rsp

        mov rax, 0
loop:   in al, 0x64
        mov cl, al
        and al, 0x01
        cmp al, 0
        je loop
        in al, 0x60

        mov rsp, rbp
        pop rbp
        ret
