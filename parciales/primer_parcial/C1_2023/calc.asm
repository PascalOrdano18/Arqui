section .data
	operands db '+', '*', '/', '^'
	ops_len equ ($-operands)   ;1 byte each because I used db (define byte) each asccii uses 1 byte (0-255)
	invalid_operand dd "Error: operador <%s> no reconocido", 10, 0
	result db "Resultado = %d", 10, 0


extern printf
extern operar

section .text

.main:

	push ebp
	mov ebp, esp
	
	mov ebx, [ebp + 8]   ; argc
	mov eax, [ebp + 12]  ; *argv[]
	
	add eax, 4   ; argv = {executable_path, arg1, arg2, ..., argn} -> add eax, 4 nos pone en arg1 que es el primer numero
	mov edx, [eax + 4]  ; ahora en edx tenemos el operador
	mov ecx, [ops_len]  ; ecx = longitud de operands (EL NUMERO)
		

.validate_operand:
	cmp ecx, 0
	je .print_invalid_operand  ; si ecx entro como 0 -> ibamos a acceder a operands[-1] SEG FAULT -> terminamos de recorrerlo y no encontramos el operador
	dec ecx
	mov edi, [edx]   ; pues no se pueden comparar dos operandos en memoria
	cmp [operands + (ecx * 4)], edi  ; comparamos operador en edx con operador en el array
	jne .validate_operand
	
.print_result:
	push [eax]  ; push del primer operando
	push [eax + 8]  ; push del segundo operando
	push [edx]   ; push del operador
	call operar   ; eax = resultado
	add esp, 4 * 3

	push eax
	push result
	call printf
	add esp, 4 * 2

	jmp .end

.print_invalid_operand:
	push [edx] ; push del operador invalido
	push invalid_operand   ; push del string 
	call printf
	add esp, 4 * 2
.end:
	mov esp, ebp
	pop ebp

	ret
	
	

	

