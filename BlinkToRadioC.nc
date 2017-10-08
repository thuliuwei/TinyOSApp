#include <Timer.h>
#include "BlinkToRadio.h"

module BlinkToRadioC{
	uses interface Boot;
	uses interface Leds;
	uses interface Timer<TMilli> as Timer0;
	uses interface Packet;
	uses interface AMPacket;
	uses interface AMSend;
	uses interface SplitControl as AMControl;
}
implementation{
	uint16_t counter = 0;
	bool busy = FALSE;
	message_t pkt;
	
	event void Boot.booted(){
		call AMControl.start();
	}
	
	event void AMControl.startDone(error_t err){
		if (err == SUCCESS){
			call Timer0.startPeriodic(TIMER_PERIOD_MILLI);
		}
		else{
			call AMControl.start();
		}
	}
	
	event void AMControl.stopDone(error_t err){
	}
	
	event void Timer0.fired(){
		counter++;
		call Leds.set(counter);
	}
}