
#include <time.h>
#include <stdint.h>
#include <naiveConsole.h>

#define STDOUT 1
#define STDERR 2

#define RED 0x04

// For both STDERR AND STDOUT but with diferent args (red color)
static void syscallWrite(char* string, char bg, char fg);



void sysCallDispatcher(uint64_t call, uint64_t arg1, uint64_t arg2, uint64_t arg3) {
    switch (call){
        case STDOUT:
            syscallWrite((char*) arg1, (char) arg2, (char) arg3);
            break;
        case STDERR:
            syscallWrite((char*) arg1, (char) arg2, RED);
            break;
    }
    return;
}

static void syscallWrite(char* string, char bg, char fg){
    ncPrintWStyle(string, fg);  // Por el momento le paso fg pero deberia remakear ncPrintWStyle para que reciba sepeardos los estilos o mergear aca bg y fg
    return;
}
