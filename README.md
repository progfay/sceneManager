# sceneManager

![sceneManager](https://gyazo.com/3c1be0d59cffd51956459afecad7c0f3.png)

## About

Processingの内部コードを書き換えることで、シーン管理を実現します。

## Usage

### Init

[src](https://github.com/progfay/sceneManager/tree/master/src) 配下のファイルをsketch内に追加してください

### Make Scene

```java
class TestScene extends Scene {
  void setup() {
    println("TestScene setup()");
  }

  void draw() {
    println("TestScene draw()");
  }
  
  void keyPressed() {
    println(TestScene keyPressed());
  }
}
```

`setup()` や `draw()` 、 `keyPressed()` や `mouseReleased()` など、全ての関数に対応しています。

### Set Scene

```java
SceneManager.set("test", new TestScene());
```

### Change Scene

```java
SceneManager.changeScene("test");
```
