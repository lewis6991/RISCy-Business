#include "svdpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_SIZE 2000

int  instruction_array[MAX_SIZE];
int  instruction_count;
char script[30];

void set_compile_script(const char* lscript) {
    strcpy(script, lscript);
}

void compile_asm(const char* testcase) {
    FILE* hexFile;
    int i = 0;

    char* int_ext = ".int";
    char* asm_ext = ".s";

    char* command =
        malloc(strlen(script) + strlen(testcase) + strlen(asm_ext) + 1);

    char * int_file = malloc(strlen(testcase) + strlen(int_ext) + 1);

    strcpy(command, script);
    strcat(command, " "   );
    strcat(command, testcase);
    strcat(command, asm_ext);

    system(command);

    strcpy(int_file, testcase);
    strcat(int_file, int_ext );

    hexFile = fopen(int_file, "r");

    while (fscanf(hexFile, "%08X", &instruction_array[i]) != EOF)
        ++i;

    instruction_count = i;
}

int get_instruction_count() {
    return instruction_count;
}

int get_instruction(int index) {
    return instruction_array[index];
}
