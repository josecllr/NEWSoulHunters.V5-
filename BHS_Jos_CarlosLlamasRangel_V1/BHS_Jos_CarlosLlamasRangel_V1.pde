// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example
int pantalla=0;
float angle=PI/2;
float fail;

int puntos;
int record;

// Basic example of falling rectangles

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;
//_________--------------------------------------------
ArrayList<Boxevil> boxevils;
//_________--------------------------------------------

  
import processing.sound.*;
SoundFile file;
PImage death;
PImage deathhand;
PImage hoz;
PImage angel;
PImage evil;
PImage background;

PImage intro;
PImage gameover;

void setup() {
  size(1000,563);
  background = loadImage("background.png");
  //musicaPlay
  file = new SoundFile(this, "SBHS.mp3");
  file.play(); 
  file.stop();
  file.loop();
  //musica--
  //sprite de la muerte
  death = loadImage("death.png");
  deathhand = loadImage("deathhand.png");
  hoz = loadImage("hoz.png");
  angel = loadImage("angel.png");
  evil = loadImage("evil.png");
  
  intro = loadImage("intro.png");
  gameover = loadImage("gameover.png");
  //sprite de la muerte-
  smooth();

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(10, 0);

  // Create ArrayLists	
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  
  boxevils = new ArrayList<Boxevil>();

  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary(mouseX,mouseY,200,5,0));
  //boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));
}

void draw() {
  background(background);
  println(fail);
  record=puntos;
  
  switch(pantalla){
    case 0: //inicio
    puntos=0;
  image(intro, 0,0);
  if(key == ENTER || key == 'Q' ){
    pantalla = 1;
  }
  break;
  case 1: //juego
  puntos=puntos+1;
  textSize(32);
text(puntos, 10, 30); 
fill(0, 102, 153);
text(puntos, 10, 60);
fill(0, 102, 153, 51);
text(puntos, 10, 90); 
  
  
  image(death, mouseX-58, mouseY-120);
  death.resize(150, 267);
  
  
  
  //image(death, 0, 0, width/2, height/2);

  // We must always step through time!
  box2d.step();

  // Boxes fall from the top every so often
  if (random(1) < 0.01) {
    Box p = new Box(10,(3*height/4)-50); //10,(height/4)+50
    boxes.add(p);
  }
  
  if (random(1) < 0.01) {
    Boxevil p = new Boxevil(10,(height/4)+50);
    boxevils.add(p);
  }

  // Display all the boundaries and mouse position
  for (Boundary wall: boundaries) {
    wall.display();
    wall.position();
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
  
  for (Boxevil b: boxevils) {
    b.display();
  }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
  
  for (int i = boxevils.size()-1; i >= 0; i--) {
    Boxevil b = boxevils.get(i);
    if (b.done()) {
      boxevils.remove(i);
    }
  }
  image(deathhand, mouseX-58, mouseY-120);
  deathhand.resize(150, 267);
  
  
  if (fail==1){
    //image(gameover, 0,0);
  pantalla=2;
      
  
  }
  
  break;
    case 2: //gameover
    image(gameover, 0,0);
     textSize(32);
text(record, 10, 30); 
fill(0, 102, 153);
text(record, 10, 60);
fill(0, 102, 153, 51);
text(record, 10, 90); 
  if(key == 'r' || key == 'R' ){
    pantalla = 0;
    fail=0;
     
  }
  break;
  }
  
  
}