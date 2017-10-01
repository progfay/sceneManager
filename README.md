# sceneManager

## About

Processingでのシーン管理を、普段のコードに修正を加えることなく可能にします。

## Usaege

### Init

```java
SceneAdministrator sceneAdministrator = new SceneAdministrator();
```

必ず `sceneAdministrator` という名前でインスタンス化してください。

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
sceneAdministrator.set("test", new TestScene());
```

### Change Scene

```java
sceneAdministrator.changeScene("test");
```
