PImage netImage;
PImage barImage;
PImage guyImage;
BasketballNet net;//basketball net object

boolean thrown;//whether the net has been thrown
float strength;//how strong the player throws the net - how far itll go

PVector triLocation; //position of the tip of the triangle on the throw bar
PVector triVelocity;//pixels per frame the triangle will move
PVector triAcceleration;
boolean slowdown = false;

float equationB;//values in the equation that increase relative to the throw strength
float equationC;

void setup(){
  size(400, 400);
  rectMode(CORNERS);
  imageMode(CENTER);//center to facilitate rotation
  
  triLocation = new PVector(30, 360);//define PVectors for the dial of the throw bar
  triVelocity = new PVector(1, 0);//Y is constant
  triAcceleration = new PVector(1, 0);
   
  netImage = loadImage("Basketball hoop.png");//loading images 
  barImage = loadImage("ThrowBar.png");
  guyImage = loadImage("Guy.png");
  
  net = new BasketballNet(320, 200, netImage);// rect mode corners equivalent: 250, 100
}
void draw(){
  background(255);
  drawshapes();//place all the shapes that dont move
  throwdial();//displaying and moving the triangle on the throw bar
  
  if(thrown == true){
    net.throwNet(strength);//throw net now
  }
}
  void drawshapes(){
    imageMode(CORNERS);
    image(guyImage, 50, 230, 120, 300);//guy throwing ball
    image(barImage, 30, 320, 370, 370); //throw bar
    imageMode(CENTER);//back to center rotate the net
    net.displayNet();
  }
  

void throwdial(){//the dial stretches from x=30 to x=370
  fill(0, 255, 0);
  triangle(triLocation.x, triLocation.y,
           triLocation.x - 10, triLocation.y + 25,
           triLocation.x + 10, triLocation.y + 25);
  
  if(thrown == false){//once thrown, stay put
  triVelocity.add(triAcceleration);
  triVelocity.limit(15);//dont go too fast
  triLocation.add(triVelocity);
  
  fill(0);//add test on the screen that dissapears once the net has been thrown
  textSize(50);
  text("Press space", 85, 50);
  }
  
  if(triLocation.x >= 370){//if the dial gets to the right side, invert the speed and acceleration and go the other way
    triVelocity.x = -2;
    triAcceleration.x = triAcceleration.x * -1;    
    triLocation.x = 370;
  }
  
  if(triLocation.x <= 30){//if the dial gets to the left side, invert the speed and acceleration and go the other way
    triVelocity.x = 2;
    triAcceleration.x = triAcceleration.x * -1;   
    triLocation.x = 30;
  }
}

void keyPressed(){
  if(key == ' '){
    thrown = true;
    strength = map(triLocation.x, 30, 370, 0, 100);
  }
}
  
