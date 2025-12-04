PImage netImage;
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
  net = new BasketballNet(320, 200, netImage);// rect mode corners equivalent: 250, 100
}
void draw(){
  background(255);
  drawshapes();
  throwdial();//displaying and moving the triangle on the throw bar
  //testtrajectory(); //testing, trying to get all the correct trajectories for each strength value
  
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
  
void testtrajectory(){
 for(int i = 0; i <=100; i++){//i will represent the strength value
  equationB = map(i, 0, 100, 210, 390);//change two values in the equation
  equationC = map(i, 0, 100, 65, 286);//B and C are arbitrary, thats just the way i had it setup in desmos
  //desmos graph: https://www.desmos.com/calculator/spruifatdj

  fill(3*i, i+125, 160 - i);//cool colours :D
      
  for(int x = 320; x >= 0; x--){
    
    testY =-0.01*(x-200)*(-x + equationB) + equationC;
    ellipse(x, testY, 3, 3);
  }
}

 fill(255, 0, 0);
 ellipse(testX, testY, 5, 5); 
}

void throwdial(){//the dial stretches from x=30 to x=370
  fill(0, 255, 0);
  triangle(triLocation.x, triLocation.y,
           triLocation.x - 10, triLocation.y + 25,
           triLocation.x + 10, triLocation.y + 25);
   
  triVelocity.limit(10);
  triLocation.add(triVelocity);
  if(triLocation.x >= 370){//if the dial gets to the end, invert the speed and go the other way
    triVelocity.x = triVelocity.x * -1;
    triLocation.x = 370;
    //triAcceleration.x = 1;
  }
  if(triLocation.x <= 30){//if the dial gets to the end, invert the speed and go the other way
    triVelocity.x = triVelocity.x * -1;
    triLocation.x = 30;
    //triAcceleration.x = 1;
  }
  
  if(triLocation.x < 200 && triVelocity.x < 0){//if dial is moving left and isnt past halfway, slow down
    if(slowdown == true){
      triAcceleration.x = triAcceleration.x * -1; 
      slowdown = false;
    }
    triVelocity.add(triAcceleration);
    println("test1");

  }
  else if(triLocation.x > 200 && triVelocity.x > 0){//if dial is moving right and is past halfway, slow down
    if(slowdown == false){
      triAcceleration.x = triAcceleration.x * -1; 
      slowdown = true;
    }
    triVelocity.add(triAcceleration);
    println("test2");
  }
  else{//otherwise, speed up
    if(triAcceleration.x < 0){
      triAcceleration.x = triAcceleration.x * -1; 
    }
    triVelocity.add(triAcceleration);
  }
  println(triLocation.x + " " + triVelocity.x + " " + triAcceleration.x);
}
  
void keyPressed(){
  if(key == ' '){
    thrown = true;
  }
}
  
