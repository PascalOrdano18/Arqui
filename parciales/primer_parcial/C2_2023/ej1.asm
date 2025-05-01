section .data
	arreglo dd 10, 20, 30, 40, 50
	cant_arreglo dd ($-arreglo) / 4
	filename db "/sys/bus/iio/in_voltage0_raw", 0
	found db "La humedad coincide con un valor del arreglo", 10, 0
	not_found db "La humedad no coincide con un valor del arreglo", 10, 0
	time_spec dd 1, 0   ; struct for nano sleep sys_call

global main
extern get_humedad
extern print  ; works as printf from C stdlib

section .text
main:
	push ebp  ; stack frame
	mov ebp, esp
	
.loop:
	push filename
	push 16  
	call get_humedad
	mov esi, eax  ; move the value of get_humedad to esi because Ill use eax to divide
	add esp, 4 * 2   ; restores the 8 bytes pushed (filename and 16)

	mov ebx, arreglo	
	mov ecx, [cant_arreglo]
.loop_array:
	dec ecx
	cmp ecx, 0
	jl .print_not_found
	mov eax, [ebx + (4 * ecx)]  ; eax = arreglo[ecx]   valor actual	
	mov edx, 0   ; aseguro que la parte alta de edx es nula
	mov edi, 7
	div edi   ; now eax = [ebx + (4 * ecx)] / 7 NORMALIZED 
	cmp esi, eax  ; compare esi (read value) with normalized value of array
	je .print_found
	jmp .loop_array	

.print_not_found
	push not_found
	call print
	add esp, 4
	jmp .wait
.print_found:
	push found
	call print
	add esp, 4

.wait:
	mov eax, 162
	mov ebx, time_spec
	mov ecx, 0
	int 80h

	jmp .loop
	
.end:
	mov eax, 1
	mov ebx, 0
.wait:
        mov eax, 162
        mov ebx, time_spec
        mov ecx, 0
        int 80h

        jmp .loop

.end:
        mov eax, 1
        mov ebx, 0
        int 80h
	int 80h
