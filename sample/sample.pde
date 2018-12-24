void settings() {
  size(800, 800);
  SceneManager.set("1", new testScene1());
  SceneManager.set("1-2", new ConnectScene1_2());
  SceneManager.set("2", new testScene2());
  SceneManager.set("2-1", new ConnectScene2_1());
  SceneManager.changeScene("1");
}
