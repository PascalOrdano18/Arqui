

global fopen
global fread
global fclose
global print

section .text

fopen:
	push ebp
	mov ebp, esp

	push ebx
	
	mov eax, 5
	mov ebx, [ebp + 8]  ; ebx = file_path
	mov ecx, 0
	mov edx, 0

	int 80h

	pop ebx

	mov esp, ebp
	pop ebp	

	ret

fread:
	push ebp
	mov ebp, esp

	push ebx

	mov eax, 3
	mov ebx, [ebp + 8]  ; ebx = fd
	mov ecx, [ebp + 12]  ; ecx = buffer
	mov edx, [ebp + 16]  ; edx = buffer_len

	int 80h

	pop ebx

	mov esp, ebp
	pop ebp

	ret

fclose:
	push ebp
	mov ebp, esp

	push ebx

	mov eax, 6
	mov ebx, [ebp + 8]
	
	int 80h
	
	pop ebx

	mov esp, ebp
	pop ebp
	
	ret


print:
	push ebp
	mov ebp, esp

	push ebx

	mov eax, 4
	mov ebx, 1
	mov ecx, [ebp + 8]  ; buf
	mov edx, [ebp + 12]  ; buf len

	int 80h
	
	pop ebx	

	mov esp, ebp
	pop ebp

	ret



