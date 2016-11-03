class player 
{
  private float _x = 50;
  private int _y = 840;
  private boolean move = true;
  boolean readytohit = false;
  
  player(float x, int y, boolean move)
  {
    x = _x;
    y = _y;
  }
  
  public void Draw()
  {
    fill(0,0,0);
    rect(_x, _y, 50,50);
  }
  public void Move()
  {
    if(move)
    {
    _x = _x + 00.5;
    }
    
    if(_x == 180)
    {
      move = false;
      readytohit = true;
    }
  }
  
}