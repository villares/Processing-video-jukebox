// 0 and 1 change movies, space-bar play/pause

import processing.video.*;

Movie current, v0, v1;
boolean playOn = true;
boolean alreadyDown = false;

void setup() {
  size(640, 360);
  v0 = new Movie(this, "v0.mov");
  v1 = new Movie(this, "v1.mp4");
  current = v1;
  current.loop();

}

void draw() {
  if (current.available() == true) {
    current.read();
  }
  image(current, 0, 0, width, height);

  if (keyPressed && key == ' ') { // botão apertado?
    if (alreadyDown ==  false) { // não viu apertado antes?
      // inverte o estado de tocar
      if (playOn == true) { // quando tocando verdadeiro
        playOn = false;
        current.pause();
      } else { // quando tocando falso
        playOn = true;
        current.loop();
      }
      alreadyDown = true; // avisa que já viu o botão apertado
    }
  } else { // a tecla não tá apertada
    alreadyDown = false;
  }

  if (keyPressed && key == '0') {
    current.pause();
    current = v0;
    current.loop();
  }
  if (keyPressed && key == '1') { 
    current.pause();
    current = v1;
    current.loop();
  }
}
