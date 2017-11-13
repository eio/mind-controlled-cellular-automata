void brainWaves() {
  textFont(myFont);
  textSize(12);
  
  fill(175,175,200,220);
  text("Attention", 65, 30);  
  text("Meditation", 175, 30);
  fill(200,170,200,160);
  text("Delta", 300, 30);         
  text("Theta", 395, 30);
  fill(200,125,125,200);
  text("Low Alpha", 495, 30);
  text("High Alpha", 605, 30);
  fill(150,200,150,200);
  text("Low Beta", 735, 30);         
  text("High Beta", 855, 30);
  fill(125,175,255,200);
  text("Low Gamma", 985, 30);
  text("High Gamma", 1125, 30);     
        
  textSize(10);
  fill(255,255,255,100);
  text(incVals[1], 85, 70);  
  text(incVals[2], 195, 70);
  text(incVals[3], 305, 70);         
  text(incVals[4], 400, 70);
  text(incVals[5], 515, 70);
  text(incVals[6], 620, 70);
  text(incVals[7], 750, 70);         
  text(incVals[8], 865, 70);
  text(incVals[9], 1005, 70);
  text(incVals[10], 1150, 70);
}