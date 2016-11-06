class ball
{
  private float _x = width/2.88;
  private float _y = height/1.046;
  private boolean _move = false;

  ball(float x, float y, boolean move)
  {
    float _x = x;
    float _y = y;
  }

  public void Draw()
  {
    fill(255, 255, 255);
    ellipse(_x, _y, width/28.8, height/18);
  }
  public void hit()
  {
    _x = _x + width/144;
    _y = _y - height/180;
  }

  public void restart()
  {
    if (_x > width)
    {
      _x = width/2.88;
      _y = height/1.046;
    }
  }

  public float ballx()
  {
    return _x;
  }
}