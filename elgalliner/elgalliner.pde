import oscP5.*;
import netP5.*;

float gallH;
float gallS;
float gallinaH;
float gallinaS;

OscP5 oscP5;
NetAddress myRemoteLocation;
PrintWriter output;


// CARREGUEM LES LLIBRERIES
import processing.xml.*;
import geomerative.*;

// VARIABLES PER LA 1A IMATGE (SUPERIOR)
RShape umna1;
RPoint[][] pointPaths;

// VARIABLES PER LA 2A IMATGE (SUPERIOR)
RShape umna2;
RPoint[][] pointPaths2;

// …
boolean ignoringStyles = false;
BufferedReader reader;
String line;


void setup(){

  // ...................· CANVAS SETUP ·................... //
  reader = createReader("resultats.txt");    
  frameRate(24);
  size ( 800, 600 );
  colorMode(HSB, 30, 100, 100, 100);
  //  smooth();
  noStroke();



  // ...................· OSC SETUP ·................... //

  //  7771 és el Port UDP que volem escoltar PD envia al 7771 (es pot canviar, si es canvia a PD també)  
  oscP5 = new OscP5(this,7771);

  // "/gall" és el nom del SERVIDOR PD Gall
  // "/gallina" és el nom del SERVIDOR PD Gallina
  oscP5.plug(this,"gall","/gall");
  oscP5.plug(this,"gallina","/gallina");


  // ...................· SVG SETUP ·................... //

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  RG.ignoreStyles(ignoringStyles);
  /*RG.setPolygonizer(RG.ADAPTATIVE);*/

  // CARREGUEM LA IMATGE SUPERIOR
  // umna.centerIn(g, 100, RELACIONAT AMB MIDA (0 ÉS LA ORIGINAL), RELACIONAT AMB POSICIÓ)
  umna1 = RG.loadShape("logo1.svg");
  umna1.centerIn(g, 100, 0.200, 1);

  // PASSEM L'SVG A PUNTS
  pointPaths = umna1.getPointsInPaths();

  // CARREGUEM LA IMATGE INFERIOR
  // ELS SVG NO SÓN PROPORCIONALS, LA MIDA S'HA D'AJUSTAR MANUALMENT
  umna2 = RG.loadShape("logo2.svg");
  umna2.centerIn(g, 100, 0.5, 1);

  // PASSEM L'SVG A PUNTS
  pointPaths2 = umna2.getPointsInPaths();

}



public void gall(float gallA, float gallB) {
  gallH = gallA;
  gallS = gallB;
}

public void gallina(float gallinaC, float gallinaD) {
  gallinaH = gallinaC;
  gallinaS = gallinaD;
}

// "gallH" i "gallS" són les dues variables SERVIDOR PD Gall apunt per treballar-hi.
// "gallinaH" i "gallinaS" són les dues variables SERVIDOR PD Gallina apunt per treballar-hi.



void draw(){
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }


  if (line == null) {
    // Nothing left in the file, stop reading.
    noLoop();  
  } 
  else {
    String[] pieces = split(line, TAB);
    float gallH = int(pieces[0]);
    float gallS = int(pieces[1]);
    float gallinalH = int(pieces[2]);
    float gallinaS = int(pieces[3]);

    // CENTREM-HO TOT
    translate(width/2, height/2);

    // A DIBUIXAR I A PINTAR!

    // IMATGE SUPERIOR
    // COLOR
    fill(gallH, gallS, 40, 100);
    // DIBUIX
    for(int i = 0; i<pointPaths.length; i++){
      beginShape();
      for(int j = 0; j<pointPaths[i].length; j++){
        vertex(pointPaths[i][j].x, pointPaths[i][j].y);
      }
      endShape();
    }

    // ACABEM D'ENCAIXAR LES FORMES
    translate(0, 23);

    // IMATGE INFERIOR
    // COLOR
    fill(gallinaH, gallinaS, 100, 100);
    // DIBUIX
    for(int k = 0; k<pointPaths2.length; k++){
      beginShape();
      for(int l = 0; l<pointPaths2[k].length; l++){
        vertex(pointPaths2[k][l].x, pointPaths2[k][l].y);
      }
      endShape();
    }

    {








    }






  }
}





//  169.254.114.210







