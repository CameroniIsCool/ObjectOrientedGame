class BasketballNet{
 PVector position; 
 PImage netImage;

 
 BasketballNet(float x, float y, PImage image){
   position = new PVector(x, y);
   netImage = image;
 }
 
 void displayNet(){
   image(netImage, position.x, position.y, position.x + 100, position.y + 200);//basketball net 
 }
}
