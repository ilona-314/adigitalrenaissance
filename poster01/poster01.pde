float ry=0;
float rx=0;
float ix=0;

//txt
PFont mono;
String txt = "A Digital Renaissance";
color fg = #f1f1f1;
color bg = #000000;
float fontSize = 200;


void setup(){
  //smooth(2);
  size(540, 960);
  pixelDensity(displayDensity());
  rectMode(CENTER);
  //frameRate(4);
  mono = createFont("Caveat-VariableFont_wght.ttf", 400, true);
}

void arm(float tx, float ty, float a, int mirror){
  
  
  pushMatrix();
  translate(tx,ty);
  rotate(radians(a));
  translate(-tx,-ty);
  stroke(71,51,27);
  strokeWeight(10);
  //arm dik
    
  line(tx, ty, tx-(60 * mirror), 370);
  //hand
  fill(71,51,27);
  ellipse(tx-(125 * mirror), ty, 15, 15);
  //arm dun
  strokeWeight(1);
  line(tx-(120 * mirror), ty, tx-(50 * mirror), ty);
  popMatrix();
}

void leg(float ab,float cd,float a){
  //println(a);
  pushMatrix();
  translate(ab,cd);
  rotate(radians(a));
  
  translate(-ab,-cd);
  strokeWeight(10);
  //been dik
  line(ab, cd, ab, 540);
  strokeWeight(1);
  //been dun
  line(ab, 640, ab, 540);
  //voet
  fill(71,51,27);
  rect(ab, 638, 40, 10);
  //fill(255,0,0);
  //ellipse(ab,cd,50,50);
  popMatrix();
}

void txt() {
  
  int num = int(map(mouseX,0,width,0,txt.length()));
  char c = txt.charAt(num);
  
  textFont(mono);
  textAlign(CENTER,CENTER);
  textSize(fontSize);
  push();
  translate(width/2,100 - (fontSize *0.15));
  text(c,0,0); 
  pop();
  
  push();
  //rect(mouseX,0,5,height);
  pop();
}

void draw(){
  background(255,248,220);
  float wave = 10*sin(frameCount/10.0);
  float wave4 = -30*cos(frameCount/10.0);
  float wave5 = 50*sin(frameCount/30.0);
  float wave3 = -20*sin(frameCount/20.0);
  float wave2 = 20*cos(frameCount/10.0);
  arm(200,370,wave5, 1);
  arm(300,370,wave, -1);
  
  // 1 been (links) met een positieve marge
  leg(220,470,wave2+20);
  // 1 been (rechts) met een negatieve marge
  leg(280,470,wave3-20);
  
  arm(200,370,wave4, 1);
  arm(300,370,wave5, -1);
  leg(220,470,mouseY);
  leg(280,470,mouseX);
  
  fill(204, 102, 0);
  txt();
  
  strokeWeight(5);
  //schouders
  line(200, 370, 300, 370);
  //romp
  line(250, 320, 250, 470);
  //heupen
  line(220, 470, 280, 470);
  
   fill(71,51,27);
  //hoofd
  ellipse(250, 320, 50, 50);
 
  strokeWeight(1);
  noFill();
  //rechthoek en cirkel
  //ry=height/2-mouseY; intera
  //rechthoek beweegt hieronder
  ry=200*sin(frameCount/30.0);
  //rx=width/2-mouseX;
  rect(width/2+rx, height/2+ry, 370, 400);
  //cirkel beweegt hieronder
  ix=100*cos(frameCount/15.0);
  ellipse(width/2+ix, height/2, 400, 400);
  
}
