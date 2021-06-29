#include <stdio.h>

int main() {

	for(int i = 0; i < 257; i++) {
		int k = i;
		printf("\033[38;5;%dm", k);
		printf("Hello World\n");
	}
	return 0;
}
