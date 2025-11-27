float Ypos; //temporary y position variable
int x = 400; //temporary x position variable

PImage netImage;
BasketballNet net;

void setup(){
  size(400, 400);
  rectMode(CORNERS);
  imageMode(CORNERS);
  netImage = loadImage("Basketball hoop.png");
  net = new BasketballNet(250, 100, netImage);
}
void draw(){
  background(255);
  drawshapes();
  
  
//  for(int x = 400; x>=0; x--){
    noStroke();
    fill(map(x, 0, 400, 0, 255), 100, 255);
    Ypos=-0.02*(x-200)*(-x+250) + 30; //messing around with equations to get the correct trajectory
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
  void drawshapes(){
    fill(0);
    rect(70, 230, 120, 300);//guy throwing ball
    rect(40, 320, 360, 370); //throw bar
    net.displayNet();
  }
  
