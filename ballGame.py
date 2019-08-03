import numpy as np
import cv2
from directKeys import click, queryMousePosition
import time
from PIL import ImageGrab

gameCoords = [0, 25, 500, 525]
exitGame = 0

def shootSomeBalls(screen):
    global gameCoords, exitGame
    
    state = 1

    for y in range(gameCoords[1], gameCoords[3] - 25, 5):
        for x in range(gameCoords[0], gameCoords[2], 5):
            if(screen[y][x][0] == 255) and (screen[y][x][1] == 0):
                click(x + 1, y + 26)
                print("Clicked!")
                state = 0
                break

        if(not state):
            break

        if(y > gameCoords[3] - 31):
            exitGame = 1

print("Alright, let's move out!")

while True:
    mousePos = queryMousePosition()
    if mousePos.x <= 500:
        break

print("GO, GO, GO!")

time.sleep(2)

while True:
    mousePos = queryMousePosition()
    if((gameCoords[0] < mousePos.x < gameCoords[2]) and (gameCoords[1] < mousePos.y < gameCoords[3])):
        screen = np.array(ImageGrab.grab(bbox = gameCoords))
        shootSomeBalls(screen)

    if exitGame:
        print("I'm done!")
        break
