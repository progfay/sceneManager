class ConnectScene1_2 extends Scene {

  int count = 0;

  void setup() {
    this.count = 0;
    println("connect 1-2 setup");
    rectMode(CENTER);
    noStroke();
  }

  void draw() {
    background(255-this.count);
    if (this.count < 128) {
      fill(255, 0, 0, 255-this.count*2);
      ellipse(mouseX, mouseY, 100, 100);
    } else {
      fill(0, 0, 255, (this.count - 128) * 2);
      rect(mouseX, mouseY, 100, 100);
    }
    if(this.count++ >= 255) sceneAdministrator.changeScene("2");
  }
}

class ConnectScene2_1 extends Scene {
  int count;

  void setup() {
    this.count = 0;
    println("connect 2-1 setup");
    rectMode(CENTER);
    noStroke();
  }

  void draw() {
    background(this.count);
    if (this.count < 128) {
      fill(0, 0, 255, 255 - this.count * 2);
      rect(mouseX, mouseY, 100, 100);
    } else {
      fill(255, 0, 0, (this.count-128)*2);
      ellipse(mouseX, mouseY, 100, 100);
    }
    if(this.count++ >= 255) sceneAdministrator.changeScene("1");
  }
}