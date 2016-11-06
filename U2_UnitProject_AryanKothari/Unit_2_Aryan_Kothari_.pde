/*
Hey Folks! This is my first project in which I used a kinect! For this project, it is 
 an interactive soccer game. First, stand in the red zone to move your player towards 
 the ball. Once positioned, Go Ahead and Kick! Lets see how many you can score summoner;)
 Made it you by Aryan Kothari 
 */

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