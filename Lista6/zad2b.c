#include <sys/types.h>
#include <signal.h>

int main() {

    kill(1, SIGKILL);
    kill(1, SIGINT);

    return 0;
}

