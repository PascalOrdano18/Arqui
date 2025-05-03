

global fopen
global fread
global fclose
global print

section .text

fopen:
	push ebp
	mov ebp, esp
	
	mov eax, 5
	mov ebx, [ebp + 8]  ; ebx = file_path

	int 80h
	
	ret

fread:
	push ebp
	mov ebp, esp

	mov eax, 3
	mov ebx, [ebp + 8]  ; ebx = fd
	mov ecx, [ebp + 12]  ; ecx = buffer
	mov edx, [ebp + 16]  ; edx = buffer_len

	int 80h

	ret

fclose:
	push ebp
	mov ebp, esp

	mov eax, 6
	mov ebx, [ebp + 8]
	
	int 80h
	
	ret


print:
	push ebp
	mov ebp, esp

	mov eax, 4
	mov ebx, [ebp + 8]  ; buf
	mov ecx, [ebp + 12]  ; buf len

	int 80h
	
	ret



