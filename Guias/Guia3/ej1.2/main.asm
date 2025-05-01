

global main
extern printf

section .text

main:
	push ebp
	mov ebp, esp

	mov ebx, dword [ebp + 8]  ;guardo la #argumentos
	
	push fmt
	
	call printf
	add esp, 2*4

	mov esi, [ebp + 12] ; guardo la direc de argv[]
	mov edi, 0 ; counter



.loop:
	cmp edi, ebx 
	jae .end

	push dword [esi + edi * 4]
	push fmt2
	call printf
	
	add esp, 2*4
	inc edi
	jmp .loop	

.end:
	mov esp, ebp
	pop ebp
	
	mov eax, 1
	mov ebx, 0
	int 80h


section .rodata
	fmt db "Cantidad de argumentos: %d\n", 0
	fmt2 db "Argumento: %s\n", 0
