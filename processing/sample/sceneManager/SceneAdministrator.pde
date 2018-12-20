static class SceneAdministrator {
  static private HashMap<String, Scene> sceneMap     = new HashMap<String, Scene>();
  static private String                 currentScene = null;
  static private int                    frameCount   = 0;

  static public void set(String _key, Scene _scene) {
    sceneMap.put(_key, _scene);
  }

  static public void changeScene(String nextScene) {
    if (nextScene == null || !sceneMap.containsKey(nextScene)) throw new SceneNotFoundException();
    currentScene = nextScene;
    frameCount = -1;
  }

  static public String getCurrentSceneName() {
    return currentScene;
  }

  static public HashMap<String, Scene> sceneList() {
    return sceneMap;
  }

  static public Scene getCurrentScene() {
    return sceneMap.get(currentScene);
  }
  
  static public void incrementFrameCount() {
    frameCount++;
  }
  
  static public int getFrameCount() {
    return frameCount;
  }

  static class SceneNotFoundException extends RuntimeException {
    public SceneNotFoundException() {
      super("The scene you selected is not found.");
    }
  }
}
