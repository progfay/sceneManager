class testScene1 extends Scene {
  void setup() {
    println("test1 setup");
    noStroke();
  }

  void draw() {
    background(-1);
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 100, 100);
  }

  void keyPressed() {
    SceneAdministrator.changeScene("1-2");
  }
}

class testScene2 extends Scene {
  void setup() {
    println("test2 setup");
    rectMode(CENTER);
    noStroke();
  }

  void draw() {
    background(0);
    fill(0, 0, 255);
    rect(mouseX, mouseY, 100, 100);
  }

  void keyPressed() {
    SceneAdministrator.changeScene("2-1");
  }
}
