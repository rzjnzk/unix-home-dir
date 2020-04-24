#include <unistd.h>
#include <sys/types.h>
#include <pwd.h>

char *get_home_dir()
{
    char *homeDir = {'\0'};

    if((homeDir = getenv("HOME")))
    {
        return homeDir;
    }

    if((homeDir = getpwuid(getuid())->pw_dir) == NULL)
    {
        fprintf(stderr, "ERROR: `getpwuid(getuid())` failed after `getenv(\"HOME\")` failed.\n");
        exit(EXIT_FAILURE);
    }

    return homeDir;
}
