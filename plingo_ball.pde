
class PlingoObject{
  
  PVector velocity = new PVector();
  float x, y, radius;
  float terminalVelocity = 10;
  
  PlingoObject(float x, float y, float radius){
    this.x = x;
    this.y = y;
    this.radius = radius;
  }
  
  void update(){
    velocity.y -= gravity;
    if(velocity.mag() > terminalVelocity)
      velocity.normalize().mult(terminalVelocity);
      
    x += velocity.x;
    y += velocity.y;
      
    if(y > height - 20 && y < height + 300){
      int scoreUp = values[min(abs(ceil(n / 2) - floor((float)x / width * n)), 4)];
      score += scoreUp;
      y = height + 400;
      scoreText = new Text("+" + scoreUp);
    }
    
    if((x < 0 && velocity.x < 0) || (x > width && velocity.x > 0))
      velocity.x *= -1;
    
    PlingoObject collider = collision();
    if(collider == null)
      return;
    
    PVector newVelocityDirection = new PVector(x - collider.x, y - collider.y).normalize();
    newVelocityDirection.mult(velocity.mag());
    newVelocityDirection.y /= 1.3;
    velocity = newVelocityDirection;
  }
  
  PlingoObject collision(){
    for(PlingoObject pin : plingoPins){
      if(squaredDistance(x, y, pin.x, pin.y) <= (radius * 2) * (pin.radius * 2)){
        return pin;
      }
    }
    
    return null;
  }
  
  float squaredDistance(float ax, float ay, float bx, float by){
    //(ax - bx)^2 + (ay - by)^2
    return 
    (ax * ax + bx * bx - 2 * ax * bx) + 
    (ay * ay + by * by - 2 * ay * by);
  }
}
