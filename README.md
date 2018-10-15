# Processing video jukebox

### Exemplos Java

#### Single Arduino Pin
https://github.com/villares/Processing-video-jukebox/blob/master/single_arduino_pin/single_arduino_pin.pde
- Precisa checar qual o número da porta USB certa e trocar em `int porta = 1;`
- Carrega 4 vídeos
- Se o pino 13 do Arduino for HIGH (botão ligado no 5V "fechado"), troca o vídeo

### Exemplos Python

#### Single Arduino Pin "Proof of Concept"
https://github.com/villares/Processing-video-jukebox/blob/master/single_arduino_pin_proof_py/single_arduino_pin_proof_py.pyde
- Carrega só 2 vídeos
- Toca um vídeo com o pino 13 HIGH ou o outro com o pino 13 LOW 

#### Exemplos só com o teclado (sem Arduino)
https://github.com/villares/Processing-video-jukebox/blob/master/simple_keyboard_py/simple_keyboard_py.pyde
- Carrega vídeos a partir dos nomes em uma lista
- circula pela lista com as setas
