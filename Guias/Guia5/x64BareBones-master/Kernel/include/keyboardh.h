#ifndef _KEYBOARD_H_
#define _KEYBOARD_H_
#include <stdint.h>

extern uint8_t set_read_keyboard(void);
void keyboard_handler(void);
uint8_t get_keyh(void);

#endif
