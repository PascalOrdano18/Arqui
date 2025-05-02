#include <stdio.h>
#include <stdlib.h>

extern int CheckLong(char* array, int b);

int main(){
	int len = 10;
	char* array = "Hola mundo";  // es null terminated '\0'
	
	int res = CheckLong(array, len);

	if(res == 0){
		printf("Las longitudes coinciden. La longitud es %d", len);
	} else if(res > 0){
		printf("La longitud es menor que %d ", len);
	} else {
		printf("La longitud es mayor que %d");
	}

	return 0;
}
