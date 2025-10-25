boolean hyperDrive = false;
boolean a_One = false;
float hyperSpeed = 1;
float backCol = 0;

class Star {
  float x, y, depth;
  float speed;
  int col;

  Star() {
    x = (float)Math.random() * 2 * width - width;
    y = (float)Math.random() * 2 * height - height;
    depth = (float)(Math.random() * (width - 1) + 1);
    speed = (float)(10 * Math.random() + 5);
    col = 255;
  }

  void move() {
    depth -= hyperSpeed * speed;
    if (depth < 1) {
      depth = width;
      x = (float)Math.random() * 2 * width - width;
      y = (float)Math.random() * 2 * height - height;
    }
  }

  void show() {
    float myX = map(x / depth, 0, 1, 0, width);
    float myY = map(y / depth, 0, 1, 0, height);
    float size = map(depth, 0, width, 15, 0);

    if (hyperSpeed > 25) {
      // 171, 251, 254
      stroke(85 * (float)Math.random() + 171, 255, 255, (hyperSpeed - 25) * 10);
      strokeWeight(max(0, size - 3));
      line(myX - x, myY - y, myX, myY);
    }
    if (hyperSpeed < 35) {
      noStroke();
      if (hyperSpeed > 25) {
        fill(255, 255 * ((35 - hyperSpeed) / 10));
      }
      else {
        fill(255);
      }
      ellipse(myX, myY, size, size);
    }
  }
}

class heHeheHaw extends Star {
  heHeheHaw() {
    x = width / 2;
    y = height / 2;
    depth = width;
    speed = 1;
  }
  
  void move() {
    depth -= speed;
    if (depth < 1) {
      depth = width;
      x = (float)Math.random() * 2 * width - width;
      y = (float)Math.random() * 2 * height - height;
    }
  }

  void show() {
    float myX = map(x / depth, 0, 1, 0, width);
    float myY = map(y / depth, 0, 1, 0, height);
    float size = map(depth, 0, width, 100, 0);

    noStroke();
    fill(255, 171, 24);
    ellipse(myX, myY, size, size);
  }
}

void keyPressed() {
  if (key == ' ')
    hyperDrive = !hyperDrive;
  if (hyperDrive) {
    if (key == '1')
      a_One = !a_One;
  }
  else
    a_One = false;
}

Star[] stars = new Star[500];

void setup() {
  size(1000, 1000);
  for (int i = 0; i < 10; i++) {
    stars[i] = new heHeheHaw();
  }
  for (int i = 10; i < stars.length; i++)
    stars[i] = new Star();
}

void draw() {
  if (hyperDrive) {
    if (a_One) {
      hyperSpeed = constrain(hyperSpeed + 0.4, 10, 50);
      backCol = min(backCol + 1, 150);
      for (int i = 50; i >= 20; i--) {
        float r = constrain(backCol, 0, i * 4 / 50);
        float b = constrain(backCol, 0, i * 108 / 50);
        fill(r, 0, b);
        noStroke();
        ellipse(width / 2, height / 2, 30 * i, 30 * i);
      }
    }
    else {
      hyperSpeed = constrain(hyperSpeed + 0.4, 1, 10);
    }
  }
  else {
    hyperSpeed = constrain(hyperSpeed - 0.5, 1, 10);
  }
  
  
  if (a_One) {
    hyperSpeed = constrain(hyperSpeed + 0.4, 10, 50);
  }
  else {
    backCol = max(backCol - 5, hyperSpeed - 10);
    fill(backCol, 150);
    rect(0, 0, width, height);
  }
  translate(width / 2, height / 2);
  for (Star s : stars) {
    s.move();
    s.show();
  }
}
