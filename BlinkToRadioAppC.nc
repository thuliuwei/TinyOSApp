#include <Timer.h>
#include "BlinkToRadio.h"

configuration BlinkToRadioAppC{
}
implementation
{
	components MainC;
	components LedsC;
	components BlinkToRadioC as App;
	componetns new TimerMilliC() as Timer0;
	
	App.boot -> MainC;
	App.Leds -> LedsC;
	App.Timer0 -> Timer0;
}