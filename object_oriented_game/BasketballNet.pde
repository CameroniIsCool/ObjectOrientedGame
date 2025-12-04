class BasketballNet{
 PVector position; 
 PImage netImage;
 float rotation = 0.1;

 
 BasketballNet(float x, float y, PImage image){
   position = new PVector(x, y); //320, 200
   netImage = image;
 }
 
 void displayNet(){
   if(thrown == true){
     pushMatrix();
     translate(position.x, position.y);
     rotate(rotation);
     image(netImage, 0, 0, 100, 200);//basketball net 
     popMatrix();
     rotation -= 0.025;
     println(strength);
   }
   else{
     image(netImage, position.x, position.y, 100, 200);//basketball net 
   }
 }
 
 void throwNet(float i){//i is the strength value (1-100)
   equationB = map(i, 0, 100, 60, 294);//change two values in the equation
   equationC = map(i, 0, 100, -110, 170);//B and C are arbitrary, thats just the way i had it setup in desmos
  //desmos graph: https://www.desmos.com/calculator/spruifatdj
   
   position.x -= 2;
   position.y =-0.01*(position.x-200)*(-position.x + equationB) + equationC;//equation

 }
}
