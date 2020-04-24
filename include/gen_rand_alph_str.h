// Description: Generate 'n' pseudo-random alphanumeric characters. (0-1, a-z, A-Z).
// Author: Robert Zack Jaidyn Norris-Karr <rzjnzk@gmail.com> <https://github.com/rzjnzk>
// Valid: C, C++.
//
// Example usage:
//
// char arr[10] = {0};
// gen_rand_alph_str(arr, 10);

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void gen_rand_alph_str(char *buff, int n)
{
    const char alphanumeric[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ";
  
    srand(time(0));

    while(n > 0)
    {
        buff[--n] = alphanumeric[rand() % 62];
    }
}