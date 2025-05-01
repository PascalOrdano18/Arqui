
#define STDOUT 1

int sys_write(int fd, void* buffer, int size);
int get_len(const char* str);

int puts(const char* str){
	int len = get_len(str);
	return sys_write(STDOUT, (void*) str, len);
}


int main(){
	puts("Hola Loco");
	return 0;
}

