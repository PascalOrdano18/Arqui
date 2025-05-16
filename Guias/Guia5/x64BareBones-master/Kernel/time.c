#include "include/naiveConsole.h"
#include <time.h>
#include <naiveConsole.h>
static unsigned long ticks = 0;
static unsigned long lastTick = 0;
void timer_handler() {

    if(ticks - lastTick >= 50){
        ncPrint("|Timer Tick|");
        ncPrintDec(lastTick/50);
        lastTick = ticks;
    }
    ticks++;
}

int ticks_elapsed() {
	return ticks;
}

int seconds_elapsed() {
	return ticks / 18;
}
