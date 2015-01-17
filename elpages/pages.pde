import processing.xml.*;

float gallH;
float gallS;
float gallinaH;
float gallinaS;

boolean ignoringStyles = false;
BufferedReader reader;
String line;

public void gall(float gallA, float gallB) {
  gallH = gallA;
  gallS = gallB;
}

public void gallina(float gallinaC, float gallinaD) {
  gallinaH = gallinaC;
  gallinaS = gallinaD;
}

void draw(){
  try {
    line = reader.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    line = null;
  }

}

