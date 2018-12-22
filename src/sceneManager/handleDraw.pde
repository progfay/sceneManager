@Override
  public void handleDraw() {
  if (g == null) return;
  if (!looping && !redraw) return;
  if (insideDraw) {
    System.err.println("handleDraw() called before finishing");
    System.exit(1);
  }

  insideDraw = true;
  g.beginDraw();
  if (recorder != null) {
    recorder.beginDraw();
  }

  long now = System.nanoTime();

  if (frameCount == 0) {
    SceneAdministrator.getCurrentScene().setup();
  } else {
    double rate = 1000000.0 / ((now - frameRateLastNanos) / 1000000.0);
    float instantaneousRate = (float) (rate / 1000.0);
    frameRate = (frameRate * 0.9f) + (instantaneousRate * 0.1f);

    if (frameCount != 0) handleMethods("pre");

    pmouseX = dmouseX;
    pmouseY = dmouseY;

    SceneAdministrator.getCurrentScene().draw();

    dmouseX = mouseX;
    dmouseY = mouseY;

    dequeueEvents();

    handleMethods("draw");

    redraw = false;
  }
  g.endDraw();

  if (recorder != null) recorder.endDraw();
  insideDraw = false;

  if (frameCount != 0) handleMethods("post");

  frameRateLastNanos = now;
  SceneAdministrator.incrementFrameCount();
  frameCount = SceneAdministrator.getFrameCount();
}
