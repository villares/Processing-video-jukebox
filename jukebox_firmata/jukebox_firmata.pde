import processing.serial.*;
import cc.arduino.*;
import org.firmata.*;
import processing.video.*;

Arduino arduino;

Movie current, v0, v1;
boolean playOn = true;
boolean alreadyPressed = false;

void setup() {
  size(640, 360);
  v0 = new Movie(this, "v0.mov");
  v1 = new Movie(this, "v1.mp4");
  current = v1;
  current.loop();
  println(Arduino.list()); // read on the console ports
  int porta = 1; // change port here!
  arduino = new Arduino(this, Arduino.list()[porta], 57600);

}

void draw() {
  boolean d9 = (arduino.digitalRead(9) == Arduino.HIGH);
  boolean d8 = (arduino.digitalRead(8) == Arduino.HIGH);
  boolean d7 = (arduino.digitalRead(7) == Arduino.HIGH);
  boolean d6 = (arduino.digitalRead(6) == Arduino.HIGH);
  
  if (current.available() == true) {
    current.read();
  }
  image(current, 0, 0, width, height);
  if (d9 || (keyPressed && key == ' ')) { // botão apertado?
    if (alreadyPressed ==  false) { // não viu apertado antes?
      // inverte o estado de tocar
      if (playOn == true) { // quando tocando verdadeiro
        playOn = false;
        current.pause();
      } else { // quando tocando falso
        playOn = true;
        current.loop();
      }
      alreadyPressed = true; // avisa que já viu o botão apertado
    }
  } else { // a tecla não tá apertada
    alreadyPressed = false;
  }

  if (d8 || (keyPressed && key == '0')) {
    current.pause();
    current = v0;
    current.loop();
  }
  if (d7 || (keyPressed && key == '1')) { 
    current.pause();
    current = v1;
    current.loop();
  }

  
  int a0 = arduino.analogRead(0);
  float v = map(a0, 0, 1023, -3, 3); 
  current.speed(v);
  println("speed: ", v);
  // hack around reverse loop issue
  float d = current.duration() - .1;
  float t = current.time();
  println("(d) duration: ", d, " (t) time: ", t);
  if (t < 0.1 && v < 0){
    current.speed(1);
    current.jump(d);
    current.speed(v);
  }
      println(current.available());

}
