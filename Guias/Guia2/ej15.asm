section .text
	global _start

_start:

	push ebp
	mov ebp, esp	

	mov eax, 4
	mov ebx, 1
	mov ecx, start_msg
	mov edx, start_msg_len
	int 80h

	mov eax, 162
	mov ebx, timespec
	mov ecx, 0
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, end_msg
	mov edx, end_msg_len
	int 80h

_end:

	mov esp, ebp
	pop ebp

	mov eax, 1
	mov ebx, 0
	int 80h


section .data
	start_msg db "Starting program", 10
	start_msg_len equ $ - start_msg
	
	end_msg db "Ending program", 10
	end_msg_len equ $ - end_msg

	timespec:
		dd 5 ; tv_sec
		dd 0 ; tv_nanosec
