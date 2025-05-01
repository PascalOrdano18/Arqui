#include <stdio.h>

#define BUFFER_SIZE 1 // para leer de a un byte

void close_program(int status);  //exit
int read_fd(int fd, void* buffer, int length);  // sys_read
int open_file(char* fileName, int flags, int mode); //sys_open
void close_file(int fd, int status); //sys_close 
void write_fd(int fd, void* buffer, int length); // sys_write						    
int strlen(const char* str);
void int_to_str(int num, char* buff);

int main(int argc, char* argv[]){
	
	if(argc < 2){
		char* msg = "Usage: ./program file.txt\n";
		write_fd(1, msg, strlen(msg));
		close_program(1);
	}


	char* filePath = argv[1];
	int fd = open_file(filePath, 0, 0); // modo lectura
	
	char lineBuffer[1024];
	char character;
	int index = 0;
	int lineNumber = 1;
	
	int eofFound = 0;


	while(!eofFound){
		int bytesRead = read_fd(fd, &character, BUFFER_SIZE);			
		if(bytesRead == 0){
			eofFound = 1; // significa que llegue a un eof
			break;
		}


		if(character == '\n'){
			char lineNumberBuffer[1024];
			int_to_str(lineNumber, lineNumberBuffer);
			write_fd(1, lineNumberBuffer, strlen(lineNumberBuffer));
			write_fd(1, lineBuffer, index);
			
			index = 0;
			lineNumber++;

		} else {
			lineBuffer[index++] = character;
		}
	

	
	}
	
	close_file(fd, 0);
	close_program(0);
}

int strlen(const char* str){
	int len = 0;
	while(str[len] != '\0'){
		len++;
	}
	return len;
}

void int_to_str(int num, char* buffer) {
    int i = 0, j, temp;
    if (num == 0) {
        buffer[0] = '0';
        buffer[1] = '\0';
        return;
    }

    while (num > 0) {
        buffer[i++] = '0' + (num % 10);
        num /= 10;
    }

    buffer[i] = '\0';

    // reverse
    for (j = 0; j < i / 2; j++) {
        char t = buffer[j];
        buffer[j] = buffer[i - j - 1];
        buffer[i - j - 1] = t;
    }
}
