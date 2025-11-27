
PImage netImage;
BasketballNet net;
boolean thrown;//whether the net has been thrown


void setup(){
  size(400, 400);
  rectMode(CORNERS);
  imageMode(CENTER);
  netImage = loadImage("Basketball hoop.png");
  net = new BasketballNet(320, 200, netImage);// rect mode corners equivalent: 250, 100
}
void draw(){
  background(255);
  drawshapes();
  
  if(thrown == true){
    net.throwNet(); 
  }

}
  void drawshapes(){
    fill(0);
    rect(70, 230, 120, 300);//guy throwing ball
    rect(30, 320, 370, 370); //throw bar
    net.displayNet();
  }
  
  void keyPressed(){
    if(key == ' '){
      thrown = true;
    }
  }
  
