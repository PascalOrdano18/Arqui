#include <stdio.h>
#include <stdlib.h>


extern int count(int arr[], int len, int num);

int main(){

    int arr[] = {1, 1, 1, 1, 1, 1, 1, 1, 10, 10};
    int len = 10;

    int num = 5;
   
    int n = count(arr, len, num);
    printf("%d numbers are bigger than %d in the array\n", n, num);

	return 0;
}
