//imagens
PImage logo;
//Fonte
PFont bit;
//Tempo soco p1
int tp1sc;
int tp1sb;
//Tempo soco p2
int tp2sc;
int tp2sb;
//P1
int e1xo = 100;
int e1yo = 250;
int e1xc = 125;
int e1yc = 225;
int e1xb = 125;
int e1yb = 275;
int a = -1;
int aa = 1;
//P2
int e2xo = 400;
int e2yo = 250;
int e2xc = 375;
int e2yc = 225;
int e2xb = 375;
int e2yb = 275;
int b = -1;
int bb = 1;
//Estados P1
int ep1p = 0;
int ep1sc = 1;
int ep1sb = 2;
//Estado P2
int ep2p = 0;
int ep2sc = 1;
int ep2sb = 2;
//Estado Inicial P1
int eip1 = ep1p;
//Estado Inicial P2
int eip2 = ep2p;
//Fim de Jogo
boolean FJ;
//Colisão
float d1;
float d2;
float d3;
float d4;
//Pontuação
int p1;
int p2;
//perks
int tp1;
int tp2;
int p1x;
int p1y;
int p2x = 500;
int p2y;
void setup() {
  size(500, 500);
  imageMode(CENTER);
  bit = createFont("bit.ttf", 20);
  textFont(bit);
}

void draw() {
  cenario();
  desenhaP1();
  desenhaP2();
  movimentacao();
  limitesRingue();
  socosP1();
  socosP2();
  colisaoSocos();
  pontos();
  tempo();
  perks();
}
void cenario() {
  background(107, 146, 63);
  noStroke();
  fill(200, 145, 58);
  rect(50, 115, 15, 285);
  rect(450, 115, 15, 285);
  rect(65, 100, 385, 15);
  rect(65, 400, 385, 15);
  rect(40, 90, 25, 25);
  rect(450, 90, 25, 25);
  rect(40, 400, 25, 25);
  rect(450, 400, 25, 25);
  logo = loadImage("logo.png");
  image(logo, 250, 450, 113, 20);
}
void desenhaP1() {
  fill(255);
  circle(e1xo, e1yo, 25);
  circle(e1xc, e1yc, 20);
  circle(e1xb, e1yb, 20);
}
void desenhaP2() {
  fill(0);
  circle(e2xo, e2yo, 25);
  circle(e2xc, e2yc, 20);
  circle(e2xb, e2yb, 20);
}
void movimentacao() {
  //P1
  if (FJ == false) {
    if (keyPressed) {
      if (key == 'a') {
        e1xo+=a;
        e1xc+=a;
        e1xb+=a;
      }
      if (key == 'd') {
        e1xo+=aa;
        e1xc+=aa;
        e1xb+=aa;
      }
      if (key == 'w') {
        e1yo+=a;
        e1yc+=a;
        e1yb+=a;
      }
      if (key == 's') {
        e1yo+=aa;
        e1yc+=aa;
        e1yb+=aa;
      }
      //P2
      if (key == 'j') {
        e2xo+=b;
        e2xc+=b;
        e2xb+=b;
      }
      if (key == 'l') {
        e2xo+=bb;
        e2xc+=bb;
        e2xb+=bb;
      }
      if (key == 'i') {
        e2yo+=b;
        e2yc+=b;
        e2yb+=b;
      }
      if (key == 'k') {
        e2yo+=bb;
        e2yc+=bb;
        e2yb+=bb;
      }
    }
  }
}
void limitesRingue() {
  //P1
  if (e1xo < 75) {
    e1xo = 75;
    e1xb = 100;
    e1xc = 100;
  }
  if (e1xo > 415) {
    e1xo = 415;
    e1xb = 440;
    e1xc = 440;
  }
  if (e1yo > 365) {
    e1yo = 365;
    e1yb = 390;
    e1yc = 340;
  }
  if (e1yo < 150) {
    e1yo = 150;
    e1yb = 175;
    e1yc = 125;
  }
  //P2
  if (e2xo < 100) {
    e2xo = 100;
    e2xb = 75;
    e2xc = 75;
  }
  if (e2xo > 440) {
    e2xo = 440;
    e2xb = 415;
    e2xc = 415;
  }
  if (e2yo > 365) {
    e2yo = 365;
    e2yb = 390;
    e2yc = 340;
  }
  if (e2yo < 150) {
    e2yo = 150;
    e2yb = 175;
    e2yc = 125;
  }
}
void socosP1() {
  if (FJ == false) {
    if (keyPressed) {
      if (key == ' ') {
        eip1 = ep1sc;
        e1xc = e1xo+25;
        e1xc += 25;
      }
      if (key == 'q') {
        eip1 = ep1sb;
        e1xb = e1xo+25;
        e1xb += 25;
      }
    }
    if (eip1 == ep1sc) {
      tp1sc++;
      if (tp1sc >= 11) {
        tp1sc = 0;
        e1xc -= 25;
        eip1 = ep1p;
      }
    }
    if (eip1 == ep1sb) {
      tp1sb++;
      if (tp1sb >= 11) {
        tp1sb = 0;
        e1xb -= 25;
        eip1 = ep1p;
      }
    }
  }
}
void socosP2() {
  if (FJ == false) {
    if (keyPressed) {
      if (key == 'o') {
        eip2 = ep2sc;
        e2xc = e2xo-25;
        e2xc-=25;
      }
      if (key == 'u') {
        eip2 = ep2sb;
        e2xb = e2xo-25;
        e2xb -=25;
      }
    }
    if (eip2 == ep2sc) {
      tp2sc++;
      if (tp2sc >= 11) {
        tp2sc = 0;
        e2xc+=25;
        eip2 = ep2p;
      }
    }
    if (eip2 == ep2sb) {
      tp2sb++;
      if (tp2sb >= 11) {
        tp2sb = 0;
        e2xb+=25;
        eip2 = ep2p;
      }
    }
  }
}
void colisaoSocos() {
  d1 = dist(e1xc, e1yc, e2xo, e2yo);
  d2 = dist(e2xc, e2yc, e1xo, e1yo);
  d3 = dist(e1xb, e1yb, e2xo, e2yo);
  d4 = dist(e2xb, e2yb, e1xo, e1yo);
}
void pontos() {

  if (d1 <= 22.5 && eip1 == ep1sc) {
    p1 = p1+1;
  }
  if (d2 <= 22.5 && eip2 == ep2sc) {
    p2 = p2+1;
  }
  if (d3 <= 22.5 && eip1 == ep1sb) {
    p1 = p1+1;
  }
  if (d4 <= 22.5 && eip2 == ep2sb) {
    p2 = p2+1;
  }
  fill(255);
  text(p1, 115, 50);
  fill(0);
  text(p2, 365, 50);
}

void tempo() {
  int t;
  int tempoSeg = 59;
  t = tempoSeg - int(millis()/1000);
  if (t <= 0 && p1==p2) {
    t = 0;
    text("EMPATE!", 180, 265);
    FJ = true;
  }
  if (t <= 0 && p1>p2) {
    t = 0;
    fill(255);
    text("BRANCO WINS!", 125, 265);
    FJ = true;
  }
  if (t <= 0 && p1<p2) {
    t = 0;
    fill(0);
    text("PRETO WINS!", 140, 265);
    FJ = true;
  }
  fill(0);
  text(t, 240, 90);
}
void perks() {
  float di1 = dist(p1x, p1y, e1xo, e1yo);
  float di2 = dist(p1x, p1y, e2xo, e2yo);
  float dii1 = dist(p2x, p2y, e1xo, e1yo);
  float dii2 = dist(p2x, p2y, e2xo, e2yo);
  tp1++;
  tp2++;

  //perk 1
  if (tp1 >= 300) {
    p1x++;
    p1y++;
    fill(0, 0, 255);
    ellipse(p1x, p1y, 20, 20);
    if (di1 <= 22.5) {
      a = a*2;
      aa = aa*2;
      tp1 = 0;
      p1x = 0;
      p1y = 0;
    }
    if (di2 <= 22.5) {
      b = b*2;
      bb = bb*2;
      tp1 = 0;
      p1x = 0;
      p1y = 0;
    }
  }
  //perk 2
  if (tp2 >= 600) {
    p2x--;
    p2y++;
    fill(255, 0, 0);
    ellipse(p2x, p2y, 20, 20);
    if (dii1 <= 22.5) {
      background(255, 0, 0);
      tp2 = 0;
      p2x = 500;
      p2y = 0;
    }
    if (dii2 <= 22.5) {
      background(0, 255, 0);
      tp2 = 0;
      p2x = 500;
      p2y = 0;
    }
  }
  println(tp2);
}
