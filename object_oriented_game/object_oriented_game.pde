float Ypos;
int x = 400;
void setup(){
  size(400, 400);
  rectMode(CORNERS);
}
void draw(){
  background(255);
  fill(0);
  rect(70, 230, 120, 300);
  rect(290, 110, 340, 300);
  rect(40, 320, 360, 370); 
//  for(int x = 400; x>=0; x--){
    noStroke();
    fill(map(x, 0, 400, 0, 255), 100, 255);
    Ypos=-0.02*(x-200)*(-x+250) + 30;
    ellipse(x, Ypos, 10, 10);
   // println(x + " " + Ypos);
//  }
  if(x < 50){
   x = 400; 
  }
  else{
   x--; 
  }
}
