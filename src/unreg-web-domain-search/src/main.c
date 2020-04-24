// Author: Robert Zack Jaidyn Norris-Karr <rzjnzk@gmail.com> <https://github.com/rzjnzk>
// Description: A program that outputs a list of given-length of unregistered fixed-length dot com domain names based on the alphabet character frequency in a given input text. This program depends on the presence and implementation of a oath prgram named `whois`.

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <pwd.h>
#include <libgen.h>
#include "get_home_dir.h"

#define BUFFER_SIZE 2048
#define MAX_PATH_LENGTH 4096

int main(int argc, char *argv[])
{
    int argLength = 5;
    int argOutputCount = 1;
    const char *homeDir = {'\0'};

    homeDir = get_home_dir();

    char inputFileDir[MAX_PATH_LENGTH] = {'\0'};
    strcat(inputFileDir, homeDir);
    strcat(inputFileDir, "/.config/unreg-web-domain-search");
    char inputFilePath[MAX_PATH_LENGTH] = {'\0'};
    memcpy(inputFilePath, inputFileDir, strlen(inputFileDir) + 1);
    strcat(inputFilePath, "/input");
    const char alphabet[] = "abcdefghijklmnopqrstuvwxyz";

    // If input file is not accessible [?], write `alphabet` to input file.
    if(access(inputFilePath, F_OK) == -1)
    {
        FILE *inputFilePtr;

        mkdir(inputFileDir, 0700);

        if(!(inputFilePtr = fopen(inputFilePath, "w")))
        {
            fprintf(stderr, "ERROR: Error opening `%s` for writing.\n", inputFilePath);
            exit(1);
        }

        fprintf(inputFilePtr, "%s", alphabet);
        fclose(inputFilePtr);
    }

    int alphabetLength = strlen(alphabet);
    int alphabetFreqencies[alphabetLength];
    int inputChars = 0;

    // Read `alphabet` char frequency in `input` file.
    for(int i = 0; i < alphabetLength; i++)
    {
        FILE *inputFilePtr;

        if(!(inputFilePtr = fopen(inputFilePath, "r")))
        {
            fprintf(stderr, "ERROR: Error opening `%s` for reading.\n", inputFilePath);
            exit(1);
        }

        int c = 0;

        alphabetFreqencies[i] = 0;

        while((c = fgetc(inputFilePtr)) != EOF)
        {
            if((char)c == alphabet[i])
            {
                alphabetFreqencies[i]++;
                inputChars++;
            }
        }
    }

    FILE *argOutputFP = stdout;

    // Handle args.
    for(int i = 1; i < argc; i++)
    {
        if(i != argc - 1)
        {
            if(strcmp(argv[i], "--length") == 0 || strcmp(argv[i], "-l") == 0 )
            {
                argLength = atoi(argv[++i]);

                if(argLength < 2)
                {
                    fprintf(stderr, "ERROR: %s is not a valid option for %s. Expecting an int greater than 1.\n", argv[i], argv[i - 1]);
                    exit(1);
                }
            }
            else if(strcmp(argv[i], "--output-count") == 0 || strcmp(argv[i], "-n") == 0 )
            {
                argOutputCount = atoi(argv[++i]);

                if(argOutputCount < 1)
                {
                    fprintf(stderr, "ERROR: `%s` is not a valid option for `%s`. Expecting an int greater than 0.\n", argv[i], argv[i - 1]);
                    exit(1);
                }
            }
            else if(strcmp(argv[i], "--output") == 0 || strcmp(argv[i], "-o") == 0 )
            {
                i++;
                char outputDir[MAX_PATH_LENGTH] = {'\0'};
                memcpy(outputDir, argv[i], strlen(argv[i]) + 1);
                dirname(outputDir);
                mkdir(outputDir, 0700);

                // TODO: Handle mkdir and existing
                if(!(argOutputFP = fopen(argv[i], "w")))
                {
                    fprintf(stderr, "ERROR: Error opening `%s` for writing.\n", argv[i]);
                    exit(1);
                }
            }
        }
    }

    srand(time(0));

    while(argOutputCount > 0)
    {
        int isMatch = 0;

        while(isMatch == 0)
        {
            char buffer[BUFFER_SIZE];
            FILE *whoisOutputFilePtr;

            char command[BUFFER_SIZE] = "whois ";
            char domainPrefix[argLength + 1];
            domainPrefix[argLength] = '\0';

            for(int i = 0; i < argLength; i++)
            {
                int randVal = rand() % (inputChars + 1);
                int index = 0;
                int sum = alphabetFreqencies[0];

                while(randVal > sum)
                {
                    sum += alphabetFreqencies[++index];
                }

                domainPrefix[i] = alphabet[index];
            }

            strcat(command, domainPrefix);
            strcat(command, ".com");

            // Run command.
            if(!(whoisOutputFilePtr = popen(command, "r")))
            {
                fprintf(stderr, "ERROR: Error opening pipe for command `%s`.\n", command);
                exit(1);
            }

            if(fgets(buffer, BUFFER_SIZE, whoisOutputFilePtr) && strstr(buffer, "No match for domain") && pclose(whoisOutputFilePtr))
            {
                isMatch = 1;
                argOutputCount--;
                fprintf(argOutputFP, "%s.com\n", domainPrefix);
            }
        }
    }

    pclose(argOutputFP);

    return 0;
}
