//your variable declarations here
public void setup() 
{
  //your code here
  size(500,500);
}
public void draw() 
{
  //your code here
}
class SpaceShip extends Floater  
{   
  //your code here
  public SpaceShip() 
  {
    corners = 13;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 6;
    yCorners[0] = 0;
    xCorners[1] = 2;
    yCorners[1] = 4;
    xCorners[2] = -1;
    yCorners[2] = 3;
    xCorners[3] = -1;
    yCorners[3] = 5;
    xCorners[4] = -4;
    yCorners[4] = 5;
    xCorners[5] = -4;
    yCorners[5] = 2;
    xCorners[6] = -3;
    yCorners[6] = 2;
    xCorners[7] = -3;
    yCorners[7] = -2;
    xCorners[8] = -4;
    yCorners[8] = -2;
    xCorners[9] = -4;
    yCorners[9] = -5;
    xCorners[10] = -1;
    yCorners[10] = -5;
    xCorners[11] = -1;
    yCorners[11] = -3;
    xCorners[12] = 2;
    yCorners[12] = -4;
    myColor = Color(0);
    myCenterX = 0.00;
    myCenterY = 0.00;
    myDirectionX = 2.0;
    myDirectionY = 3.0;
    myPointDirection = 10;
  }
  public void setX(int x){myCenterX = x;}
  public int getX() {return myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY() {return myCenterY;}
  public void setDrirectionX() {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY() {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection() {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
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

