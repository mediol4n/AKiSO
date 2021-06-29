#include <stdio.h>
#include <signal.h>

void sighandle(int sig) {
  printf("%d handled\n", sig);
}

int main() {
  	for (int i = 1; i<64; i++) {
  		if (signal(i, sighandle) == SIG_ERR) {
      			printf("cannot handle signal %d\n", i);
    		} else {
			sighandle(i);
		}
	}
	return 0;
}

