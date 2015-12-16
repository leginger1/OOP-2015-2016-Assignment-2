
Map m;

void setup() {
  
  size(500,500);
  m = new Map();
  m.loadMap("maps\\map1.txt");
}


void draw() {
  background(255);
  m.render();
}