color currentColor;
boolean circleOver = false;
int data;

void setup(){
  size(640, 360);
  currentColor = color(102);
}

void draw(){
  update(mouseX, mouseY);
  background(currentColor);

  if(circleOver){
    fill(color(204));
  }else{
    fill(color(255));
  }
  stroke(0);
  ellipse(width/2, height/2, 100, 100);
}

void update(int x, int y) {
  if(overCircle(width/2, height/2, 100)){
    circleOver = true;
  }else{
    circleOver = false;
  }
}

boolean overCircle(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2){
    return true;
  }else{
    return false;
  }
}

/////////////////////////////////

void mousePressed() {
  if (circleOver) {
    if( data == 1){
      currentColor = color(102);
      String lines[] = loadStrings("http://your.url/index.php?p=0");
      for (int i = 0 ; i < lines.length; i++) {
        println(lines[i]);
      }
      data = 0;
    } else {
      currentColor = color(255);
      String lines[] = loadStrings("http://your.url/index.php?p=1");
      for (int i = 0 ; i < lines.length; i++) {
        println(lines[i]);
      }
      data = 1;
    }
  }
}