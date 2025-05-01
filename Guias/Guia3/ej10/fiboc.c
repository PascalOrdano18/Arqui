#include <stdio.h>


int fiboRec(int n){
	if(n <= 1){
		return n;
	}
	return fiboRec(n - 1) + fiboRec(n- 2);
}



int main(){
	int input = 3;
	
	int res = fiboRec(input);
	printf("Fibonacci %d: %d\n", input, res);
	return 0;
}
