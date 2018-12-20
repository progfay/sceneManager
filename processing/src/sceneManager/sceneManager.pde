void settings() {
  size(800, 800);
  SceneAdministrator.set("1", new testScene1());
  SceneAdministrator.set("1-2", new ConnectScene1_2());
  SceneAdministrator.set("2", new testScene2());
  SceneAdministrator.set("2-1", new ConnectScene2_1());
  SceneAdministrator.changeScene("1");
}
