#include <CapacitiveSensor.h>
#include <Adafruit_FloraPixel.h>

CapacitiveSensor   cs_9_10 = CapacitiveSensor(9, 10);       // 10M resistor between pins 9 & 10
CapacitiveSensor   cs_9_2 = CapacitiveSensor(9, 2);
Adafruit_FloraPixel strip = Adafruit_FloraPixel(1);

void setup()
{
  cs_9_10.set_CS_AutocaL_Millis(0xFFFFFFFF);
  cs_9_2.set_CS_AutocaL_Millis(0xFFFFFFFF);     // turn off autocalibrate on channel 1 - just as an example
  Serial.begin(9600);
  strip.begin();                               // prepare the data pin for NeoPixel output
  strip.show();                               // initializes pixels to 'off' state

}

void loop()
{
  long start = millis();
  long total1 =  cs_9_10.capacitiveSensor(30);
  long total2 = cs_9_2.capacitiveSensor(30);

  if (total1 > 28) {
    digitalWrite(7, HIGH);
    strip.setPixelColor(0, Color(0, 255, 0));
    strip.show();
  }
  if (total2 > 28) {
    digitalWrite(7, HIGH);
    strip.setPixelColor(0, Color(255, 0, 0));
    Serial.println("working");           // debugging
    strip.show();
  }




  Serial.println(total1);                 // print sensor output 1
  Serial.print("\t");
  Serial.println(total2);                 // print sensor output 2

  delay(10);                             // arbitrary delay to limit data to serial port
}

// Create a 24 bit color value from R,G,B
RGBPixel Color(byte r, byte g, byte b)
{
  RGBPixel p;

  p.red = r;
  p.green = g;
  p.blue = b;

  return p;
}
