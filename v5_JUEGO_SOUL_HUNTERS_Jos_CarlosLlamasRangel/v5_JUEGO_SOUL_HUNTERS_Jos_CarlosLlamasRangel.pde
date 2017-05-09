import processing.sound.*;
SoundFile file;
PImage spacei;
PImage ghosti;
PImage inqi;
PImage snakei;
PImage tvi;
PImage witchi;

PImage title1;
PImage select;
PImage fondobattle2;
PImage lost;
PImage winn;
PImage tiee;


int pantalla=0;
int posnpc=380;
//____________________________
int player;
int npc= int (random (1,6));
int space=1;
int ghost=2;
int inq=3;
int snake=4;
int tv=5;
int witch=6;
//____________________________
int result;
int win=1;
int loose=2;
int tie=3;

Monster Char1;
Monster Char2;
Monster Char3;
Monster Char4;
Monster Char5;
Monster Char6;

Monster npc1;
Monster npc2;
Monster npc3;
Monster npc4;
Monster npc5;
Monster npc6;

void setup(){
  noSmooth();
  size(500,500);
  
  file = new SoundFile(this, "df.mp3");
  file.play(); 
  file.stop();
  file.loop();
  
  spacei = loadImage("space.png");
  ghosti = loadImage("ghost.png");
  inqi = loadImage("inq.png");
  snakei = loadImage("snake.png");
  tvi = loadImage("tv.png");
  witchi = loadImage("witch.png");
  
  title1= loadImage("title1.png");
  select= loadImage("select1.png");
  fondobattle2= loadImage("fondobattle2.png");
  lost= loadImage("lost.png");
  winn= loadImage("win.png");
  tiee= loadImage("tie.png");
  
  Char1= new Monster( 120, 200,3,-3,100,50,1,1);
  Char2= new Monster( 120, 200,3,-3,100,50,1,1);
  Char3= new Monster( 120, 200,3,-3,100,50,1,1);
  Char4= new Monster( 120, 200,3,-3,100,50,1,1);
  Char5= new Monster( 120, 200,3,-3,100,50,1,1);
  Char6= new Monster( 120, 200,3,-3,100,50,1,1);
  
  npc1= new Monster( posnpc, 200,3,3,100,50,1,1);
  npc2= new Monster(posnpc, 200,3,3,100,50,1,1);
  npc3= new Monster( posnpc, 200,3,3,100,50,1,1);
  npc4= new Monster( posnpc, 200,3,3,100,50,1,1);
  npc5= new Monster( posnpc, 200,3,3,100,50,1,1);
  npc6= new Monster( posnpc, 200,3,3,100,50,1,1);
}

void draw(){
  background(255);
  //-------------------------------------------------------------------------------
  //PANTALLA
  //-------------------------------------------------------------------------------
  //if(key == ENTER || key == 'Q' ){
    //pantalla = 1;
  //}
  //if(key == 'w' || key == 'W' ){
    //pantalla = 2;
  //}
  //if(key == 'e' || key == 'E' ){
    //pantalla = 3;
  //}
  //if(key == 'r' || key == 'R' ){
    //pantalla = 4;
  //}
  //if(key == 'o' || key == 'O' ){
    //pantalla = 0;
  //}
  switch(pantalla){
    case 0: //inicio
    background(255,0,0);
    println("inicio");
    textSize(32);
    if(key == ENTER || key == 'Q' ){
    pantalla = 1;
  }
     text("SOUL HUNTERS", width-370, height/2);
     textSize(20);
      image(title1, 0, 0); //¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
     text("Presiona ENTER para jugar", width-370, height/2+100);
    break;
    
    
    case 1: //seleccion
    background(0,255,0);
    image(select, 0, 0); //¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
    println("seleccion");
    String s = "Selecciona a tu jugador, hay 3 tipos de criaturas, Muertos, Cazadores y Espiritus, los Muertos le ganan a los cazadores, los cazadores a los espiritus y los espiritus a los monstruos, en caso de tener la misma criatura, hay empate";
    fill(50);
    text(s, 10, 10, 490, 400 );
    textSize(14);
    String x = "presiona 1 para Undead Spaceman (muerto),presiona 2 para Ghorned (muerto),presiona 3 para la Inquisidora (Cazadora),presiona 4 para Sanekki (cazadora),presiona 5 para NTVO (espiritu),presiona 6 para Switch (espiritu).";
    fill(50);
    text(x, 10,400, 490, 400 );
         
     if(key == '1'){
       Char1.DibujarP1();
      player = space;
      String sp = "Undead Spaceman seleccionado, presiona W para continuar";
      text(sp, 250,200, 200, 400 );
      if(key == 'w' || key == 'W' ){
    pantalla = 2;
  }
     }
     if(key == '2'){
       Char2.DibujarP2();
      player = ghost;
      String sp = "Ghorned seleccionado, presiona W para continuar";
      text(sp, 250,200, 200, 400 );
      if(key == 'w' || key == 'W' ){
    pantalla = 2;
  }
     }
     if(key == '3'){
       Char3.DibujarP3();
      player = inq;
      String sp = "Inquisidora seleccionado, presiona W para continuar";
      text(sp, 250,200, 200, 400 );
      if(key == 'w' || key == 'W' ){
    pantalla = 2;
  }
     }
     if(key == '4'){
       Char4.DibujarP4();
      player = snake;
      String sp = "Sanekki seleccionado, presiona W para continuar";
      text(sp, 250,200, 200, 400 );
      if(key == 'w' || key == 'W' ){
    pantalla = 2;
  }
     }
     if(key == '5'){
       Char5.DibujarP5();
      player = tv;
      String sp = "NTVO seleccionado, presiona W para continuar";
      text(sp, 250,200, 200, 400 );
      if(key == 'w' || key == 'W' ){
    pantalla = 2;
  }
     }
     if(key == '6'){
       Char6.DibujarP6();
      player = witch;
      String sp = "Switch seleccionado, presiona W para continuar";
      text(sp, 250,200, 200, 400 );
      if(key == 'w' || key == 'W' ){
    pantalla = 2;
  }
     }
     if(key == 'w' || key == 'W' ){
       if(player > 0){
    pantalla = 2;
  }
    //pantalla = 2;
  }
    break;
    case 2: //juego
    background(0,0,255);
    image(fondobattle2, 0, 0); //¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
    println("juego");
    if(player == 1){
      //Space
       Char1.DibujarP1();
     }
     if(player == 2){
       //ghost
      Char2.DibujarP2();
     }
     if(player == 3){
       //inq
      Char3.DibujarP3();
     }
     if(player == 4){
      //Snake
       Char4.DibujarP4();
     }
     if(player == 5){
       //tv
      Char5.DibujarP5();
     }
     if(player == 6){
      //witch
       Char6.DibujarP6();
     }
     String nood = "Presiona F para ver a tu oponente";
      text(nood, 10,350, 490, 400 );
      
     if (key == 'f' || key == 'F' ){
        String nood1 = "Presiona E para ver el resultado";
      text(nood1, 10,400, 490, 400 );
      if(key == 'e' || key == 'E' ){
    pantalla = 3;
  }
     if(npc == 1){
      //Space
       npc1.DibujarP1();
     }
     if(npc == 2){
       //ghost
      npc2.DibujarP2();
     }
     if(npc == 3){
       //inq
      npc3.DibujarP3();
     }
     if(npc == 4){
      //Snake
       npc4.DibujarP4();
     }
     if(npc == 5){
       //tv
      npc5.DibujarP5();
     }
     if(npc == 6){
      //witch
       npc6.DibujarP6();
     }
  }
    //if (npc==player){
      //result=tie;
    //}
    if (npc==1 || npc==2){
      if(player==3 || player==4){
      result=loose;
      }
      if(player==5 || player==6){
      result=win;
      }
      if(player==1 || player==2){
      result=tie;
      }
  }
  if (npc==3 || npc==4){
      if(player==5 || player==6){
      result=loose;
      }
      if(player==1 || player==2){
      result=win;
      }
      if(player==3 || player==4){
      result=tie;
      }
  }
  if (npc==5 || npc==6){
      if(player==1 || player==2){
      result=loose;
      }
      if(player==3 || player==4){
      result=win;
      }
      if(player==5 || player==6){
      result=tie;
      }
  }
    if(key == 'e' || key == 'E' ){
    pantalla = 3;
  }
      
      
    break;
    case 3: //resolucion
    background(255,100,20);
    println("resolucion");
    if(key == 'r' || key == 'R' ){
    pantalla = 4;
  }
    if (result==tie){
      image(tiee, 0, 0); //¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
      textSize(32);
     text("empate", width-300, height/2);
    }
    if (result==win){
      background(0,255,0);
      image(winn, 0, 0); //¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
      textSize(32);
     text("Ganaste", width-300, height/2);
    }
    if (result==loose){
      background(255,0,0);
      image(lost, 0, 0); //¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
      textSize(32);
     text("Perdiste", width-300, height/2); 
    }
    String nood3 = "Presiona R para continuar";
      text(nood3, 10,400, 490, 400 );
    break;
    case 4: //return
    background(255,0,0);
    println("return");
    String nood2 = "Presiona O para reiniciar";
      text(nood2, 10,400, 490, 400 );
    npc= int (random (1,6));
    player=0;
    if(key == 'o' || key == 'O' ){
    pantalla = 0;
  }
    break;
  }
   //-------------------------------------------------------------------------------
  //dibujar MONSTER
  //-------------------------------------------------------------------------------
  
  //Foo.Dibujar();
  
  
}
  //-------------------------------------------------------------------------------
  //CLASE MONSTER
  //-------------------------------------------------------------------------------
  class Monster {
  float px, py;
  int tamano;
  int direccion; 
  int hp;
  int dm;
  int tipo;
  int nombre;
  
  Monster(float px_, float py_, int tamano_, int direccion_,int hp_,  int dm_,int tipo_,int nombre_){
    px= px_;
    py= py_;
    tamano= tamano_;
    direccion= direccion_;
    hp=hp_;
    dm=dm_;
    tipo=tipo_;
    nombre=nombre_;
  }
  //-------------------------------------------SPACE-----------------------------------------------------
  void DibujarP1(){
 pushMatrix();
 translate(px,py);
 scale(direccion,tamano);
 image(spacei, -40, -25);
popMatrix();
 }
 
 void DibujarP2(){
 pushMatrix();
 translate(px,py);
 scale(direccion,tamano);
 image(ghosti, -40, -25);
popMatrix();
 }
 
 void DibujarP3(){
 pushMatrix();
 translate(px,py);
 scale(direccion,tamano);
 image(inqi, -40, -25);
popMatrix();
 }
 
 void DibujarP4(){
 pushMatrix();
 translate(px,py);
 scale(direccion,tamano);
 image(snakei, -40, -25);
popMatrix();
 }
 
 void DibujarP5(){
 pushMatrix();
 translate(px,py);
 scale(direccion,tamano);
 image(tvi, -40, -25);
popMatrix();
 }
 
 void DibujarP6(){
 pushMatrix();
 translate(px,py);
 scale(direccion,tamano);
 image(witchi, -40, -25);
popMatrix();
 }
    
  }
  