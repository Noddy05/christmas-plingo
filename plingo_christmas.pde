ArrayList<PlingoObject> plingoPins = new ArrayList<PlingoObject>();
PlingoObject ball;
float gravity = -0.2;

int score = 0;
int[] values = new int[]{ 100, 50, 25, 10, 5};
Text scoreText = null;

void setup(){
  size(800, 1000);
  generatePins();
  ball = new PlingoObject(random(width), height + 300, 7);
}

void generatePins(){
  for(int i = 1; i < 5; i++){
    for(int j = 0; j < i; j++){
      plingoPins.add(new PlingoObject((j - (float)(i - 1) / 2) * width / 15 + width / 2, i * height / 25 + 50, 5));
    }
  }
  for(int i = 3; i < 8; i++){
    for(int j = 0; j < i; j++){
      plingoPins.add(new PlingoObject((j - (float)(i - 1) / 2) * width / 15 + width / 2, (i + 2) * height / 25 + 50, 5));
    }
  }
  for(int i = 6; i < 11; i++){
    for(int j = 0; j < i; j++){
      plingoPins.add(new PlingoObject((j - (float)(i - 1) / 2) * width /15 + width / 2, (i + 4) * height / 25 + 50, 5));
    }
  }
  for(int i = 9; i < 15; i++){
    for(int j = 0; j < i; j++){
      plingoPins.add(new PlingoObject((j - (float)(i - 1) / 2) * width / 15 + width / 2, (i + 6) * height / 25 + 50, 5));
    }
  }
}

float offset;
void draw(){
  background(30);
  
  drawBottom();
  
  fill(255);
  circle(ball.x, ball.y, ball.radius * 2);
  ball.update();
  
  drawTree();
  
  fill(255);
  circle(sin(millis() / 2000.0) * (width - 50) / 2 + width / 2, 30, 14);
}

void mousePressed(){
  if(ball.y > height && millis() > 500){
    ball.y = 20; 
    ball.x = sin(millis() / 2000.0) * (width - 50) / 2 + width / 2;
    ball.velocity = new PVector();
  }
}

void drawTree(){
  noStroke();
  offset+= 0.005;
  for(PlingoObject pin : plingoPins){
    if(noise(pin.x + sin(offset), pin.y + offset) <= 0.3)
      fill(255 * 0.8, 220 * 0.8, 0);
    else
      fill(19, 128, 50);
    circle(pin.x, pin.y, pin.radius * 2);
  }
  if(scoreText != null)
    scoreText.update();
    
  fill(255 * 0.8, 220 * 0.8, 0);
  textSize(48);
  textAlign(CENTER);
  text(score, width / 2, 50);
}

int n = 9;
void drawBottom(){
  for(int i = 0; i < n; i++){
    if(i == n / 2)
      fill(94, 61, 50);
    else if(i % 2 == 0)
      fill(255, 0, 0);
    else
      fill(255);
    rect((float)width / n * i, height - 50, (float)width / n, 50);
  }
  for(int i = 0; i < 50; i++){
    fill(30, 30, 30, 1 * i);
    rect(0, height - 50, width, 50 - i);
  }
}
