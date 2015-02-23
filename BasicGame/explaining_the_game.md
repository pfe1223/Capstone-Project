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
This part of the program updates the state, the player, and the bad guy.

	update : Input -> Game -> Game
	update {space,dir1,dir2,delta} ({state,badGuy,player1} as game) =
  		let lives = if (badGuy `within` player1) then 1 else 0

      		newState =
        		if  | space              -> Play
            	   	| player1.lives == 0 -> Pause
            		| otherwise          -> state

      		newBadGuy =
        		if state == Pause
            		then badGuy
            		else updateBadGuy delta badGuy player1

  		in
      		{ game |
          	state   <- newState,
          	badGuy  <- newBadGuy,
         	player1 <- updatePlayer delta dir1 dir2 lives player1
      		}
To better understand this portion of the code, it is better to start at the bottom. For the data type game, we see that the state characteristic takes the value of the function called newState, the characteristic badGuy takes the value of the function newBadGuy, and the player1 characteristic takes the value of the function updatePlayer. The functions newState and newBadGuy are defined above. The function updatePlayer is a separate function outside of the update function. 

When updating the state of the game, the program checks to see if the space bar is pressed. If yes, then the state changes to Play (by default, the state is Pause when the game starts). If the number of lives for the player (represented by player1.lives) is zero, then the state is changed to Pause. In all other cases, the state remains the same.

To update the bad guy, the function newBadGuy is invoked. This checks to see if the state of the game is Pause. If yes, then the badGuy function is called. This places the bad guy in the center of the playing area. If the state of the game is Play, then the program calls the function updateBadGuy (like updatePlayer, this function is defined below). This function takes the arguments delta (the time), the characteristics of the current badGuy, and the characteristics of the current player1.

	updateBadGuy : Time -> BadGuy -> Player -> BadGuy
	updateBadGuy t ({x,y,vx,vy} as badGuy) ({x,y,vx,vy,lives} as 	player1) =
  		 if | (player1.lives == 0) -> { badGuy | x <- 0, y <- 0}
   			| (badGuy `within` player1) -> physicsUpdate t
          		{ badGuy |
            	  vx <- stepV vx (badGuy `within` player1) (badGuy `within` player1),
            	vy <- stepV vy (badGuy `within` player1) (badGuy `within` player1)
          		}
     		| otherwise -> physicsUpdate t
          		{ badGuy |
              	  vx <- stepV vx (x < 20-halfWidth) (x > halfWidth-20),
              	  vy <- stepV vy (y < 20-halfHeight) (y > halfHeight-20)
          		}
When updating the bad guy in the game, the function updateBadGuy needs the time, the characteristics of the bad guy, and the characteristics of the player. If the lives of the player are zero, then the badGuy is given the x and y coordinates of zero. If this is not true, then the program calls the function within and passes it the badGuy and player1. The function within will be discussed below. Basically it checks to see if the badGuy is touching player1. If they are touching, then the function physicsUpdate (defined below) is called. However, the badGuy should bounce off of player1. To do this, we need to pause and take a look at some other functions.

	near k c n =
    	n >= k-c && n <= k+c

	within badGuy player1 =
    	near player1.x 25 badGuy.x && near player1.y 25 badGuy.y

	stepV v lowerCollision upperCollision =
  		if  | lowerCollision -> abs v
     		| upperCollision -> 0 - abs v
     		| otherwise      -> v
The three functions make up the logic behind bouncing the badGuy off of player1 or the sides of the playing area. This section of the code is highly compartmentalized. That is, the function within could easily calculate the function near, but everything is kept separate. This is a characteristic of functional programming. Everything should be its own function. This allows you to more easily debug the code, and it also allows you to easily reuse code in other projects. The downside to this is that following the code becomes a little harder, as you are bouncing around different functions.

Let's start with the within function. It wants to know if the badGuy and player1 are touching. To do this, it uses the function near, and passes the function the x position of player1, the x position of badGuy, and the number 25. The number 25 happens to be the length of each of the sides of the badGuy. The function near returns either true or false depending on if badGuy is touching player1.

The function stepV determines if badGuy needs to bounce. Take a look closely at the following code.

	physicsUpdate t
          { badGuy |
            vx <- stepV vx (badGuy.vx < 0) (badGuy.vx > 0),
            vy <- stepV vy (badGuy.vy < 0) (badGuy.vy > 0)
          }
This snippet is calling the function physicsUpdate (this is what actually makes the objects move, and will be discussed in a bit). The function physicsUpdate takes the characteristics of badGuy, *but* the vx and vy characteristics are determined by the stepV function which also wants to know if badGuy is touching player1 (this is pretty complicated). So stepV wants to know if the vx and vy of badGuy are greater than or less than zero. 

	stepV v condition1 condition2 =
  		if  | condition1 -> abs v
     		| condition2 -> 0 - abs v
     		| otherwise  -> v
    
The characteristics vx and vy are the directions in which badGuy is moving in the x and y directions. When a collision happens, the program checks to see if vx is negative (condition1 for stepV) or if vx is positive (condition2 for stepV). If vx is positive then it becomes negative, it is negative then it becomes positive, and in all other cases it does not change. The program does the same thing for vy of badGuy.

Now contrast the above code with the following code:

	physicsUpdate t
          { badGuy |
              vx <- stepV vx (x < 25-halfWidth) (x > halfWidth-25),
              vy <- stepV vy (y < 25-halfHeight) (y > halfHeight-25)
          }
Again we are moving badGuy with the function physicsUpdate. Only this time we are not interested if badGuy should bounce off of player1; instead we want to know if it should bounce off the edges of the playing area. The program checks to see if badGuy is touching the left side (x < 25-halfwidth), touching the right side (x > halfwidth-25), touching the bottom (y < halfHeight), or touching the top (y > halfHeight-25). Again, 25 is used because that is the radius of badGuy.

	physicsUpdate t ({x,y,vx,vy} as obj) =
  		{ obj |
      	  x <- x + vx * t,
      	  y <- y + vy * t
  		}
The function physicsUpdate does the actual moving of badGuy and player1. In either case, the x and y positions are set to the value of the velocity multiplied by time added to the current value.
###[View Section](id:viewSection)
The view section outputs the game to the screen. In Elm, the basic visual building block are elements. Elements are rectangles with a fixed width and heigth. You can put all sorts of things in elements, and you can stack elements next to (above, below, to the right, to the left) other elements. Elm also has something forms. Forms are arbitrary shapes. They can be rotated, scaled, and modified in other ways. If you want to have a collection of forms (like this game here) then you use a special kind of element called a collage, which is a collection of forms. The code below also uses something called a container, which holds an element. Containers can easily be positioned in the window.

	view : (Int,Int) -> Game -> Element
	view (w,h) {state,badGuy,player1} =
  		let lives : Element
      		lives = txt(Text.height 50) (toString player1.lives)
  		in
     		container w h middle <|
      		collage gameWidth gameHeight
        		[ rect gameWidth gameHeight
            		|> filled backgroundColor
        		, ngon 6 25 -- This is badGuy
            		|> filled lightOrange
           			|> move(badGuy.x, badGuy.y)
        		, circle 20 -- This is player1
            		|> filled lightPurple
            		|> move (player1.x, player1.y)
        		, toForm lives
            		|> move (0, gameHeight/2 - 40)
        		, toForm (if state == Play then spacer 1 1 else txt identity msg)
            		|> move (0, 40 - gameHeight/2)
        		]
The view function creates a container that resides in the middle of the window. The container holds a collage with the width of gameWidth (600) and a height of gameHeight (400). The collage has the following shapes. There is a rectangle of the same width and heidth as the collage. The rectangle is filled with a color called backgroundColor (this will be explained below). There is a polygon with six sides and a radius of twenty-five. This polygon is filled with the color lightOrange, and is placed at the x,y coordinates of badGuy. There is a circle with radius twenty. The circle is filled with the color lightPurple and is placed at the x,y coordinates of player1. In this container, there is an element called lives. Lives is text with the size fifty, and has the value of the number found in player1.lives. Since a collage can only have forms and not elements, the lives element is transformed into a form. The form is moved to the location (0, gameHeight/2 - 40). This location can also be read as (0,160). Lastly, there is an if-then-else statement that shows or hides text on the bottom of the screen. If the state is Play, then a spacer (a blank box) is placed at the bottom of the game area. If the state is not Play, then the text in msg is placed at the bottom of the game area. 

	backgroundColor = rgb 178 8 1
	textColor = white
	txt f = Text.fromString >> Text.color textColor >> Text.monospace >> f >> Text.leftAligned
	msg = "SPACE to start, &larr;&uarr;&darr;&rarr; to move"
This last little bit of code finishes up the game. The first line defines the color backgroundColor interms of red, green, and blue because backgroundColor is not predefined. The next color, textColor, is defined not in terms of red, green, and blue because white is predefined. The function txt provides several characteristics (color, font, alignment, etc.) of how text will be rendered. Finally, msg is a string that is the message which appears on the screen. "&larr" means left arrow, etc.