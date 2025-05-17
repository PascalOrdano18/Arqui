#include "include/keyboardh.h"
#include "include/naiveConsole.h"
#include <stdint.h>


static const char sc_to_ascii[128] = {
    0,    27,  '1',  '2',  '3',  '4',  '5',  '6',  '7',  '8',  '9',  '0',  '-',  '=', '\b', // 0x00 - 0x0E (Backspace)
 '\t',  'q',  'w',  'e',  'r',  't',  'y',  'u',  'i',  'o',  'p',  '[',  ']', '\n', // 0x0F - 0x1C (Enter)
    0,   'a',  's',  'd',  'f',  'g',  'h',  'j',  'k',  'l',  ';', '\'',  '`',    0,   // 0x1D - 0x2A (Left Shift)
 '\\',  'z',  'x',  'c',  'v',  'b',  'n',  'm',  ',',  '.',  '/',    0,    '*',   // 0x2B - 0x37 (Keypad *)
    0,   ' ',    0,                                                                  // 0x38 (Left Alt), 0x39 (Space), 0x3A (Caps Lock)
};

uint8_t get_keyh(void){
    return set_read_keyboard();
}

void keyboard_handler(void){
    uint8_t scancode = get_keyh();
    if (scancode < 0x80) {  // Only process key presses, ignore releases
        char key = sc_to_ascii[scancode];
        if (key != 0) {  // Only print if it's a valid character
            if (key == '\b') {  // Handle backspace
                ncBackspace();
            } else {
                ncPrintChar(key);
            }
        }
    }
}
