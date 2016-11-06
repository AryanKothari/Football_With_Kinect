// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

class KinectTracker {

  // Depth threshold
  int maxthreshold = 800;
  int maxthreshold2 = 600;

  // Raw location
  PVector loc;

  int score = 0;

  int minthreshold = 750;
  int minthreshold2 = 400;

  // Interpolated location
  PVector lerpedLoc;

  // Depth data
  int[] depth;

  // What we'll show the user
  PImage display;

  boolean moveplayer = false;
  boolean moveball = false;
  KinectTracker() {
    // This is an awkard use of a global variable here
    // But doing it this way for simplicity
    kinect.initDepth();
    kinect.enableMirror(true);
    // Make a blank image
    display = createImage(kinect.width, kinect.height, RGB);
    // Set up the vectors
    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
  }

  void track() {

    fill (0, 0, 0);
    textSize(100);
    text(score, 1000, 300);
    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();

    // Being overly cautious here
    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        int offset =  x + y*kinect.width;
        // Grabbing the raw depth
        int rawDepth = depth[offset];

        // Testing against threshold
        if (rawDepth < maxthreshold) {
          sumX += x;
          sumY += y;
          count++;
        }
        if (rawDepth < maxthreshold2) {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    // As long as we found something
    if (count != 0) {
      loc = new PVector(sumX/count, sumY/count);
    }

    // Interpolating the location, doing it arbitrarily for now
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  void display() {
    PImage img = kinect.getDepthImage();

    // Being overly cautious here
    if (depth == null || img == null) return;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        int offset = x + y * kinect.width;
        // Raw depth
        int rawDepth = depth[offset];
        int pix = x + y * display.width;
        if (rawDepth < maxthreshold && rawDepth > minthreshold) {
          display.pixels[pix] = color(255, 0, 0);
          moveplayer = true;
        } else if (rawDepth < maxthreshold2 && rawDepth > minthreshold2)
        {
          display.pixels[pix] = color(0, 0, 255);
          moveball = true;
        } else 
        {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }

    if (moveplayer)
    {
      player.Move();
      moveplayer = false;
    }
    if (moveball)
    {
      if (player.xvalue() > width/3.42)
      {
        ball.hit();
        moveball = true;
        player.restart();
        if (ball.ballx() > width)
        {
          moveball = false; 
          ball.restart();

          score = score + 1;
          
          maxthreshold = int(random(700,1000));
          minthreshold = maxthreshold - 50;
          
        }
      } else 
      {
        moveball = false;
      }
    }


    display.updatePixels();

    // Draw the image
    image(display, 0, 0);
  }

  int getThreshold() {
    return maxthreshold;
  }
  int getThreshold2() {
    return maxthreshold2;
  }

  void setThreshold(int t) {
    maxthreshold =  t;
  }
  void setThreshold2(int t) {
    maxthreshold2 =  t;
  }
}