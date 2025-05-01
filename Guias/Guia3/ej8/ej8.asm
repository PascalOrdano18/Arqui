
global _start
global close_program
global read_fd
global write_fd
global open_file
global close_file
extern main

section .text
_start:

	; mensaje para saber que estamos en start
	mov eax, 4  ;syscall WRITE
	mov ebx, 1 ; codigo de salida
	mov ecx, start_msg ; buffer
	mov edx, start_msg_len ; length
	
	int 80h ; invoca syscall




close_program:

	push ebp
	mov ebp, esp

	push ebx

	mov eax, 4  ; mensaje para informar que se cierra el programa desde asm
	mov ebx, 1
	mov ecx, closing_msg
	mov edx, closing_msg_len
	int 80h

	
	; codigo encargado en cerrar el programa
	mov eax, 1 ;syscall EXIT
	mov ebx, [ebx + 8] ; codigo de salida pasado por parametro desde ej8c.c
	int 80h   ;invoca el syscall

	pop ebx

	mov esp, ebp
	pop ebp
	
	ret

open_file:

	push ebp
	mov ebp, esp

	push ebx ; preservar ebx por convencion

	mov eax, 5 ; syscall OPEN
	mov ebx, [ebp + 8] ; filename / path al archivo 
	mov ecx, [ebp + 12] ; flags
	mov edx, [ebp + 16] ; mode 
	int 80h	

	pop ebx 

	mov esp, ebp
	pop ebp

	ret ; el retorno esta en eax
	

read_fd:
	push ebp
	mov ebp, esp
	
	push ebx

	mov eax, 3 ; syscall READ
	mov ebx, [ebp + 8]  ; file descriptor
	mov ecx, [ebp + 12] ; buffer
	mov edx, [ebp + 16] ; buffer length
	int 80h
		
	mov esp, ebp
	pop ebp	
	
	pop ebx
	
	ret

write_fd:
	push ebp
 	mov ebp, esp
	
	push ebx

	mov eax, 4
	mov ebx, [ebp + 8] ; file descriptor
	mov ecx, [ebp + 12] ; buffer
	mov edx, [ebp + 16] ; buffer len
	int 80h

	mov esp, ebp
	pop ebp
	
	pop ebx

	ret



close_file:
	push ebp
	mov ebp, esp

	push ebx
	
	mov eax, 6 ; sys_close
	mov ebx, [ebp + 8] ; filename
	int 80h

	pop ebx
	ret



section .data
	start_msg db "Starting main from assembler (_start)", 10
	start_msg_len equ $-start_msg


	closing_msg db "Closing program from asm", 10
	closing_msg_len equ $-closing_msg

