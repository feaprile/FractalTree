private double fractionLength = .8;
private int smallestBranch = 16;
private double branchAngle = .9;
boolean opener = false;
boolean closer = false;
boolean spaceColor = false;

public void setup()
{
  size(700, 700);
  //noLoop();
}
public void draw()
{
  background(255);
  stroke((int)(Math.random()*32)+25, (int)(Math.random()*43)+36, (int)(Math.random()*106)+70, 190);
  strokeWeight(4);
  
  if (spaceColor==true){
    background(0);
  }
  if (opener==true  ) {
    branchAngle += .01;
  }
  if (closer==true  ) {
    branchAngle-= .01;
  }
  drawBranches(526, 350, 116, 3*Math.PI/-2);
  drawBranches(174, 350, 116, 3*Math.PI/2);
  line(0, 700, 174, 350);
  line(700, 0, 526, 350);
}
public void drawBranches(int x, int y, double branchLength, double angle) {
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;

  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);

  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
}


public void keyPressed() {

  if (key=='w') {
    opener = true;
  }
  if (key=='s') {
    closer = true;
  }
  if (key==' '){
    spaceColor = true;
}
}
public void keyReleased() {
  if (key=='w') {
    opener = false;
  }
  if (key=='s') {
    closer = false;
  }
  if (key==' '){
    spaceColor = false;
}
}
