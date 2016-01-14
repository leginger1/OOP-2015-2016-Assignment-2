
Map m;

void setup() {
  
  size(500,500);
  m = new Map();
  m.generateMap("data\\maps\\map1.txt",25,25);
  m.loadMap("maps\\map1.txt");
}


void draw() {
  background(255);
  m.render();
}

void keyPressed() {
 if(key == CODED) {
   if(keyCode == UP) {
     m.generateMap("data\\maps\\map1.txt",25,25);
     println("Map Generated");
     m.loadMap("maps\\map1.txt");
     println("Map Loaded");
   }
 }
}