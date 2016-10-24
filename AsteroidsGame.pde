//your variable declarations here
SpaceShip bob;
Rock joe;
public void setup() 
{
  //your code here
  size(500,500);
  bob = new SpaceShip();
  joe = new Rock();
}
public void draw() 
{
  //your code here
  background(255);
  bob.show();
  bob.move();
  bob.rotate(5);
  bob.accelerate(.06);
  joe.show();
  joe.move();
  joe.rotate(8);
  joe.accelerate(.08);
}
class SpaceShip extends Floater  
{   
  //your code here
  public SpaceShip() 
  {
    corners = 13;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 18;
    yCorners[0] = 0;
    xCorners[1] = 6;
    yCorners[1] = 12;
    xCorners[2] = -3;
    yCorners[2] = 9;
    xCorners[3] = -3;
    yCorners[3] = 15;
    xCorners[4] = -12;
    yCorners[4] = 15;
    xCorners[5] = -12;
    yCorners[5] = 6;
    xCorners[6] = -9;
    yCorners[6] = 6;
    xCorners[7] = -9;
    yCorners[7] = -6;
    xCorners[8] = -12;
    yCorners[8] = -6;
    xCorners[9] = -12;
    yCorners[9] = -15;
    xCorners[10] = -3;
    yCorners[10] = -15;
    xCorners[11] = -3;
    yCorners[11] = -9;
    xCorners[12] = 6;
    yCorners[12] = -12;
    myColor = color(0,0,0);
    myCenterX = 0.0;
    myCenterY = 0.0;
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
class Rock extends Floater
{
  public Rocks()
  {
    corners = 5;
    xCorners[0] = 12;
    yCorners[0] = 0;
    xCorners[1] = 4;
    yCorners[1] = 8;
    xCorners[2] = -2;
    yCorners[2] = 6;
    xCorners[3] = -2;
    yCorners[3] = 10;
    xCorners[4] = -8;
    yCorners[4] = 10;
    myColor = color(255,0,0);
    myCenterRx = 0.0;
    myCenterRy = 0.0;
    myDirectionRx = 2.0;
    myDirectionRy = -3.0;
    myPointDirectionR = 5;
  }
  public void setX(int x){myCenterRx = x;}
  public int getX() {return (int)myCenterRx;}
  public void setY(int y){myCenterRy = y;}
  public int getY() {return (int)myCenterRy;}
  public void setDirectionX(double x) {myDirectionRx = x;}
  public double getDirectionX() {return myDirectionRx;}
  public void setDirectionY(double y) {myDirectionRy = y;}
  public double getDirectionY() {return myDirectionRy;}
  public void setPointDirection(int degrees) {myPointDirectionR = degrees;}
  public double getPointDirection() {return myPointDirectionR;}
}
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

