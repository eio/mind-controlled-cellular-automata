void displayWorld() {
  float attention = map(incVals[1], 10, 100, 0, 255);
  float meditation = map(incVals[2], 0, 100, 0, 670);
  float delta = map(incVals[3], 0, 100000, 255, 0);
  float theta = map(incVals[4], 0, 100000, 255, 0);
  float lowAlpha = map(incVals[5], 0, 10000, 0, 255);
  float highAlpha = map(incVals[6], 0, 10000, 0, 255);
  float lowBeta = map(incVals[7], 0, 10000, 0, 255);
  float highBeta = map(incVals[8], 0, 10000, 0, 255);
  float lowGamma = map(incVals[9], 0, 8000, 0, 255);
  float highGamma = map(incVals[10], 0, 8000, 0, 255);   
  float alpha = (lowAlpha + highAlpha)/2;
  float beta = (lowBeta + highBeta)/2;
  float gamma = (lowGamma + highGamma)/2;
  pushMatrix();
  translate(width/2, height/2, meditation);
  rotateY(HALF_PI + (alpha/100));
  rotateX(QUARTER_PI + (beta/100));
  rotateZ(THIRD_PI + (gamma/100));
 
  for (float k = 1; k < worldZ-1; k += 1) {
    pushMatrix();
    for (float j = 1; j < worldY-1; j += 1) {
      pushMatrix();
      for (float i = 1; i < worldX-1; i += 1) {
        pushMatrix();
        translate(
          (k - (worldZ/2)) * dimension,
          (j - (worldY/2)) * dimension,
          (i - (worldX/2)) * dimension
        );
      
        ///// if cell is alive... /////
        if (initGen[int(k)][int(j)][int(i)] == true) {  
          int opacity = int((delta + theta)/2);
          if (opacity < 80) {
            opacity = 80;
          }
          fill(random(alpha), random(beta), random(gamma), random(opacity));    
                               
          int radii = int(random(9)); 
          switch (radii) {
            case 0:
              sphere(dimension/6);
            break;
            
            case 1:
              sphere(dimension/2);
            break;
            
            case 2:
              box(dimension/2);
            break;
            
            case 3:
              box(dimension/6);
            break;
            
            case 4:
              sphere(dimension/3);
            break;
            
            case 5:
              sphere(dimension/4);
            break;
            
            case 6:
              box(dimension/3);
            break;
            
            case 7:
              sphere(dimension/5);
            break;
            
            case 8:
              box(dimension/5);
            break;
            
            case 9:
              box(dimension/4);
            break;
          }
         
          sphereDetail(5);   
          ////// volume control of audio player //////
          float attentionGain = map(attention, 10, 100, -30, -15);
          player.setGain(attentionGain);
        }
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
  popMatrix();
}