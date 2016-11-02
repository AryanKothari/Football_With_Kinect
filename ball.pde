class ball
{
  private float _x = 250;
  private float _y = 850;
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
      _x = _x + 0.0005;
      _y = _y - 0.0001;
  }
  public void Goal()
  {
    if (_x == 1350)
    {
      _x = 50;
      _y = 850;
      
    }
  }
}