#include <CapacitiveSensor.h>

/*
 * CapitiveSense Library Demo Sketch
 * Paul Badger 2008
 * Uses a high value resistor e.g. 10M between send pin and receive pin
 * Resistor effects sensitivity, experiment with values, 50K - 50M. Larger resistor values yield larger sensor values.
 * Receive pin is the sensor pin - try different amounts of foil/metal on this pin
 */


CapacitiveSensor   cs_9_10 = CapacitiveSensor(9,10);        // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil if desired

void setup()                    
{
   cs_9_10.set_CS_AutocaL_Millis(0xFFFFFFFF);     // turn off autocalibrate on channel 1 - just as an example
   Serial.begin(9600);
}

   void loop()                    
{
    long start = millis();
    long total1 =  cs_9_10.capacitiveSensor(30);
    //long total2 =  cs_4_5.capacitiveSensor(30);
    //long total3 =  cs_4_8.capacitiveSensor(30);

    Serial.print(millis() - start);        // check on performance in milliseconds
    Serial.print("\t");                    // tab character for debug windown spacing

    Serial.println(total1);                  // print sensor output 1
    //Serial.print("\t");
    //Serial.print(total2);                  // print sensor output 2
    //Serial.print("\t");
    //Serial.println(total3);                // print sensor output 3

    delay(10);                               // arbitrary delay to limit data to serial port 
   
        if (total1 > 28){
      digitalWrite(7, HIGH);
    }else{
      digitalWrite(7, LOW);
    }
}
