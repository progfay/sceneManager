private boolean requestedNoLoop = false;

@Override
  public void handleDraw() {
  if (g == null) return;

  if (!surfaceChanged && parentLayout != -1) return;
  if (!looping && !redraw) return;
  if (insideDraw) {
    System.err.println("handleDraw() called before finishing");
    System.exit(1);
  }

  insideDraw = true;
  g.beginDraw();

  if (requestedNoLoop) {
    looping = false;
    requestedNoLoop = false;
    g.endDraw();
    insideDraw = false;
    return;
  }

  long now = System.nanoTime();


  if (frameCount == 0) {
    sceneAdministrator.getCurrentScene().setup();
  } else {
    double rate = 1000000.0 / ((now - frameRateLastNanos) / 1000000.0);
    float instantaneousRate = (float) (rate / 1000.0);
    frameRate = (frameRate * 0.9f) + (instantaneousRate * 0.1f);

    if (frameCount != 0) handleMethods("pre");

    pmouseX = dmouseX;
    pmouseY = dmouseY;

    sceneAdministrator.getCurrentScene().draw();

    dmouseX = mouseX;
    dmouseY = mouseY;

    dequeueEvents();

    handleMethods("draw");
    if (0 < reqPermissions.size()) {
      String[] req = reqPermissions.toArray(new String[reqPermissions.size()]);
      surface.requestPermissions(req);
      reqPermissions.clear();
    }

    redraw = false;
  }
  g.endDraw();

  insideDraw = false;

  if (frameCount != 0) handleMethods("post");

  frameRateLastNanos = now;
  frameCount++;
}

@Override
  synchronized public void noLoop() {
  if (looping) {
    if (g instanceof PGraphicsOpenGL) {
      requestedNoLoop = true;
    } else {
      looping = false;
    }
  }
}