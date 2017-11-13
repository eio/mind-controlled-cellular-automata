void updateWorld() {
  for (int k = 1; k < worldZ-1; k++) {
    for (int j = 1; j < worldY-1; j++) {
      for (int i = 1; i < worldX-1; i++) {
        updateWorld(k,j,i);
      }
    }
  }
  for (int k = 1; k < worldZ-1; k++) {
    for (int j = 1; j < worldY-1; j++) {
      for (int i = 1; i < worldX-1; i++) {
        initGen[k][j][i] = nworldXtGen[k][j][i];
      }
    }
  }
}