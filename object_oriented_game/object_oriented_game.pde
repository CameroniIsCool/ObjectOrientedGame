PImage netImage;
PImage barImage;
PImage guyImage;
BasketballNet net;

boolean thrown;//whether the net has been thrown
float strength;//how strong the player throws the net - how far itll go

float testX = 321;
float testY;

//int triPointX = 30;//the X 
//int triPointY = 360;//same as previous; constant value
//int triSpeed = 10;

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
     
  netImage = loadImage("Basketball hoop.png");
  barImage = loadImage("ThrowBar.png");
  guyImage = loadImage("Guy.png");
  net = new BasketballNet(320, 200, netImage);// rect mode corners equivalent: 250, 100
}
void draw(){
  background(255);
  drawshapes();
  throwdial();//displaying and moving the triangle on the throw bar
  
  if(thrown == true){
    testtrajectory(strength); 
  }
  
  if(thrown == true){
    net.throwNet(strength); 
  }

}
  void drawshapes(){
    imageMode(CORNERS);//center to facilitate rotation
    fill(0);
    image(guyImage, 50, 230, 120, 300);//guy throwing ball
    image(barImage, 30, 320, 370, 370); //throw bar
    imageMode(CENTER);//center to facilitate rotation
    net.displayNet();
  }
  
void testtrajectory(float i){
 //for(int i = 0; i <=100; i++){//i will represent the strength value
  equationB = map(i, 0, 100, 130, 390);//change two values in the equation
  equationC = map(i, 0, 100, -30, 286);//B and C are arbitrary, thats just the way i had it setup in desmos
  //desmos graph: https://www.desmos.com/calculator/spruifatdj

  fill(3*i, i+125, 160 - i);//cool colours :D
      
  for(int x = 320; x >= 0; x--){
    
    testY =-0.01*(x-200)*(-x + equationB) + equationC;
    ellipse(x, testY, 3, 3);
  //}
}

 fill(255, 0, 0);
 ellipse(testX, testY, 5, 5); 
}

void throwdial(){//the dial stretches from x=30 to x=370
  fill(0, 255, 0);
  triangle(triLocation.x, triLocation.y,
           triLocation.x - 10, triLocation.y + 25,
           triLocation.x + 10, triLocation.y + 25);
           
  triVelocity.add(triAcceleration);
  triVelocity.limit(15);
  triLocation.add(triVelocity);
  
  if(triLocation.x >= 370){//if the dial gets to the right side, invert the speed and go the other way
    triVelocity.x = -1;
    triAcceleration.x = triAcceleration.x * -1;    
    triLocation.x = 370;
  }
  
  if(triLocation.x <= 30){//if the dial gets to the left side, invert the speed and go the other way
    triVelocity.x = 1;
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
  
