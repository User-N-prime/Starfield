class Star {
  float x, y, depth;
  float speed;
  int col;

  Star() {
    x = (float)Math.random() * 2 * width - width;
    y = (float)Math.random() * 2 * height - height;
    depth = (float)Math.random() * 2 * width - width;
    speed = (float)(10 * Math.random() + 5);
    col = 255;
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
    float size = map(depth, 0, width, 15, 0); // closer = bigger

    noStroke();
    fill(255);
    ellipse(myX, myY, size, size);
  }
}

class heHeheHaw extends Star {
  heHeheHaw() {
    x = width / 2;
    y = height / 2;
    depth = width;
    speed = 1;
  }

  void show() {
    float myX = map(x / depth, 0, 1, 0, width);
    float myY = map(y / depth, 0, 1, 0, height);
    float size = map(depth, 0, width, 100, 0); // maybe larger

    noStroke();
    fill(255, 171, 24); // bluish tint
    ellipse(myX, myY, size, size);
  }
}

Star[] stars = new Star[500];

void setup() {
  size(1000, 1000);
  for (int i = 0; i < stars.length - 10; i++) {
    stars[i] = new Star();
  }
  for (int i = stars.length - 10; i < stars.length; i++)
    stars[i] = new heHeheHaw();
}

void draw() {
  fill(0, 150);
  rect(0, 0, width, height);
  translate(width / 2, height / 2);
  for (Star s : stars) {
    s.move();
    s.show();
  }
}
