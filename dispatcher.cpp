#include <iostream>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>

using namespace std;

int main(int argc, char* argv[]) {
  int fds[2];
  pid_t generator = -1;
  pid_t consumer = -1;

  pipe2(fds, O_CLOEXEC);

  generator = fork();

  if (!generator) {
    dup2(fds[1], 1);
    execlp("./generator", NULL);
  }


  consumer = fork();

  if (!consumer) {
    dup2(fds[0], 0);
    execlp("./consumer", NULL);
  }

  sleep(1);
  
  
  int val;

  kill(generator, SIGTERM);
  waitpid(generator, &val, 0);

  if (WIFEXITED(val))
    cerr << "child[" << generator << "] exited with status " << 
      WEXITSTATUS(val) << endl;

  close(fds[0]);
  close(fds[1]);

  waitpid(consumer, &val, 0);

  if (WIFEXITED(val))
    cerr << "child[" << consumer << "] exited with status " << 
      WEXITSTATUS(val) << endl;


  return 0;
}
