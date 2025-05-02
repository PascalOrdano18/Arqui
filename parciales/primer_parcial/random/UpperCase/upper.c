#include <stdio.h>
#include <stdlib.h>

extern void to_upper(char* text);

int main(){
	char text[] = "este es el texto al que se le debe pasar cada primera letra de cada palabra a mayuscula!";
	printf("FIRST TEXT: \n%s\n\n", text);

	to_upper(text);

	printf("%s", text);

	return 0;
}
