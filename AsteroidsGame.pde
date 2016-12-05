//your variable declarations here
SpaceShip bob;
ArrayList <Asteroid> rock;
ArrayList <Bullet> shot;
Star [] galaxy = new Star[300];
public void setup() 
{
  //your code here
  size(800,800);
  for (int j = 0; j < galaxy.length; j++) {galaxy[j] = new Star();}
  bob = new SpaceShip();
  shot = new ArrayList <Bullet>();
  rock = new ArrayList <Asteroid>();
  for (int i = 0; i< 9; i++) {rock.add(i, new Asteroid());}
}
public void draw() 
{
  //your code here
  background(0);
  for (int j = 0; j <galaxy.length; j++) {galaxy[j].show();}
  for (int i = 0; i < 8; i++)
  {
    rock.get(i).show();
    rock.get(i).move();
  }  
  for (int k = 0; k < shot.size(); k++)
  {
    fill(255,255,20);
    stroke(255,255,20);
    shot.get(k).show();
    shot.get(k).move();
    shot.get(k).accelerate(.03);
  }
  for (int i = 0; i< 8; i++)
  {
    if (dist(bob.getX(), bob.getY(), rock.get(i).getX(), rock.get(i).getY()) < 35)
    {
      rock.remove(i);
      rock.add(0, new Asteroid());
    }
    for (int k =0; k < shot.size();k++)
    {
      if (dist(shot.get(k).getX(), shot.get(k).getY(), rock.get(i).getX(), rock.get(i).getY()) < 20)
      {
        rock.remove(i);
        rock.add(0, new Asteroid());
        shot.remove(k);
        break;
      }
    }  
  }
  bob.show();
  bob.move();
  bob.rotate(0);
  if (bob.rotate() > 1)
  {
    shot.rotate() = bob.rotate();
  }

}
public void keyPressed()
{
  if (key == 's') //hyperspace
  {
    bob.setX((int)(Math.random()*800));
    bob.setY((int)(Math.random()*800));
    bob.setDirectionX(0.0);
    bob.setDirectionY(0.0);
    bob.setPointDirection((int)(Math.random()*360));
  }
  if (key == 'a')  {bob.rotate(-5);}
  if (key == 'd')  {bob.rotate(5);}
  if (key == 'w')  {bob.accelerate(.12);}
 }
public void mousePressed()
{ 
  {
    shot.add(new Bullet(bob));
    System.out.println(shot.size());
  }
}
class Star
{
  private int sX, sY;
  public Star()
  {
    sX = (int)(Math.random() *800);
    sY = (int)(Math.random()* 800);
  }
    public void show()
    {
      fill(255,255,255);
      ellipse(sX,sY,3,3);
    }
}
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
    xCorners[2] = -6;
    yCorners[1] = 24;
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
    myCenterX = 100;
    myCenterY = (int)(Math.random()*800);
    myDirectionX = 0.0;
    myDirectionY = 0.0;
    myPointDirection = (int)(Math.random()*360);
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
class Asteroid extends Floater
{
  private int aX,aY,speedRotate;
  public Asteroid()
  {
    aX = (int)(Math.random()*800);
    aY = (int)(Math.random()*800);
    speedRotate = (int)((Math.random()*18)-9);
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 9;
    yCorners[0] = -18;
    xCorners[1] = 18;
    yCorners[1] = -9;
    xCorners[2] = 18;
    yCorners[2] = 9;
    xCorners[3] = 9;
    yCorners[3] = 18;
    xCorners[4] = -9;
    yCorners[4] = 18;
    xCorners[5] = -18;
    yCorners[5] = 9;
    xCorners[6] = -18;
    yCorners[6] = -9;
    xCorners[7] = -9;
    yCorners[7] = -18;
    myColor = color(255,0,0);
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*800);
    myDirectionX = (int)(Math.random()*8)-4;
    myDirectionY = (int)(Math.random()*8)-4;
    myPointDirection = (int)(Math.random()*360);
  }
    public void move()
    {
      rotate(speedRotate);
      super.move();
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
class Bullet extends Floater
{
  private double dRadians;
  public Bullet(SpaceShip bob)
  {
    myPointDirection = (int)(bob.getPointDirection());
    dRadians = myPointDirection*(Math.PI/180);
    myCenterX = (int)(bob.getX());
    myCenterY = (int)(bob.getY());
    myDirectionX = 5 * Math.cos(dRadians) + bob.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + bob.getDirectionY();
    myColor = color(255,255,20);
  }
   public void show()
  {
    ellipse((int)myCenterX, (int)myCenterY,5,5);
  }
  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
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