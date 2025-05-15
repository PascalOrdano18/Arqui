

    ;00  RTC seconds
	;01  RTC seconds alarm
	;02  RTC minutes
	;03  RTC minutes alarm
	;04  RTC hours
	;05  RTC hours alarm
	;06  RTC day of week
	;07  RTC day of month
	;08  RTC month
	;09  RTC year
	;0A  RTC Status register A:

global read_rtc

section .text
read_rtc:
    push rbp
    mov rbp, rsp

    push rbx
    ; el primer argumento llega a rdi, y los 8 bits low de rdi estan en dil
    mov al, dil
    out 70h, al
    in al, 71h

    pop rbx

    mov rsp, rbp
    pop rbp
    ret
