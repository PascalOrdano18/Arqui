

#define FD_STDIN 0   // file descriptor for standard input
#define MAX_FILE_LEN 4056  
#define MAX_USER_INPUT_LEN 256

static char user_input[MAX_USER_INPUT_LEN];
static char file_text[MAX_FILE_LEN];



char* get_user_text();
char* get_file_text(char* argv[]);

int get_len(char* str);
char* int_to_str(int num);

extern void print(char* msg, int len);

extern int fopen(const char* path);
extern int fread(int fd, char* buffer, unsigned long len);
extern int close(int fd);

int main(int argc, char* argv[]){
	
	if(argc < 2){
		char* msg = "Por favor introduzca un file path\n";
		int msg_len = get_len(msg);
		print(msg, msg_len);
		return 1;
	}

	char* first_message = "Porfavor intrduzca el texto que desea buscar en el archivo: \n->\t";
	int first_message_len = get_len(first_message);
	print(first_message, first_message_len);
	

	char* user_input = get_user_text();
	int user_input_len = get_len(user_input);

	char* file_text = get_file_text(argv);
	
	int ocurrences = 0;
	for(int i = 0; i < MAX_FILE_LEN; i++){
		if(*user_input == file_text[i]){
			int different = 0;
			for(int j = 1; j < user_input_len; j++){
				if(file_text[i] != user_input[j]){
					different = 1;
				}
			}
			if(!different){
				ocurrences++;
			}
		}
		
	}	

	char* str_ocurrences = int_to_str(ocurrences);
	int str_ocurrences_len = get_len(str_ocurrences);
	print(str_ocurrences, str_ocurrences_len);
	

	return 0;
}

char* int_to_str(int num) {
    static char buf[12];      // enough for "-2147483648\0"
    char *p = buf + sizeof(buf) - 1;  // point just past the last slot
    unsigned int x;

    *p = '\0';                // NUL-terminate

    // Handle zero explicitly
    if (num == 0) {
        *--p = '0';
        return p;             // returns pointer to "0"
    }

    // Handle negative
    if (num < 0) {
        x = (unsigned)(-num);
    } else {
        x = (unsigned)num;
    }

    // Fill in digits in reverse order
    while (x > 0) {
        *--p = '0' + (x % 10);
        x /= 10;
    }

    // Prepend minus if needed
    if (num < 0) {
        *--p = '-';
    }

    return p;
}



char* get_user_text(){
	unsigned long user_input_len = 256;
	char user_input[user_input_len];   // This is the buffer
	
	int n = fread(FD_STDIN, user_input, user_input_len - 1);
	// Now user_input has what the user typed in the keyboard
	if(n < 0) n = 0;
	user_input[n] = '\0';

	return user_input;
}


char* get_file_text(char* argv[]){
	const char* file_path = argv[1];
	char file_text[MAX_FILE_LEN];
	int fd = fopen(file_path);
	int n = fread(fd, file_text, MAX_FILE_LEN - 1);
	if(n < 0) n = 0;
	file_text[n] = '\0';
	close(fd);	
	
	return file_text;
}

int get_len(char* user_input){
	int len = 0;
	while(user_input[len]){
		len++;
	}

	return len;
}
