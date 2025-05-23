#include <stdio.h>

void encrypt(char *plain, char *cipher){
	if(!(*plain)){
		*cipher = 0;
		return;
	}
	char pad = get_pad();
	*cipher = *plain + pad;
	encrypt(plain+1, cipher+1);
}

void test(){
	char *msg = “Ark”;
	char cipher[] = “--------”;
	cipher[4] = ‘0’;
	encrypt(msg, cipher);
	printf("%s\n", cipher);
}

int main(void){
	test();
	return 0;
}
