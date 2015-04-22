#include "svdpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#define MAX_SIZE 2000

int  instruction_array[MAX_SIZE];
int  instruction_count;
char script[30];

void set_compile_script(const char* lscript) {
    strcpy(script, lscript);
}

void compile_test(const char* testcase) {
    FILE* hexFile;
    int i = 0;

    char* int_ext = ".int";
    char* asm_ext = ".s";
    char* c_ext = ".c";
    char* rm_cmd  = "rm";

    char * asm_file = malloc(strlen(testcase) + strlen(asm_ext) + 1);
    char * c_file   = malloc(strlen(testcase) + strlen(c_ext) + 1);

    char* command_asm =
        malloc(strlen(script) + strlen(testcase) + strlen(asm_ext) + 2);

    char* command_c =
        malloc(strlen(script) + strlen(testcase) + strlen(c_ext) + 2);

    char * int_file = malloc(strlen(testcase) + strlen(int_ext) + 1);

    strcpy(asm_file, testcase);
    strcat(asm_file, asm_ext);
    
    strcpy(c_file, testcase);
    strcat(c_file, c_ext);
    
    strcpy(command_asm, script);
    strcat(command_asm, " "   );
    strcat(command_asm, asm_file);

    strcpy(command_c, script);
    strcat(command_c, " "   );
    strcat(command_c, c_file);
    
    if (access(asm_file, F_OK) != -1)
    {
        system(command_asm);
    }
    else if (access(c_file, F_OK) != -1)
    {
        system(command_c);
    }
    else
    {
        return;
    }

    strcpy(int_file, testcase);
    strcat(int_file, int_ext );

    hexFile = fopen(int_file, "r");

    while (fscanf(hexFile, "%08X", &instruction_array[i]) != EOF)
        ++i;

    instruction_count = i;
    char * rm_int = malloc(strlen(rm_cmd) + strlen(int_file) + 2);
    strcpy(rm_int, rm_cmd  );
    strcat(rm_int, " "     );
    strcat(rm_int, int_file);

    system(rm_int);

}

int get_instruction_count() {
    return instruction_count;
}

int get_instruction(int index) {
    return instruction_array[index];
}
