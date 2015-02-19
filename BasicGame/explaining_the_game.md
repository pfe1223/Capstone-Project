#Explaining The Game

This document is an explanation of how it is that I came to make the game in Elm. The game is based on the [Pong example](http://elm-lang.org/edit/examples/Intermediate/Pong.elm) from the [Elm website](http://www.elm-lang.org). I will take a look at the different sections to this program, which is the basic structure for any Elm program. 

*	[Import Section](#importSection)
*	[Signal Section](#signalSection)
*	[Model Section](#modelSection)
*	[Update Section](#updateSection)
*	[View Section](#viewSection)

###[Import Section](id:importSection)
As this game is based on the Pong example, the imported modules are the same. Here is the list of imported modules.

	import Color (..)
	import Graphics.Collage (..)
	import Graphics.Element (..)
	import Keyboard
	import Signal
	import Text
	import Time (..)
	import Window
Any time you see (..) with a module import, this means you are importing the entirty of the module.
###[Signal Section](id:signaltSection)
In Elm, signals are the input from the user to the computer. Examples are click, keys pressed, time, and the x and y positions of the mouse.

	main =
		Signal.map2 view Window.dimensions gameState
Each Elm program has a main. I think of main as the bit of code that executes your program. In this game main is a signal. It is mapping (applying a function to the current value of a signal) the view function. The view function takes two arguments, the dimensions of the window and another function called gameState.

	gameState : Signal Game
	gameState =
		Signal.foldp update defaultGame input
The signal gameState is of type Game, which will be discussed in the Model Section. Foldp makes a past-dependent signal. Each time the program updates, the new signals are the current state. Foldp remembers all of the past states as well.

	delta =
		Signal.map inSeconds (fps 35)
Delta is a time signal in seconds. The program has a framerate of thirty-five frames per second.

	input : Signal Input
	input =
		Signal.sampleOn delta <|
			Signal.map4 Input
				Keyboard.space
				(Signal.map .x Keyboard.arrows)
				(Signal.may .y Keyboard.arrows)
				delta
The input signal is of type Input (more on that in the Model Section). The sampleOn command means that the program will record if the space bar is pressed, if the up or down arrows are pressed, if the left or right arrows are pressed, and the time. All of the items being recorded by this signal are all parts of the data type called Input.
###[Model Section](id:modeltSection)
The Model Section of the program sets up all of the special data types needed for the program.

	(gameWidth,gameHeight) = (600,400)
	(halfWidth,halfHeight) = (300,200)
This code creates two tuples that set gameWidth to 600, gameHeight to 400 and halfWidth to 300, halfWidth to 200.

	type State = Play | Pause
The type State has the value of either Play or Pause.

	type alias BadGuy =
		{ x:Float, y:Float, vx:Float, vy:Float }
The data type BadGuy has four characteristics: x position, y position, velocity in the x direction, and velocity in the y direction. All of these characteristics are of type float, which means that they can be numbers with a decimal. Any time I create an instance of the data type BadGuy, I can interact with these four characteristics.

	type alias Player =
		{ x:Float, y:Float, vx:Float, vy:Float, lives:Int }
Much like the data type BadGuy, Player has several distinct characteristics. Player, however, has a fifth characteristic, lives. Lives is an integer.

	type alias Game =
		{ state:State, badGuy:BadGuy, player1:Player }
The data type Game has all of the characteristics of the game to be played. There is a bad guy, a good guy, and a state. The badGuy and player1 are of the special data types created just for this game. The game's state is of the signal State, which tells us if the game is being played or paused.

	defaultGame : Game
	defaultGame =
		{ state = Pause
		, badGuy = { x = 0, y = 0, vx = 300, vy = 300
		, player1 = { x = 15-halfWidth, y = 0, vx = 0, vy = 0, lives = 3)
		}
The code is creating a data type called defaultGame. This differs from the data type Game, as defaultGame has very specific characteristics for the state, badGuy, and player1. The state is set to pause, the badGuy has x and y postions of zero and x and y velocities of 300, and player1 has an x position of 15 - halfWidth (or 15 - 300, which is -285), the y position, x and y volocities are zero, and lives is set to three. The characteristics of defaultGame are on separate lines so that it is easier to read.

	type alias Input =
		{ space : Bool
		, dir1 : Int
		, dir2 : Int
		, delta : Time
		}
This code creates a data type called Input. It has four characteristics. Space is boolean (true or false), and it tells us if the space bar is being pressed. Dir1 has a value of -1 if the left arrow is pressed, or a value of 1 if the right arrow is pressed. Dir2 has a value of -1 if the down arrow is pressed, or a value of 1 if the up arrow is pressed.
###[Update Section](id:updateSection)

###[View Section](id:viewSection)