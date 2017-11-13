// Brain Data Visualizer by wobkat, June 2013

import ddf.minim.*;
import ddf.minim.ugens.*;
import netP5.*;
import processing.serial.*; 
Serial serial;
int packetCount = 0;
String[] incomingValues;
int[] incVals;
Minim minim;
AudioPlayer player;
int windowX = 1280;
int windowY = 800;
int world = 20;
int worldX = 30;
int worldY = 30;
int worldZ = 30;
float dimension = 8;
boolean[][][] initGen;
boolean[][][] nworldXtGen;
PFont myFont = createFont("Free Sans", 10);

void setup() {
  size(windowX, windowY, OPENGL);
  
  // we pass `this` to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  player = minim.loadFile("letitbeallineed.mp3");
  
  // loop the audio file
  player.loop();
  
  println(Serial.list());
  serial = new Serial(this, Serial.list()[4], 9600); // port # = [#]
  serial.bufferUntil(10);
  
  frameRate(14);
  
  incVals = new int[20];    
  
  background(0);
  noStroke();
  
  // // use the getLineOut method of the Minim object to get an AudioOutput object
  // out = minim.getLineOut();
  
  initGen = new boolean[worldZ+2][worldY+2][worldX+2];
  nworldXtGen = new boolean[worldZ+2][worldY+2][worldX+2];
   
  for(int k = 0; k < worldZ; k++){
    for(int j = 0; j < worldY; j++){
      for(int i = 0; i < worldX; i++){
        initGen[k][j][i] = false;
      }
    }
  }
  
  initGen[(worldZ/2)][(worldY/2)][(worldX/2)] = true;
  initGen[(worldZ/6)][(worldY/6)][(worldX/6)] = true;
  initGen[(worldZ/10)][(worldY/10)][(worldX/10)] = true;        
}

void draw() {
  lights();
  background(0);
  displayWorld();     
  updateWorld();
  for (int i = 0; i < 11; i++) {
    if (incVals[0] == 200 && i >= 1) {
      background(0);
      incVals[i] = 0;
    }
  }
  brainWaves();
}

void serialEvent(Serial p) {
  // Split incoming packet on commas.
  // For information on the CSV packet format, see:
  // https://github.com/kitschpatrol/Arduino-Brain-Library/blob/master/README
  incomingValues = split(p.readString(), ',');
  
  // Verify that the packet looks legit
  if (incomingValues.length > 1) {
    packetCount++;
  
    // Wait till the *fourth packet or so to start recording to avoid initialization garbage.
    if (packetCount > 4) {
      for (int i = 0; i < incomingValues.length; i++) {
        int newValue = Integer.parseInt(incomingValues[i].trim());
        incVals[i] = newValue;
        println(newValue);
      }
    }
  }
}