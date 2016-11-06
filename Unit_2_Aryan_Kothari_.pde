import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
PImage img;


float x;
float y;
boolean move = false;
PImage soccer; 
PImage post;

Kinect kinect;
KinectTracker tracker;

ball ball;
player player;
void setup()
{
  soccer = loadImage("soccer.jpg");
  post = loadImage("post.png");
  soccer.resize(width, height);
  fullScreen();
  background(soccer);

  kinect = new Kinect(this);
  tracker = new KinectTracker();
  kinect.initDepth();

  ball = new ball(x, y, move);
  player = new player(10, 800, true);
}

void draw()
{
  background(soccer);
  ball.Draw();  
  player.Draw();

  img = kinect.getDepthImage();
  image(img, 0, 0);



  tracker.track();
  tracker.display();

  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);
  

} 


//Set one threshold and if average point is in that threshold, the player will move forwards towards the ball.
//when the player is in collision with the ball and he enters the second threshold the ball is kicked