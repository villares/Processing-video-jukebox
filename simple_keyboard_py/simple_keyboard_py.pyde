from __future__ import unicode_literals

add_library('video')

files = ["m0.mov",  # 0 
          "m1.mov", # 1 
          "m2.mov", # 2
          ]
movies = []
current, index = None, None

def setup():
    global current
    size(470, 280)
    
    for f in files:
        m = Movie(this, f)
        m.loop()
        movies.append(m)

def draw():
    if current:
        image(current, 0,0,width,height)
    else:
        background(200)
        
def keyPressed():
    global current, index
    if index is not None:
        if keyCode == RIGHT:  # Anterior
            current.stop()
            index = (index + 1) % len(movies)   
            current = movies[index]
            current.play()
        elif keyCode == LEFT:  # Seguinte
            current.stop()
            index = (index - 1) % len(movies)   
            current = movies[index]
            current.play()
        elif key == "0":
            current.stop()
            index = 0
            current = movies[index]
            current.play()
        elif key == "1":
            current.stop()
            index = 1
            current = movies[index]
            current.play()
        elif key == "2":
            current.stop()
            index = 2
            current = movies[index]
            current.play()    
    else:
            index = 0
            current = movies[0]
            current.play()
        
            
def movieEvent(m):
  m.read()
