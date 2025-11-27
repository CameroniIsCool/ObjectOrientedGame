class BasketballNet{
 PVector position; 
 PImage netImage;

 
 BasketballNet(float x, float y, PImage image){
   position = new PVector(x, y); //320, 200
   netImage = image;
 }
 
 void displayNet(){
   image(netImage, position.x, position.y, 100, 200);//basketball net 
   println(position.x + " " + position.y);
 }
 
 void throwNet(){
   position.x--;
   position.y =-0.02*(position.x-200)*(-position.x+250) + 30; 
   
 }
}
