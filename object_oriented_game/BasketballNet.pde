class BasketballNet{
 PVector position; 
 PImage netImage;

 
 BasketballNet(float x, float y, PImage image){
   position = new PVector(x, y); //320, 200
   netImage = image;
 }
 
 void displayNet(){
   image(netImage, position.x, position.y, 100, 200);//basketball net 
   //println(position.x + " " + position.y);
 }
 
 void throwNet(float i){
   equationB = map(i, 0, 100, 130, 390);//change two values in the equation
   equationC = map(i, 0, 100, -30, 286);
   
   position.x -= 2;
   //position.y =-0.02*(position.x-200)*(-position.x+250) + 30; 
   position.y =-0.01*(position.x-200)*(-position.x + equationB) + equationC;

 }
}
