
from __future__ import unicode_literals
from option_pane import option_pane

add_library('video')
add_library('serial')  # import processing.serial.*;
add_library('arduino')  # import cc.arduino.*;

port_list = [str(num) + ": " + porta_serial for num, porta_serial
             in enumerate(Arduino.list())]

def setup():
    global arduino, m0, m1
    size(470, 280)
    selection = option_pane("Is your Arduino board connected?",
                            "Select the USB port:",
                            port_list,
                            -1)

    if selection is not None:
        arduino = Arduino(this, Arduino.list()[selection], 57600)
    else:
        exit()
        
    m0 = Movie(this, "m0.mov")
    m0.loop()
    m1 = Movie(this, "m1.mov")
    m1.loop()

def draw():
    background(200)
    textAlign(CENTER)
    if arduino.digitalRead(13) == Arduino.HIGH:
        m0.play()
        m1.pause()
        movie = m0
    else:
        m0.pause()
        m1.play()
        movie = m1       
 
    image(movie, 0,0,width,height)
        
        
def movieEvent(m):
  m.read()
