class Bullet extends Floater
{
  private double dRadians;
  public Bullet(SpaceShip bob)
  {
    double dRadians = myPointDirection*(Math.PI/180);
    myCenterX = (int)(bob.getX()-15);
    myCenterY = (int)(bob.getY()-15);
    myPointDirection = (int)(bob.getPointDirection());
    myDirectionX = 5 * Math.cos(dRadians) + bob.getDirectionY();
    myDirectionY = 5 * Math.sin(dRadians) + bob.getDirectionY();
  }
   public void show()
  {
    fill(255,255,20);
    ellipse(bob.getX(),bob.getY(),100,100);
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