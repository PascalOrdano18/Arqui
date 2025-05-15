#include "rtc.h"
#include "include/naiveConsole.h"
#include "naiveConsole.h"
#include <stdint.h>


// bcd = binary-coded decimal
// esta funcion me la hizo gpt
static uint8_t bcd_to_decimal(uint8_t value){
    return (value & 0x0F) + (value >> 4) * 10;
}


void rtc_get_time(rtc_time_t *t){
    while(read_rtc(0x0A) & 0x80);

    t->sec = bcd_to_decimal(read_rtc(0));
    t->min = bcd_to_decimal(read_rtc(2));
    t->hour = bcd_to_decimal(read_rtc(4));
    t->day = bcd_to_decimal(read_rtc(7));
    t->month = bcd_to_decimal(read_rtc(8));
    t->year = bcd_to_decimal(read_rtc(9));
}

static void print2(uint8_t v) {
  char buf[3] = { '0' + v/10, '0' + v%10, 0 };
  ncPrint(buf);
}

void rtc_print_time(void){
    rtc_time_t now;
    rtc_get_time(&now); // ahora cada elemento en now contiene los valores del rtc


    ncNewline();
    ncPrintWStyle("Time: ", 40);
    print2(now.hour);
    ncPrint(":");
    print2(now.min);
    ncPrint(":");
    print2(now.sec);
    ncNewline();
    ncPrint("Year: ");
    print2(now.year);
    ncNewline();
    ncPrint("Month: ");
    print2(now.month);

}
