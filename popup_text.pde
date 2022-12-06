

class Text {
  int millisAtSpawn;
  String text;
  float x, y, angle;
  
  Text(String text){
    this.text = text;
    millisAtSpawn = millis();
    x = width / 2 + random(-width / 4, width / 4);
    y = 50 + random(width / 4);
    angle = random(-0.4, 0.4);
  }
  
  void update(){
    if(millis() - millisAtSpawn > 1000)
      return;
    
    pushMatrix();
    fill(255 * 0.8, 220 * 0.8, 0);
    translate(x, y);
    rotate(angle);
    textSize(90 - (millis() - millisAtSpawn) / 40);
    textAlign(CENTER);
    text(text, 0, 0);
    popMatrix();
  }
  
}
