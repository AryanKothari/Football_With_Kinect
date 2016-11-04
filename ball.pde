class ball
{
  private float _x = 500;
  private float _y = 860;
  private boolean _move = false;

  ball(float x, float y, boolean move)
  {
    float _x = x;
    float _y = y;
  }

  public void Draw()
  {
    fill(255,255,255);
    ellipse(_x, _y, 50, 50);
  }
  public void hit()
  {
      _x = _x + 10;
      _y = _y - 5;
  }
  
  public void restart()
  {
    if(_x > width)
    {
      _x = 500;
      _y =860;
    }
  }
  
  public float ballx()
  {
    return _x;
  }
}