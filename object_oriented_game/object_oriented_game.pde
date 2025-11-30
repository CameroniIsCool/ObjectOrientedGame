PImage netImage;
BasketballNet net;

boolean thrown;//whether the net has been thrown
float strength;//how strong the player throws the net - how far itll go

float testX = 321;
float testY;

float equationB;
float equationC;

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
  testtrajectory(); //testing, trying to get all the correct trajectories for each strength value
  
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
  
  void keyPressed(){
    if(key == ' '){
      thrown = true;
    }
  }
  
