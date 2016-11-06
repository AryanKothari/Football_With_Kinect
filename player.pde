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
    fill(0, 0, 255);
    rect(_x, _y, 50, 50);
  }
  public void Move()
  {
    if (move)
    {
      _x = _x + 1;
    }

    if (_x > 420)
    {
      move = false;
      readytohit = true;
    }
    
    if (_x < 420)
    {
      move = true;
    }
  }

  public float xvalue()
  {
    return _x;
  }
  
   public void restart()
  {
    if(ball.ballx() > width)
    {
      _x = 50;
      _y =840;
    }
  }
}