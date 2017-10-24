class SceneAdministrator {
  private HashMap<String, Scene> sceneMap     = new HashMap<String, Scene>();
  private String                 currentScene = null;

  SceneAdministrator() {
    this.set(null, new NullScene());
  }

  public void set(String _key, Scene _scene) {
    this.sceneMap.put(_key, _scene);
  }

  public void changeScene(String nextScene) {
    if (nextScene == null || !this.sceneMap.containsKey(nextScene)) throw new SceneNotFoundException();
    this.currentScene = nextScene;
    frameCount = -1;
  }

  public String getCurrentSceneName() {
    return this.currentScene;
  }

  public HashMap<String, Scene> sceneList() {
    return this.sceneMap;
  }

  public Scene getCurrentScene() {
    return this.sceneMap.get(this.currentScene);
  }

  class NullScene extends Scene {
    NullScene() {
    }
  }

  class SceneNotFoundException extends RuntimeException {
    public SceneNotFoundException() {
      super("The scene you selected is not found.");
    }
  }
}