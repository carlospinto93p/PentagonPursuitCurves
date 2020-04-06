 //Import PImage;
 
 float x, y, a;
 int n = 40;
 float [] xs = new float [n];
 float [] ys = new float [n];
 boolean grab = true;
 
 void setup () {
   a = 0;
 }

 void draw () {
   background(0);
   xs [0] = width/2;
   ys [0] = height/4;
   pentagon (xs [0], ys [0]);
   if (n > 1) for (int j = 1; j < n; j++) {
     xs [j] = persP (xs [j-1], ys [j-1])[0];
     ys [j] = persP (xs [j-1], ys [j-1])[1];
     pentagon (xs [j], ys [j]);
   }
   a += 0.005;
   if (a >= 1) {
     a = 0;
     grab = false;
   }
   //if (grab) saveFrame ("/storage/emulated/0/Pictures/Pentagon/P-#####.png");
   //if (grab) saveFrame ("/Mi dispositivo/DCIM/Screenshots/P-#####.jpg");
   //if (grab) saveFrame(android.os.Environment.getExternalStoragePublicDirectory(android.os.Environment.DIRECTORY_PICTURES).getAbsolutePath() + "/P/img-####.jpg");
   //saveFrame ("P-#####.jpeg");
 }
 
 void pentagon (float x, float y) {
   float x1, y1;
   for (int i = 0; i < 5; i++) {
     noStroke ();
     fill (160,0,160);
     ellipse (x, y, 10, 10);
     x1 = rot (x, y, width/2, height/2, 2*PI/5)[0];
     y1 = rot (x, y, width/2, height/2, 2*PI/5)[1];
     stroke (130,0,130);
     line (x,y,x1,y1);
     x = x1;
     y = y1;
   }
 }
 
 float [] persP (float x, float y) {
   float x1, y1, vx, vy;
   float [] ret = new float [2];
   x1 = rot (x, y, width/2, height/2, -2*PI/5)[0];
   y1 = rot (x, y, width/2, height/2, -2*PI/5)[1];
   vx = x1 - x;
   vy = y1 - y;
   ret [0] = x + a*vx;
   ret [1] = y + a*vy;
   return ret;
 }

 float [] rot (float x, float y, float cx, float cy, float rad) {
   float[] ret = new float [2];
   x = x - cx;
   y = y - cy;
   ret [0] = x*cos(rad) - y*sin(rad) + cx;
   ret [1] = x*sin(rad) + y*cos(rad) + cy;
   return ret;
 }
