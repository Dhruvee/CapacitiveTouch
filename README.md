### CapacitiveTouch
Using conductive fabric and Capacitive Sensing

## Tools Required
- Adafruit Flora
- Conductive Fabric
- Flora RGB Smart NeoPixel
- Gator Cables
- High Resistors

## Libraries Required
- Capacitive Sensor
- NeoPixel library


## How to make it work
# Testing Conductive Fabric
- Connect Flora to the conductive fabric using ports D9 and D10. Connect one end of D9 to Flora and the other end to the fabric and resistor. Connect the other end of the resistor to Flora using D10. 
- Follow code from Test1.pde and view the serial monitor to check if the capacitive touch is working.

# Test output through LED
- Connect a Flora RGB Smart Neopixel using gator cables. 
 VBATT to '+'
 D6 to inward pointing arrow
 GND to '-'
- Follow code from Test2.pde to check if the LED responds to touch input.

# Connect two fabrics
- Connect another conductive fabric in series with the first one using D9 AND SDA(D2). Follow code Final to watch LED switch color based on touch input.

