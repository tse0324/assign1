/* please implement your assign1 code in this file. */
PImage Ibg1,Ibg2,Ienemy,Ifighter,Ihp,Itreasure;
int bgx,hp,fx,fy,ex,ey,tx,ty;
boolean fl,fr,fu,fd,fk;

void setup () {
  size(640,480) ;  // must use this size.
  // your code
  Ibg1=loadImage("img/bg1.png");
  Ibg2=loadImage("img/bg2.png");
  Ienemy=loadImage("img/enemy.png");
  Ifighter=loadImage("img/fighter.png");
  Ihp=loadImage("img/hp.png");
  Itreasure=loadImage("img/treasure.png");
  
  bgx=0;
  hp=200;
  fx=550;
  fy=240;
  ex=-61;
  ey=240;
  tx=(int)random(0,600);
  ty=(int)random(0,440);
  fl=false;
  fr=false;
  fu=false;
  fd=false;
  fk=false;
  
  fill(255,0,0);
  textSize(48);
}

void draw() {
  // your code
  if(hp<=0){
    text("GAME OVER",200,240);
    return;
  }
  //bg
  bgx++;
  if(bgx>=640){
    bgx=0;
    PImage tmp=Ibg1;
    Ibg1=Ibg2;
    Ibg2=tmp;
  }
  image(Ibg1,bgx,0);
  image(Ibg2,bgx-640,0);
  
  //enemy
  ex+=2;
  if(ex>=640){
    ex=-61;
    ey=(int)random(0,420);
  }
  if(fx-ex<=61&&fy-ey<=61&&ex-fx<=51&&ey-fy<=51){
    hp-=50;
    if(hp<0)hp=0;
    ex=-61;
    ey=(int)random(0,420);
  }
  image(Ienemy,ex,ey);
  
  //treasure
  if(fx-tx<=41&&fy-ty<=41&&tx-fx<=51&&ty-fy<=51){
    hp+=50;
    if(hp>200)hp=200;
    tx=(int)random(0,600);
    ty=(int)random(0,440);
  }
  image(Itreasure,tx,ty);
  
  //fighter
  if(fl)fx-=3;
  if(fr)fx+=3;
  if(fu)fy-=3;
  if(fd)fy+=3;
  if(fx<0)fx=0;
  if(fx>590)fx=590;
  if(fy<0)fy=0;
  if(fy>430)fy=430;
  image(Ifighter,fx,fy);
  
  //hp
  rect(15,11,hp,20);
  image(Ihp,10,10);
  
  //text
  if(!fk)text("use arrow key to move.",50,240);
}

void keyPressed(){
  fk=true;
  if(key==CODED){
    if(keyCode==UP){
      fu=true;
      fd=false;
    }
    if(keyCode==DOWN){
      fd=true;
      fu=false;
    }
    if(keyCode==LEFT){
      fl=true;
      fr=false;
    }
    if(keyCode==RIGHT){
      fr=true;
      fl=false;
    }
  }
}
void keyReleased(){
  if(key==CODED){
    if(keyCode==UP)fu=false;
    if(keyCode==DOWN)fd=false;
    if(keyCode==LEFT)fl=false;
    if(keyCode==RIGHT)fr=false;
  }
}
