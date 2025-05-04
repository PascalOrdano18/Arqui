section .text
    global count

count:
    push ebp
    mov ebp, esp
    
    push ebx

    mov eax, [ebp + 8]  ; eax = array 
    mov ebx, [ebp + 12]  ; ebp = arr_len
    mov edx, [ebp + 16]  ; edx = num 
    
    mov esi, 0  ; esi is our index
    mov ecx, 0  ; ecx is the counter

.loop:
    cmp esi, ebx
    je .end
    
    cmp edx, [eax + (esi * 4)]
    jl .loop_setup
    inc ecx

.loop_setup:
    inc esi
    jmp .loop
        


.end:
	mov eax, ecx
    pop ebx
    
    mov esp, ebp
    pop ebp

    ret
