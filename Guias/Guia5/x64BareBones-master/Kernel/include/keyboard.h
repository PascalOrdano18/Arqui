#ifndef KEYBOARD_H
#define KEYBOARD_H
#include <stdint.h>


extern uint8_t set_read_keyboard(void);

uint8_t get_key(void);
void print_keyboard(void);


#endif
