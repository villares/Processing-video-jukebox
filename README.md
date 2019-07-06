# Processing video jukebox

### Exemplos Java / *Java examples*

#### Final Firmata/Arduino version
https://github.com/villares/Processing-video-jukebox/tree/master/jukebox_firmata

- Botão para tocar e pausar vídeo / *Play/pause button* 
- Mude o vídeo com diferentes botões / *Change movies with different buttons*
- Potenciômetro muda velocidade do vídeo / *Pot to change movie speed*

#### Keyboard only version
https://github.com/villares/Processing-video-jukebox/tree/master/jukebox_keyboard_only

#### Single Arduino Pin
https://github.com/villares/Processing-video-jukebox/blob/master/single_arduino_pin/single_arduino_pin.pde
- Ajuste a porta serial em / *set up the right seral port*  at: `int porta = 1;`
- 4 vídeos / *4 movies* 
- Troca vídeo / *change movie*: Pin 13 HIGH (botão ligado no 5V "fechado")

### Exemplos Python Mode / *Python Mode examples*

#### Single Arduino Pin "Proof of Concept"
https://github.com/villares/Processing-video-jukebox/blob/master/single_arduino_pin_proof_py/single_arduino_pin_proof_py.pyde
- Carrega só 2 vídeos
- Toca um vídeo com o pino 13 HIGH ou o outro com o pino 13 LOW 

#### Exemplos só com o teclado (sem Arduino)
https://github.com/villares/Processing-video-jukebox/blob/master/simple_keyboard_py/simple_keyboard_py.pyde
- Carrega vídeos a partir dos nomes em uma lista
- circula pela lista com as setas
