SceneAdministrator sceneAdministrator = new SceneAdministrator();

void settings() {
  size(800, 800);
  sceneAdministrator.set("1", new testScene1());
  sceneAdministrator.set("1-2", new ConnectScene1_2());
  sceneAdministrator.set("2", new testScene2());
  sceneAdministrator.set("2-1", new ConnectScene2_1());
  sceneAdministrator.changeScene("1");
}