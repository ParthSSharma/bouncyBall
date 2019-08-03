float x[];
float y[];
float w = 20;
float h = 20;
float xSpeed[];
float ySpeed[];
int numBalls = 10;
int ballsRem = numBalls;
int score = 0;

void setup(){  
  size(500, 500);
  frameRate(60);
  
  x = new float[numBalls];
  y = new float[numBalls];
  xSpeed = new float[numBalls];
  ySpeed = new float[numBalls];
  
  for(int i = 0; i < numBalls; i++){
    x[i] = random(w / 2, width - (w / 2));
    y[i] = random(h / 2, height - (h / 2));
    xSpeed[i] = random(-4, 4);
    ySpeed[i] = random(-4, 4);
  }
}

void draw(){
  background(255);
  fill(255, 0, 0);
  stroke(0, 255, 0);
  strokeWeight(4);
  
  for(int i = 0; i < numBalls; i++){
    ellipse(x[i], y[i], w, h);
  }
  
  for(int i = 0; i < numBalls; i++){
    x[i] = x[i] + xSpeed[i];
    y[i] = y[i] + ySpeed[i];
    
    if((x[i] + (w / 2) >= width) || (x[i] <= w / 2)){
      xSpeed[i] = -xSpeed[i];
    }
    if((y[i] + (h / 2) >= height) || (y[i] <= h / 2)){
      ySpeed[i] = -ySpeed[i];
    }
  }
  
  textSize(15);
  fill(0);
  text("Points: " + score, 5, 15);
  if(ballsRem == 0){
    textSize(32);
    fill(0);
    text("Game Over!", 160, 270);
  }
}

void mousePressed(){
  for(int i = numBalls - 1; i >= 0; i--){
    float dist = sqrt(((x[i] - mouseX) * (x[i] - mouseX)) + ((y[i] - mouseY) * (y[i] - mouseY)));
    if(dist <= 11){
      x[i] = -100;
      y[i] = -100;
      int speedBonus = int(abs(xSpeed[i]) + abs(ySpeed[i]));
      int timeBonus = int((20000.0 / millis()) * 10);
      score = score + 1 + speedBonus + timeBonus;
      ballsRem--;
      break;
    }
  }
}
