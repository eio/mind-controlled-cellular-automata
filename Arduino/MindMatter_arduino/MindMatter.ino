// Arduino Brain Library
// Basic brain example, blinks an LED on pin 13 faster as your "attention" value increases.
// Adapted from the Blink without Delay example distributed with Arduino environment.
// Eric Mika, 2010

#include <Brain.h>
/* Upload this sketch into Seeeduino and press reset*/
 
#include <SoftwareSerial.h>   //Software Serial Port
#define RxD 6
#define TxD 7

SoftwareSerial blueToothSerial(RxD, TxD);
 
// Set up the brain parser, pass it the hardware serial object you want to listen on.
Brain brain(Serial);

const int ledPin = 13; // 13 is handy because it's on the board.
long interval = 500; // Changes based on attention value.
long previousMillis = 0;
int ledState = LOW;     

void setup() {
	// Set up the LED pin.
	pinMode(ledPin, OUTPUT);
	
	// Start the hardware serial.
	Serial.begin(9600);
        pinMode(RxD, INPUT);
        pinMode(TxD, OUTPUT);
        setupBlueToothConnection();
}

void loop() {
	// Expect packets about once per second.
	if (brain.update()) {
		blueToothSerial.println(brain.readCSV());
		
		// Attention runs from 0 to 100.
		interval = (100 - brain.readAttention()) * 10;
	}
	
	// Make sure we have a signal.
	if(brain.readSignalQuality() == 0) {
  
//          Serial.write(blueToothSerial);
		
		// Blink the LED.
	  if (millis() - previousMillis > interval) {
	    // Save the last time you blinked the LED.
	    previousMillis = millis();   

	    // If the LED is off turn it on and vice-versa:
	    if (ledState == LOW)
	      ledState = HIGH;
	    else
	      ledState = LOW;
      
	    // Set the LED with the ledState of the variable:
	    digitalWrite(ledPin, ledState);
	  }	
	}
	else {
    digitalWrite(ledPin, LOW);
	}
	
}

void setupBlueToothConnection()
{
  blueToothSerial.begin(38400); //Set BluetoothBee BaudRate to default baud rate 38400
  blueToothSerial.print("\r\n+STWMOD=0\r\n"); //set the bluetooth work in slave mode
  blueToothSerial.print("\r\n+STNA=SeeedBTSlave\r\n"); //set the bluetooth name as "SeeedBTSlave"
  blueToothSerial.print("\r\n+STOAUT=1\r\n"); // Permit Paired device to connect me
  blueToothSerial.print("\r\n+STAUTO=0\r\n"); // Auto-connection should be forbidden here
  delay(2000); // This delay is required.
  blueToothSerial.print("\r\n+INQ=1\r\n"); //make the slave bluetooth inquirable 
  Serial.println("The slave bluetooth is inquirable!");
  delay(2000); // This delay is required.
  blueToothSerial.flush();
}



