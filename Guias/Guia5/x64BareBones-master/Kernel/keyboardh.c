
#include <keyboardh.h>
#include <naiveConsole.h>
#include <stdint.h>


static const char sc_to_ascii[128] = {
  0,  27, '1','2','3','4','5','6','7','8','9','0','-','=','\b', '\t',
  'q','w','e','r','t','y','u','i','o','p','[',']','\n', 0,
  'a','s','d','f','g','h','j','k','l',';','\'','`', 0, '\\','z','x',
  'c','v','b','n','m',',','.','/', 0, '*', 0, ' ', 0 /*…*/
};

uint8_t get_keyh(void){
    return set_read_keyboard();
}

void keyboard_handler(void){
    // ncPrintWStyle("||Write what you want||", 27);
    char key = sc_to_ascii[get_keyh()];
    ncPrintChar(key);
}
