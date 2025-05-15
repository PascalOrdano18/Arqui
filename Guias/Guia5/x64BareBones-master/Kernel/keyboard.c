
#include "keyboard.h"
#include "include/naiveConsole.h"
#include "naiveConsole.h"
#include <stdint.h>




uint8_t get_key(void){
    return set_read_keyboard();
}


void print_keyboard(void){
    uint8_t key = get_key();
    ncNewline();
    ncPrint("Pressed key: ");
    ncPrint(&key);
    ncNewline();
}
