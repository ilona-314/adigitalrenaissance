PImage hoofd, arm1, arm2, romp, haar, been1, been2, schelp;
float tx=100, ty=100;
int aantal=10, newPosX, newPosY;
JSONArray values;

PFont font;
PGraphics pg;
  
void setup(){
  size(540, 960, P2D);
  
  font = createFont("Caveat-VariableFont_wght.ttf", 600);
  pg = createGraphics(900, 900, P2D);
  
  schelp = loadImage("08_schelp.png");
  been2 = loadImage("07_been2.png");
  been1 = loadImage("06_been1.png");
  haar = loadImage("05_haar.png");
  romp = loadImage("04_romp.png");
  arm2 = loadImage("03_arm2.png");
  arm1 = loadImage("02_arm1.png");
  hoofd = loadImage("01_hoofd.png");
  
  values = new JSONArray();
  
  JSONObject hoofdProperties = new JSONObject();
  hoofdProperties.setInt("x", 526 / 2);
  hoofdProperties.setInt("y", 384 / 2);
  hoofdProperties.setInt("width", 106 / 2);
  hoofdProperties.setInt("height", 177 / 2);
  
  JSONObject arm1Properties = new JSONObject();
  arm1Properties.setInt("x", 487 / 2);
  arm1Properties.setInt("y", 547 / 2);
  arm1Properties.setInt("width", 196 / 2);
  arm1Properties.setInt("height", 265 / 2);
  
  JSONObject arm2Properties = new JSONObject();
  arm2Properties.setInt("x", 629 / 2);
  arm2Properties.setInt("y", 547 / 2);
  arm2Properties.setInt("width", 147 / 2);
  arm2Properties.setInt("height", 419 / 2);
  
  JSONObject rompProperties = new JSONObject();
  rompProperties.setInt("x", 538 / 2);
  rompProperties.setInt("y", 540 / 2);
  rompProperties.setInt("width", 151 / 2);
  rompProperties.setInt("height", 237 / 2);
  
  JSONObject haarProperties = new JSONObject();
  haarProperties.setInt("x", 497 / 2);
  haarProperties.setInt("y", 333 / 2);
  haarProperties.setInt("width", 374 / 2);
  haarProperties.setInt("height", 741 / 2);
  
  JSONObject been1Properties = new JSONObject();
  been1Properties.setInt("x", 459 / 2);
  been1Properties.setInt("y", 773 / 2);
  been1Properties.setInt("width", 206 / 2);
  been1Properties.setInt("height", 622 / 2);
  
  JSONObject been2Properties = new JSONObject();
  been2Properties.setInt("x", 571 / 2);
  been2Properties.setInt("y", 732 / 2);
  been2Properties.setInt("width", 168 / 2);
  been2Properties.setInt("height", 676 / 2);
  
  JSONObject schelpProperties = new JSONObject();
  schelpProperties.setInt("x", 204 / 2);
  schelpProperties.setInt("y", 993 / 2);
  schelpProperties.setInt("width", 671 / 2);
  schelpProperties.setInt("height", 521 / 2);
  
  values.setJSONObject(0, hoofdProperties);
  values.setJSONObject(1, arm1Properties);
  values.setJSONObject(2, arm2Properties);
  values.setJSONObject(3, rompProperties);
  values.setJSONObject(4, haarProperties);
  values.setJSONObject(5, been1Properties);
  values.setJSONObject(6, been2Properties);
  values.setJSONObject(7, schelpProperties);
  
}


 
void draw() {
 
  background(144, 191, 163);
  
  // PGraphics 

  pg.beginDraw();
  pg.background(144, 191, 163);
  pg.fill(191,69,69);
  pg.textFont(font);
  pg.textSize(100);
  pg.pushMatrix();
  pg.translate(width/2, height/2-400);
  pg.textAlign(CENTER, CENTER);
  pg.text("A Digital", 0, 0);
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2, height/2+350);
  pg.text("Renaissance", 0, 0);
  pg.popMatrix();
  pg.endDraw();
  
  int tilesX = 10;
  int tilesY = 10;

  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);

  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {

      // WARP
      int wave = int(sin(frameCount /25.0 + ( x * y ) * 0.07) * 100);

      // SOURCE
      int sx = x*tileW + wave;
      int sy = y*tileH;
      int sw = tileW;
      int sh = tileH;


      // DESTINATION
      int dx = x*tileW;
      int dy = y*tileH;
      int dw = tileW;
      int dh = tileH;
      
      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
      
    }
  }
  
  
  newPosX = width / 2;
  //println(newPosX);
  newPosY = height / 2;
  //println(newPosY);
  
  newPosX -= tx;
  //println(newPosX);
  newPosY -= ty;
  println(newPosY);
  
        image(schelp, values.getJSONObject(7).getInt("x") + newPosY, values.getJSONObject(7).getInt("y") + newPosX, values.getJSONObject(7).getInt("width"), values.getJSONObject(7).getInt("height"));
        image(been2, values.getJSONObject(6).getInt("x") + newPosX / 4, values.getJSONObject(6).getInt("y") - newPosY / 4, values.getJSONObject(6).getInt("width"), values.getJSONObject(6).getInt("height"));
        image(been1, values.getJSONObject(5).getInt("x") + newPosY / 2, values.getJSONObject(5).getInt("y") + newPosX / 4, values.getJSONObject(5).getInt("width"), values.getJSONObject(5).getInt("height"));
        image(haar, values.getJSONObject(4).getInt("x") - newPosX / 3, values.getJSONObject(4).getInt("y") - newPosY / 2, values.getJSONObject(4).getInt("width"), values.getJSONObject(4).getInt("height"));
        image(romp, values.getJSONObject(3).getInt("x") + newPosY / 3, values.getJSONObject(3).getInt("y") + newPosX / 2, values.getJSONObject(3).getInt("width"), values.getJSONObject(3).getInt("height"));
        image(arm2, values.getJSONObject(2).getInt("x") + newPosX / 2, values.getJSONObject(2).getInt("y") + newPosY / 2, values.getJSONObject(2).getInt("width"), values.getJSONObject(2).getInt("height"));
        image(arm1, values.getJSONObject(1).getInt("x") - newPosX / 2, values.getJSONObject(1).getInt("y") - newPosY / 4, values.getJSONObject(1).getInt("width"), values.getJSONObject(1).getInt("height"));
        image(hoofd, values.getJSONObject(0).getInt("x") + newPosX / 2, values.getJSONObject(0).getInt("y") + newPosY / 4, values.getJSONObject(0).getInt("width"), values.getJSONObject(0).getInt("height"));
       
}
 
void mouseMoved() {
  tx = mouseX;
  ty = mouseY;
  //println(tx);
  
}
