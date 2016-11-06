class player 
{
  private float _x = width/28.8;
  private float _y = height/1.07;
  private boolean move = true;
  boolean readytohit = false;

  player(float x, float y, boolean move)
  {
    x = _x;
    y = _y;
  }

  public void Draw()
  {
    fill(0, 0, 255);
    rect(_x, _y, width/28.8, height/18);
  }
  public void Move()
  {
    if (move)
    {
      _x = _x + width/720;
    }

    if (_x > width/3.42)
    {
      move = false;
      readytohit = true;
    }

    if (_x < width/3.42)
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
    if (ball.ballx() > width)
    {
      _x = width/28.8;
      _y = height/1.07;
    }
  }
}