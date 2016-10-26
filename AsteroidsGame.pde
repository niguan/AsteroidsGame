//your variable declarations here
SpaceShip bob;
// Rock joe;
// Star [] galaxy = new Star[200];
public void setup() 
{
  //your code here
  size(600,600);
  bob = new SpaceShip();
  //joe = new Rock();
  // for (i = 0; i < galaxy.length; i++)
  // {
  //   galaxy[i] = new Star();
  // }
}
public void draw() 
{
  //your code here
  background(0);
  bob.show();
  bob.move();
  bob.rotate(0);
  // joe.show();
  // joe.move();
  // joe.rotate(8);
  // joe.accelerate(.08);
  // for (i = 0; i <galaxy.length; i++)
  // {
  //   galaxy[i].show;
  // }
}
public void keyPressed()
{
  if (key == 'w')
  {
    bob.setX((int)Math.random()*600);
    bob.setY((int)Math.random()*600);
    bob.setDirectionX(0.0);
    bob.setDirectionY(0.0);
    bob.setPointDirection((int)Math.random()*360);
  }
  if (key == 'a')  {bob.rotate(10);}
  if (key == 'd')  {bob.rotate(-10);}
  if (key == 's')
  {
    bob.accelerate(.32);
  }
}
// class Star
// {
//   public Star()
//   {
//     private int sX,sY;
//   }
//     public void draw()
//     {
//       sX = (Math.random() *600);
//       sY = (Math.random()* 600);
//       fill(0,255,255);
//       ellipse(sX,sY,15,15);
//     }
// }
class SpaceShip extends Floater  
{   
  //your code here
  public SpaceShip() 
  {
    corners = 13;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 36;
    yCorners[0] = 0;
    xCorners[1] = 12;
    yCorners[1] = 24;
    xCorners[2] = -6;
    yCorners[2] = 18;
    xCorners[3] = -6;
    yCorners[3] = 30;
    xCorners[4] = -24;
    yCorners[4] = 30;
    xCorners[5] = -24;
    yCorners[5] = 12;
    xCorners[6] = -18;
    yCorners[6] = 12;
    xCorners[7] = -18;
    yCorners[7] = -12;
    xCorners[8] = -24;
    yCorners[8] = -12;
    xCorners[9] = -24;
    yCorners[9] = -30;
    xCorners[10] = -6;
    yCorners[10] = -30;
    xCorners[11] = -6;
    yCorners[11] = -18;
    xCorners[12] = 12;
    yCorners[12] = -24;
    myColor = color(200,200,200);
    myCenterX = 0;
    myCenterY = 0;
    myDirectionX = 2.0;
    myDirectionY = 3.0;
    myPointDirection = 10;
  }
  public void setX(int x){myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}
// class Rock extends Floater
// {
//   public Rock()
//   {
//     corners = 8;
//     xCorners = new int[corners];
//     yCorners = new int[corners];
//     xCorners[0] = 7;
//     yCorners[0] = -14;
//     xCorners[1] = 14;
//     yCorners[1] = -7;
//     xCorners[2] = 14;
//     yCorners[2] = 7;
//     xCorners[3] = 7;
//     yCorners[3] = 14;
//     xCorners[4] = -7;
//     yCorners[4] = 14;
//     xCorners[5] = -14;
//     yCorners[5] = 7;
//     xCorners[6] = -14;
//     yCorners[6] = -7;
//     xCorners[7] = -7;
//     yCorners[7] = -14;
//     myColor = color(255,0,0);
//     myCenterX = 0.0;
//     myCenterY = 0.0;
//     myDirectionX = 2.0;
//     myDirectionY = -3.0;
//     myPointDirection = 5;
//   }
//   public void setX(int x){myCenterX = x;}
//   public int getX() {return (int)myCenterX;}
//   public void setY(int y){myCenterY = y;}
//   public int getY() {return (int)myCenterY;}
//   public void setDirectionX(double x) {myDirectionX = x;}
//   public double getDirectionX() {return myDirectionX;}
//   public void setDirectionY(double y) {myDirectionY = y;}
//   public double getDirectionY() {return myDirectionY;}
//   public void setPointDirection(int degrees) {myPointDirection = degrees;}
//   public double getPointDirection() {return myPointDirection;}
// }
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

