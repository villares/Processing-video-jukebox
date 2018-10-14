// baixar no IDE biblioteca Video
import processing.video.*;
// baixar no IDE biblieca Firmata (Arduino)
import processing.serial.*;
import cc.arduino.*;

Arduino botoneira;
Movie movieTocando, m0, m1, m2, m3;
boolean jaApertado = false;

void setup() {
  size(640, 360);
  background(0);
  int porta = 1; // segunda porta
  botoneira = new Arduino(this, Arduino.list()[porta], 57600);

  // Load and play the video in a loop
  m0 = new Movie(this, "m0.mov");
  m0.loop();
  movieTocando = m0;
  m1 = new Movie(this, "m1.mov");
  m1.loop();
  m1.pause();
  m2 = new Movie(this, "m2.mov");
  m2.loop();
  m2.pause();
  m3 = new Movie(this, "m1.mov");
  m3.loop();
  m3.pause();
}


void draw() {

  boolean botaoApertado = (botoneira.digitalRead(13) == Arduino.HIGH); 

  if (botaoApertado) {
    if (!jaApertado) {
      jaApertado = true;
      if (movieTocando == m0) {
        m0.pause();
        movieTocando = m1;
        m1.play();
      } else if (movieTocando == m1) {
        m1.pause();
        movieTocando = m2;
        m2.play();
      } else  if (movieTocando == m2) {
        m2.pause();
        movieTocando = m3;
        m3.play();
      } else  if (movieTocando == m3) {
        m3.pause();
        movieTocando = m0;
        m0.play();
      }
    }
  } else {
    jaApertado = false;
  }


  image(movieTocando, 0, 0, width, height);
}

void movieEvent(Movie m) {
  m.read();
}
