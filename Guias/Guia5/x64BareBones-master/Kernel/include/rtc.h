#ifndef RTC_H
#define RTC_H
#include <stdint.h>

typedef struct {
    // unsigned int de 8 bits exactamente
    // En un byte puedo representar hasta 255 entonces me sobra
    // de 59 (para el anio pongo dos digitos)
    uint8_t sec, min, hour, day, month, year;
} rtc_time_t;

extern uint8_t read_rtc(uint8_t reg);
void rtc_get_time(rtc_time_t *t);
void rtc_print_time(void);

#endif
