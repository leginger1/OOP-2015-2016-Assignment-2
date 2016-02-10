# OOP-2015-2016-Assignment-2

##Initial Thoughts
The game is to be a relativly simple game incorperating everything we have learned in the first semester.
Some of the examples given that could be used are:
- Space Invaders
- Astroids
- Breakout
- Space War
- Tower Defence

For this assignmnet, since we have till the first week in Febuary, I want to push myself a little bit.

My initial idea is to make a simple town building game. Like a simple version of Banished or similar games.
The basic functionatly I hope to have for the game is, a randomly generated map, a randomly placed town center
(that will act as a stockpile, and generate more workers), to have multiple resources and to be able to assign
people to gather them, to have some basic buildings that give bonus's(house to increase pop, mill to increase
food prod, etc).

If I can get these features implemented to a satisfactory level, I will consider adding more features.

##Update 1
So far I have made it so that a map can be generated at random and saved to a file.
The map can be loaded from said file and displayed on screen.
A tilesheet is used to get images for the different tiles. The tilesheet is one file and each of the tiles is
taken from that file.

##Update 2
During the week or two break over christmas I was re-thinking the game that im going to make. I have decided to 
move away from the town building game idea a bit and go with a tower defence instead. However I am not completely
forgetting about the town builder. I hope to try and bring some aspects of town building as a way of upgrading the
towers and such. 

##Update 3
Since the laste update many things have been taken out of the game. It is very bare bones tower defence. The towers
can track and shoot enemys. Enemys will follow a selected path and damage the base tower if they reach it. TRhe map
and paths are loaded in from a map file. There are button and text area classes for menus. There are different game
states that allow differnt menus to be swaped between and such aswell as pausing the game. Each of the menus and main
game has its own array list so that you can stop updating one while in another menu. Aswell as other things...

![MainMenu] (/images/mainMenu.png)
![MainGame] (/images/mainGame.png)
![PauseMenu] (/images/pauseMenu.png)
![EndScreen] (/images/endScreen.png)