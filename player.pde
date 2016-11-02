class player 
{
  float _x = 100;
  int _y = height;
  
  player(float x, int y)
  {
    x = _x;
    y = _y;
  }
  
  public void Draw()
  {
    fill(255, 255, 255);
    rect(x, y, 50,50);
  }
  public void Move()
  {
    _x = _x + 00.5;
  }
  
}