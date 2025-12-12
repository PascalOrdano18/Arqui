#include <stdio.h>

#DEFINE STDOUT 1  // esto va a ser ebx

int sys_write(int fd, void* buffer, int size);

int puts(const char* string){
	int len = strlen(string);
	return sys_write(STDOUT, (void*)string, len);
	
}
