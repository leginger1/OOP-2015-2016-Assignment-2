//Class that will deal with levels and such

class Level {

  int level;

  Level(int level) {
    this.level = level;
  }

  //Returning the level value
  int getLevel() {
    return level;
  }

  //Spawns another wave
  void spawnBCreep() {
    gameObjects.add(new BasicCreep(path1.get(0).getX(), path1.get(0).getY(), path1));
  }
}