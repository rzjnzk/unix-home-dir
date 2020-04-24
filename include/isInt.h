#include <stdio.h>
#include <stdlib.h>

void isInt(char *buff, int n)
{
    char *p = argv[1];

    while (*p != '\0')
    {
        if(*p < '0' || *p > '9')
        {
            printf("%s is not a number", argv[1]);
            return 0;
        }

        p++;
    }

    printf("%s is a number", argv[1]);

    return 0;
}
