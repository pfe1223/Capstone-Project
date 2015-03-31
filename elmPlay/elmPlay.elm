import Signal (Signal, map3, foldp, subscribe, channel, Channel, send)
import Signal
import Color (..)
import Graphics.Element (..)
import Graphics.Input (hoverable, button)
import Text
import Window
import Mouse
import String (padLeft)
import Graphics.Collage (..)

main : Signal Element
main =
  map3 view Window.dimensions sig (Signal.subscribe hoveredOn)

chan : Channel Int
chan = channel 0

sig : Signal Int
sig = subscribe chan
  
hoveredOn : Signal.Channel String
hoveredOn = Signal.channel ""

view : (Int, Int) -> Int -> String -> Element
view (width, height) sig hoveredOn =
  if | sig < -1 -> displayWelcome (width, height) sig
     | sig == -1 -> congrats (width, height) sig
     | sig == 0 -> displayWelcome (width, height) sig
     | sig == 1 -> importsWelcome(width, height) sig
     | sig == 2 -> displayImports (width, height) sig hoveredOn
     | sig == 3 -> signalsWelcome (width, height) sig
     | sig == 4 -> displaySignals (width, height) sig hoveredOn
     | sig == 5 -> modelWelcome (width, height) sig
     | sig == 6 -> displayModel1 (width, height) sig hoveredOn
     | sig == 7 -> displayModel2 (width, height) sig hoveredOn
     | sig == 8 -> updateWelcome (width, height) sig
     | sig == 9 -> displayUpdate1 (width, height) sig hoveredOn
     | sig == 10 -> displayUpdate2 (width, height) sig hoveredOn
     | sig == 11 -> displayUpdate3 (width, height) sig hoveredOn
     | sig == 12 -> displayUpdate4 (width, height) sig hoveredOn
     | sig == 13 -> viewWelcome (width, height) sig
     | sig == 14 -> displayView1 (width, height) sig hoveredOn
     | sig == 15 -> displayView2 (width, height) sig hoveredOn
     | sig == 16 -> congrats (width, height) sig
     | sig == 17 -> idea1 (width, height) sig
     | sig == 18 -> idea2 (width, height) sig
     | sig == 19 -> idea3 (width, height) sig
     | otherwise -> displayWelcome (width, height) sig

-- These numbers are used to create the containers that hold the code examples and explinations
indent = 5
containerWidth = 400
containerHeight = 700
topHeight = 550
extraLine = 15
codeHeight = 30
bottomHeight = 150

-- Wayfinding tools
wayfinderPast =
  circle 15
    |> filled elmOrange
    |> alpha 0.5

wayfinderPresent =
  circle 15
    |> filled elmOrange

wayfinderFuture =
  circle 15
    |> outlined ( solid elmOrange)

dashpast =
  rect 20 5
    |> filled elmOrange
    |> alpha 0.5

dashPresent =
  rect 20 5
    |> filled elmOrange

-- Custom colors based on the Elm logo
elmGrey = rgb 71 80 102
elmOrange = rgb 237 149 0
elmBlue = rgb 76 166 195
elmGreen = rgb 127 209 17

-- Text formatting
title f = Text.fromString(f)
            |> Text.height 50
            |> Text.centered

subTitle f = Text.fromString(f)
                  |> Text.height 20
                  |> Text.leftAligned

body f = Text.fromString(f)
             |> Text.leftAligned

-- Welcome Message
displayWelcome : (Int, Int) -> Int -> Element
displayWelcome (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ wayfindingWelcome
    , welcomeContainer
    , spacer 1 6
    , flow right
      [ size 197 40 <| color grey <| button (send chan (sig - 1)) "<"
      , spacer 6 1
      , size 197 40 <| color grey <| button (send chan (sig + 1)) ">"
      ]
    ]))

wayfindingWelcome : Element
wayfindingWelcome =
  color grey <| container 400 50 middle <| (flow right
    [ collage 33 50
        [ wayfinderPresent ]
    , collage 33 50
        [ dashPresent ]
    , collage 33 50
        [ wayfinderFuture ]
    , collage 33 50
        [ dashPresent ]
    , collage 33 50
        [ wayfinderFuture ]
    , collage 33 50
        [ dashPresent ]
    , collage 33 50
        [ wayfinderFuture ]
    , collage 33 50
        [ dashPresent ]
    , collage 33 50
        [ wayfinderFuture ]
    , collage 33 50
        [ dashPresent ]
    , collage 33 50
        [ wayfinderFuture ]
    ])

welcomeContainer : Element
welcomeContainer =
  color grey (container containerWidth containerHeight midLeft (flow down
    [ container containerWidth 100 middle <| title welcomeMsg1
    , spacer 1 20 -- video game animation will go here
    , container containerWidth 300 middle <| subTitle welcomeMsg2
    ]))

welcomeMsg1 : String
welcomeMsg1 = "Elm Play"

welcomeMsg2 : String
welcomeMsg2 =
  "Welcome to Elm Play. This tutorial will\n" ++
  "walk you through creatinga video game\n" ++
  "with line-by-line help explaining how\n" ++
  "the game is made."
   

{-- 
*************************************************************
This section has all of the code for explaining the IMPORT section of the game
*************************************************************
--}

-- Imports Welcome
importsWelcome : (Int, Int) -> Int -> Element
importsWelcome (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ importsWelcomeContainer (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (Text.plainText ""))
    ]))

importsWelcomeContainer : (Int, Int) -> Element
importsWelcomeContainer (width, height) =
  color grey (container containerWidth topHeight middle (flow down
  [ container containerWidth 100 middle <| title importsWelcomeMsg1
  , spacer 1 20
  , container containerWidth 50 middle <| subTitle importsWelcomeMsg2
  ]))
  
importsWelcomeMsg1 : String
importsWelcomeMsg1 =
  "Imports Section"

importsWelcomeMsg2 : String
importsWelcomeMsg2 =
  "The Imports Section loads all of the packages needed \nfor the game."

-- Imports Message
displayImports : (Int, Int) -> Int -> String -> Element
displayImports (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ importsContainer (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
importsContainer : (Int, Int) -> Element
importsContainer (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (importGraphicsInput)
    , container containerWidth codeHeight midLeft (importGraphicsElement)
    , container containerWidth codeHeight midLeft (importGraphicsCollage)
    , container containerWidth codeHeight midLeft (importText)
    , container containerWidth codeHeight midLeft (importSignal)
    , container containerWidth codeHeight midLeft (importMouse)
    ]))
  
graphicsInputMsg = " Import everything from the Graphics.Input library."
importGraphicsInput : Element
importGraphicsInput =
  body " import Graphics.Input (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsInputMsg) else (Signal.send hoveredOn ""))

graphicsElementMsg = " Import everything from the Graphics.Element library."
importGraphicsElement : Element
importGraphicsElement =
  body " import Graphics.Element (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsElementMsg) else (Signal.send hoveredOn ""))

graphicsCollageMsg = " Import everything from the Graphics.Collage library."
importGraphicsCollage : Element
importGraphicsCollage =
  body " import Graphics.Collage (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsCollageMsg) else (Signal.send hoveredOn ""))

textMsg = " Import everything from the Text library."
importText : Element
importText =
  body " import Text (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textMsg) else (Signal.send hoveredOn ""))

signalMsg = " Import the Signal library."
importSignal : Element
importSignal =
  body " import Signal"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMsg) else (Signal.send hoveredOn ""))

mouseMsg = " Import everything from the Mouse library."
importMouse : Element
importMouse =
  body " import Mouse (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn mouseMsg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the SIGNALS section of the game
*************************************************************
--}

-- Signals Welcome
signalsWelcome : (Int, Int) -> Int -> Element
signalsWelcome (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ signalsWelcomeContainer (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (Text.plainText ""))
    ]))

signalsWelcomeContainer : (Int, Int) -> Element
signalsWelcomeContainer (width, height) =
  color grey (container containerWidth topHeight midLeft (flow down
  [ container containerWidth 100 middle <| title signalsWelcomeMsg1
  , spacer 1 20
  , container containerWidth 50 middle <| subTitle signalsWelcomeMsg2
  ]))
  
signalsWelcomeMsg1 : String
signalsWelcomeMsg1 =
  "Signals Section\n"

signalsWelcomeMsg2 : String
signalsWelcomeMsg2 =
  "Signals are values that change over time."

-- Signals Message
displaySignals : (Int, Int) -> Int -> String -> Element
displaySignals (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ signalsContainer (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
signalsContainer : (Int, Int) -> Element
signalsContainer (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (signalMain1)
    , container containerWidth codeHeight midLeft (signalMain2)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (signalGameState1)
    , container containerWidth codeHeight midLeft (signalGameState2)
    , container containerWidth codeHeight midLeft (signalGameState3)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (signalDelta1)
    , container containerWidth codeHeight midLeft (signalDelta2)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (signalInput1)
    , container containerWidth codeHeight midLeft (signalInput2)
    , container containerWidth codeHeight midLeft (signalInput3)
    , container containerWidth codeHeight midLeft (signalInput4)
    , container containerWidth codeHeight midLeft (signalInput5)
    , container containerWidth codeHeight midLeft (signalInput6)
    , container containerWidth codeHeight midLeft (signalInput7)
    , container containerWidth codeHeight midLeft (signalInput8)
    ]))
  
signalMain1Msg = "Define the main function Every Elm program must have a main."
signalMain1 : Element
signalMain1 =
  body " main ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain1Msg) else (Signal.send hoveredOn ""))

signalMain2Msg = "Map the signals Window.dimensions and gameState to the function view."
signalMain2 : Element
signalMain2 =
  body (padLeft 49 ' ' " Signal.map2 view Window.dimensions gameState")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain2Msg) else (Signal.send hoveredOn ""))

signalGameState1Msg = " Define gameState as a signal of type Game."
signalGameState1 : Element
signalGameState1 =
  body " gameState : Signal Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState1Msg) else (Signal.send hoveredOn ""))
    
signalGameState2Msg = " Define the specifics of gameState."
signalGameState2 : Element
signalGameState2 =
  body " gameState ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState2Msg) else (Signal.send hoveredOn ""))

signalGameState3Msg = " gameState is past dependent on defaultGame and input."
signalGameState3 : Element
signalGameState3 =
  body (padLeft 42 ' ' " Signal.foldp update defaultGame input")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState3Msg) else (Signal.send hoveredOn ""))

signalDelta1Msg = " Define specific characteristics of the delta signal."
signalDelta1 : Element
signalDelta1 =
  body " delta ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDelta1Msg) else (Signal.send hoveredOn ""))
    
signalDelta2Msg = "Notes the change in time 35 times a second, \nand then converts this to seconds."
signalDelta2 : Element
signalDelta2 =
  body (padLeft 34 ' ' " Signal.map inSeconds (fps 35)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDelta2Msg) else (Signal.send hoveredOn ""))

signalInput1Msg = "Defines input as a signal of type Input."
signalInput1 : Element
signalInput1 =
  body " input : Signal Input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput1Msg) else (Signal.send hoveredOn ""))

signalInput2Msg = "Defines the specifics of input."
signalInput2 : Element
signalInput2 =
  body " input ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput2Msg) else (Signal.send hoveredOn ""))
    
signalInput3Msg = "For every delta, the specific attributes of input are updated."
signalInput3 : Element
signalInput3 =
  body (padLeft 29 ' ' " Signal.sampleOn delta <|")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput3Msg) else (Signal.send hoveredOn ""))
    
signalInput4Msg = "Maps all four attributes of Input to the update that happens every delta."
signalInput4 : Element
signalInput4 =
  body (padLeft 27 ' ' " Signal.map4 Input")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput4Msg) else (Signal.send hoveredOn ""))

signalInput5Msg = "Gives a true or false based upon the space bar being pressed."
signalInput5 : Element
signalInput5 =
  body (padLeft 29 ' ' " Keyboard.space")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput5Msg) else (Signal.send hoveredOn ""))

signalInput6Msg = "Updates the x attribute based upon left/right arrow being pressed."
signalInput6 : Element
signalInput6 =
  body (padLeft 46 ' ' " (Signal.map .x Keyboard.arrows)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput6Msg) else (Signal.send hoveredOn ""))

signalInput7Msg = "Updates the y attribute based upon up/down arrow being pressed."
signalInput7 : Element
signalInput7 =
  body (padLeft 46 ' ' " (Signal.map .y Keyboard.arrows)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput7Msg) else (Signal.send hoveredOn ""))

signalInput8Msg = "Updates delta with the new time."
signalInput8 : Element
signalInput8 =
  body (padLeft 20 ' ' " delta")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput8Msg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the MODEL section of the game
*************************************************************
--}

-- Model Welcome
modelWelcome : (Int, Int) -> Int -> Element
modelWelcome (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ modelWelcomeContainer (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (Text.plainText ""))
    ]))

modelWelcomeContainer : (Int, Int) -> Element
modelWelcomeContainer (width, height) =
  color grey (container containerWidth topHeight midLeft (flow down
  [ container containerWidth 100 middle <| title modelWelcomeMsg1
  , spacer 1 20
  , container containerWidth 50 middle <| subTitle modelWelcomeMsg2
  ]))
  
modelWelcomeMsg1 : String
modelWelcomeMsg1 =
  "Model Section"

modelWelcomeMsg2 : String
modelWelcomeMsg2 =
  "The Model Section sets up the characteristics for each\n"
  ++ "object used in the game."

-- Model Message 1
displayModel1 : (Int, Int) -> Int -> String -> Element
displayModel1 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ modelContainer1 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
modelContainer1 : (Int, Int) -> Element
modelContainer1 (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (gameSize)
    , container containerWidth codeHeight midLeft (playingSize)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (typeState)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (aliasBadGuy1)
    , container containerWidth codeHeight midLeft (aliasBadGuy2)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (aliasPlayer1)
    , container containerWidth codeHeight midLeft (aliasPlayer2)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (aliasGame1)
    , container containerWidth codeHeight midLeft (aliasGame2)
    ]))
  
gameSizeMsg = "Set the variable gameWidth to 600 and variable gameHeight to 400."
gameSize : Element
gameSize =
  body " (gameWidth, gameHeight) = (600, 400)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn gameSizeMsg) else (Signal.send hoveredOn ""))

playingSizeMsg = " Set variable halfWidth to 300 and variable halfHeight to 200."
playingSize : Element
playingSize =
  body " (halfWidth, halfHeight) = (300, 200)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn playingSizeMsg) else (Signal.send hoveredOn ""))
    
typeStateMsg = " Create type State and indicate it can have either the value Play or Pause."
typeState : Element
typeState =
  body " type State = Play | Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn typeStateMsg) else (Signal.send hoveredOn ""))

aliasBadGuy1Msg = " Create a type alias BadGuy with the following characteristics."
aliasBadGuy1 : Element
aliasBadGuy1 =
  body " type alias BadGuy ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy1Msg) else (Signal.send hoveredOn ""))
    
aliasBadGuy2Msg = "Objects of type BadGuy have an x value of type float, a y value of \ntype float,"
                              ++ "a vx value of type Float, and a vy value of type float.\n"
                              ++ "Floats are numbers with a decimal."
aliasBadGuy2 : Element
aliasBadGuy2 =
  body (padLeft 45 ' ' " { x:Float, y:Float, vx:Float, vy:Float }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy2Msg) else (Signal.send hoveredOn ""))

aliasPlayer1Msg = " Create a type alias Player with the following characteristics."
aliasPlayer1 : Element
aliasPlayer1 =
  body " type alias Player ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer1Msg) else (Signal.send hoveredOn ""))

aliasPlayer2Msg = "Objects of type Player have an x value of type float, a y value of type \nfloat,"
                              ++ "a vx value of type Float, a vy value of type float, and a lives value \nof type integer."
                              ++ "Floats are numbers with a decimal, and integers are \nnumber without decimals."
aliasPlayer2 : Element
aliasPlayer2 =
  body (padLeft 56 ' ' " { x:Float, y:Float, vx:Float, vy:Float, lives:Int }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer2Msg) else (Signal.send hoveredOn ""))

aliasGame1Msg = " Create a type alias Game with the following characteristics."
aliasGame1 : Element
aliasGame1 =
  body " type alias Game ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame1Msg) else (Signal.send hoveredOn ""))

aliasGame2Msg = "Objects of type Game have a value state of type State,"
                           ++ "a value \nbadGuy of type BadGuy, and a value of player1 of type Player."
aliasGame2 : Element
aliasGame2 =
  body (padLeft 51 ' ' " { state:State, badGuy:BadGuy, player1:Player }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame2Msg) else (Signal.send hoveredOn ""))

-- Model Message 2
displayModel2 : (Int, Int) -> Int -> String -> Element
displayModel2 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ modelContainer2 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
modelContainer2 : (Int, Int) -> Element
modelContainer2 (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (defaultGame1)
    , container containerWidth codeHeight midLeft (defaultGame2)
    , container containerWidth codeHeight midLeft (defaultGame3)
    , container containerWidth codeHeight midLeft (defaultGame4)
    , container containerWidth codeHeight midLeft (defaultGame5)
    , container containerWidth codeHeight midLeft (defaultGame6)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (aliasInput1)
    , container containerWidth codeHeight midLeft (aliasInput2)
    , container containerWidth codeHeight midLeft (aliasInput3)
    , container containerWidth codeHeight midLeft (aliasInput4)
    , container containerWidth codeHeight midLeft (aliasInput5)
    , container containerWidth codeHeight midLeft (aliasInput6)
    ]))

defaultGame1Msg = " Create an object defaultGame of type Game."
defaultGame1 : Element
defaultGame1 =
  body " defaultGame : Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame1Msg) else (Signal.send hoveredOn ""))

defaultGame2Msg = " Assign each attribute of defaultGame with the following values."
defaultGame2 : Element
defaultGame2 =
  body " defaultGame ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame2Msg) else (Signal.send hoveredOn ""))

defaultGame3Msg = " The state attribute has a value of Pause."
defaultGame3 : Element
defaultGame3 =
  body (padLeft 20 ' ' " { state = Pause")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame3Msg) else (Signal.send hoveredOn ""))

defaultGame4Msg = "The badGuy attributes have an x value of 0, a y value of 0, a vx value \nof 300,"
                              ++ "and a vy value of 300. The x and y values are used for the \nbadGuy's postion,"
                              ++ "and the vx and vy values are the velocity (think speed) \nof the badGuy."
defaultGame4 : Element
defaultGame4 =
  body (padLeft 44 ' ' " , badGuy = { x=0, y=0, vx=300, vy=300 }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame4Msg) else (Signal.send hoveredOn ""))

defaultGame5Msg = "The player1 attributes have an x value of 15-halfWidth (or -285), a \ny value of 0,"
                              ++ " a vx value of 300, and a vy value of 300. The x and y values \nare used for the player1's postion,"
                              ++ "and the vx and vy values are the velocity \n(think speed) of the player1. player1 also has 3 lives."
defaultGame5 : Element
defaultGame5 =
  body (padLeft 71 ' ' " , player1 = { x = 15-halfWidth, y = 0, vx = 0, vy = 0, lives = 3 }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame5Msg) else (Signal.send hoveredOn ""))

defaultGame6Msg = " End the list of attributes for defaultGame."
defaultGame6 : Element
defaultGame6 =
  body (padLeft 6 ' ' " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame6Msg) else (Signal.send hoveredOn ""))

aliasInput1Msg = " Create a type alias Input with the following characteristics."
aliasInput1 : Element
aliasInput1 =
  body " type alias Input ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput1Msg) else (Signal.send hoveredOn ""))

aliasInput2Msg = "Objects of type Input has an attribute called space with a boolean value.\n"
                          ++ "Boolean means either true or false."
aliasInput2 : Element
aliasInput2 =
  body (padLeft 19 ' ' " { space : Bool")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput2Msg) else (Signal.send hoveredOn ""))

aliasInput3Msg = "Objects of type Input has an attribute called dir2 with a integer value.\n"
                          ++ "Integer means a number without a decimal."
aliasInput3 : Element
aliasInput3 =
  body (padLeft 17 ' ' " , dir1 : Int")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput3Msg) else (Signal.send hoveredOn ""))

aliasInput4Msg = "Objects of type Input has an attribute called dir2 with a integer value.\n"
                          ++ "Integer means a number without a decimal."
aliasInput4 : Element
aliasInput4 =
  body (padLeft 17 ' ' " , dir2 : Int")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput4Msg) else (Signal.send hoveredOn ""))

aliasInput5Msg = "Objects fo type Input have an attribute called delta with a Time value."
aliasInput5 : Element
aliasInput5 =
  body (padLeft 19 ' ' " , delta : Time")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput5Msg) else (Signal.send hoveredOn ""))

aliasInput6Msg = "End the list of attributes for Input."
aliasInput6 : Element
aliasInput6 =
  body (padLeft 6 ' ' " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput6Msg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the UPDATE section of the game
*************************************************************
--}

-- Update Welcome
updateWelcome : (Int, Int) -> Int -> Element
updateWelcome (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ updateWelcomeContainer (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (Text.plainText""))
    ]))

updateWelcomeContainer : (Int, Int) -> Element
updateWelcomeContainer (width, height) =
  color grey (container containerWidth topHeight midLeft (flow down
  [ container containerWidth 100 middle <| title updateWelcomeMsg1
  , spacer 1 20
  , container containerWidth 50 middle <| subTitle updateWelcomeMsg2
  ]))
  
updateWelcomeMsg1 : String
updateWelcomeMsg1 =
  "Update Section\n"

updateWelcomeMsg2 : String
updateWelcomeMsg2 =
  "The Update Section changes the values for each object \nif the user has provided input."

-- Update Message 1
displayUpdate1 : (Int, Int) -> Int -> String -> Element
displayUpdate1 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ updateContainer1 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
updateContainer1 : (Int, Int) -> Element
updateContainer1 (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (updateFunc1)
    , container containerWidth codeHeight midLeft (updateFunc2)
    , container containerWidth codeHeight midLeft (updateFunc3)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (updateFunc4)
    , container containerWidth codeHeight midLeft (updateFunc5)
    , container containerWidth codeHeight midLeft (updateFunc6)
    , container containerWidth codeHeight midLeft (updateFunc7)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (updateFunc8)
    , container containerWidth codeHeight midLeft (updateFunc9)
    , container containerWidth codeHeight midLeft (updateFunc10)
    , container containerWidth codeHeight midLeft (updateFunc11)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (updateFunc12)
    , container containerWidth codeHeight midLeft (updateFunc13)
    , container containerWidth codeHeight midLeft (updateFunc14)
    , container containerWidth codeHeight midLeft (updateFunc15)
    , container containerWidth codeHeight midLeft (updateFunc16)
    , container containerWidth codeHeight midLeft (updateFunc17)
    ]))
  
updateFunc1Msg = "Update is a function that takes an object of type Input, an object of type\n"
                          ++ "Game, and returns a Game."
updateFunc1 : Element
updateFunc1 =
  body " update : Input -> Game -> Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc1Msg) else (Signal.send hoveredOn ""))

updateFunc2Msg = "Specifically, update takes Input in the form of space, dir1, dir2, and delta.\n"
                          ++ "The Game is defined as state, badGuy, and player1."
updateFunc2 : Element
updateFunc2 =
  body " update {space,dir1,dir2,delta} ({state,badGuy,player1} as game) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc2Msg) else (Signal.send hoveredOn ""))

updateFunc3Msg = "The let expression assigns the value of 1 to lives if badGuy is within \nplayer1."
                          ++ "If not, the value of 0 is assigned to lives. The function within is \ndefined below."
updateFunc3 : Element
updateFunc3 =
  body (padLeft 60 ' ' " let lives = if (badGuy `within` player1) then 1 else 0")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc3Msg) else (Signal.send hoveredOn ""))

updateFunc4Msg = "The function newState assumes a value dependent upon the cases below:"
updateFunc4 : Element
updateFunc4 =
  body (padLeft 21 ' ' " newState =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc4Msg) else (Signal.send hoveredOn ""))

updateFunc5Msg = "If the space bar is pressed, then newState takes the value Play."
updateFunc5 : Element
updateFunc5 =
  body (padLeft 53 ' ' " if | space                    -> Play")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc5Msg) else (Signal.send hoveredOn ""))

updateFunc6Msg = "NewState assumes the value of Pause if player1.lives is 0. That is, the game\n"
                          ++ "stops when the player runs out of lives."
updateFunc6 : Element
updateFunc6 =
  body (padLeft 48 ' ' " | player1.lives == 0 -> Pause")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc6Msg) else (Signal.send hoveredOn ""))

updateFunc7Msg = "In all other cases, newState assumes the value of state. \nThat is, nothing changes."
updateFunc7 : Element
updateFunc7 =
  body (padLeft 52 ' ' " | otherwise              -> state")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc7Msg) else (Signal.send hoveredOn ""))

updateFunc8Msg = "The function newBadGuy assumes the value dependent \nupon the following cases:"
updateFunc8 : Element
updateFunc8 =
  body (padLeft 22 ' ' " newBadGuy =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc8Msg) else (Signal.send hoveredOn ""))

updateFunc9Msg = "If the value of state is equal to Pause, the do the following thing.\n"
                          ++ "an element. A tupple is two numbers grouped together by parentheses.\n"
                          ++ "An integer is a number without a decimal."
updateFunc9 : Element
updateFunc9 =
  body (padLeft 33 ' ' " if state == Pause")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc9Msg) else (Signal.send hoveredOn ""))

updateFunc10Msg = "The function newBadGuy takes the value badGuy. That is, nothing changes."
updateFunc10 : Element
updateFunc10 =
  body (padLeft 32 ' ' " then badGuy")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc10Msg) else (Signal.send hoveredOn ""))

updateFunc11Msg = "When state equals Play, then call the function updateBadGuy, which is \ndefined below."
                              ++ "updateBadGuy takes delta, badGuy, and player1."
updateFunc11 : Element
updateFunc11 =
  body (padLeft 59 ' ' " else updateBadGuy delta badGuy player1")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc11Msg) else (Signal.send hoveredOn ""))

updateFunc12Msg = "The in part of the let expression tells us how the \nabove information will be used."
updateFunc12 : Element
updateFunc12 =
  body (padLeft 8 ' ' " in")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc12Msg) else (Signal.send hoveredOn ""))

updateFunc13Msg = "Game will have its attributes updated."
updateFunc13 : Element
updateFunc13 =
  body (padLeft 19 ' ' " { game |")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc13Msg) else (Signal.send hoveredOn ""))

updateFunc14Msg = "State will assume the value of newState."
updateFunc14 : Element
updateFunc14 =
  body (padLeft 36 ' ' " state   <- newState,")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc14Msg) else (Signal.send hoveredOn ""))

updateFunc15Msg = "BadGuy assumes the value of newBadGuy."
updateFunc15 : Element
updateFunc15 =
  body (padLeft 37 ' ' " badGuy  <- newBadGuy,")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc15Msg) else (Signal.send hoveredOn ""))

updateFunc16Msg = "Player1 assumes the value of updatePlayer which needs delta, dir1, dir2,\n"
                                ++ "lives, and player1. The function updatePlayer is defined below."
updateFunc16 : Element
updateFunc16 =
  body (padLeft 69 ' ' " player1 <- updatePlayer delta dir1 dir2 lives player1")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc16Msg) else (Signal.send hoveredOn ""))

updateFunc17Msg = "This bracket closes the update function."
updateFunc17 : Element
updateFunc17 =
  body (padLeft 12 ' ' " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc17Msg) else (Signal.send hoveredOn ""))

-- Update Message 2
displayUpdate2 : (Int, Int) -> Int -> String -> Element
displayUpdate2 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ updateContainer2 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
updateContainer2 : (Int, Int) -> Element
updateContainer2 (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (updateBadGuy1)
    , container containerWidth codeHeight midLeft (updateBadGuy2)
    , container containerWidth codeHeight midLeft (updateBadGuy3)
    , container containerWidth codeHeight midLeft (updateBadGuy4)
    , container containerWidth codeHeight midLeft (updateBadGuy5)
    , container containerWidth codeHeight midLeft (updateBadGuy6)
    , container containerWidth codeHeight midLeft (updateBadGuy7)
    , container containerWidth codeHeight midLeft (updateBadGuy8)
    , container containerWidth codeHeight midLeft (updateBadGuy9)
    , container containerWidth codeHeight midLeft (updateBadGuy10)
    , container containerWidth codeHeight midLeft (updateBadGuy11)
    , container containerWidth codeHeight midLeft (updateBadGuy12)
    , container containerWidth codeHeight midLeft (updateBadGuy13)
    ]))
  
updateBadGuy1Msg = "The function updateBadGuy takes a Time, a BadGuy, and a Player.\n"
                          ++ "The function returns a type of BadGuy."
updateBadGuy1 : Element
updateBadGuy1 =
  body " updateBadGuy : Time -> BadGuy -> Player -> BadGuy"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy1Msg) else (Signal.send hoveredOn ""))

updateBadGuy2Msg = "UpdateBadGuy takes t as time; the x, y, vx, and vy values of badGuy;\n"
                          ++ "and the x, y, vx, and vy values of player1."
updateBadGuy2 : Element
updateBadGuy2 =
  body " updateBadGuy t ({x,y,vx,vy} as badGuy) ({x,y,vx,vy,lives} as player1) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy2Msg) else (Signal.send hoveredOn ""))

updateBadGuy3Msg = "If player1 has no more lives, then the x and y values of badGuy are set to 0."
updateBadGuy3 : Element
updateBadGuy3 =
  body (padLeft 60 ' ' " if | (player1.lives == 0) -> { badGuy | x <- 0, y <- 0}")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

updateBadGuy4Msg = "If badGuy is touching player1, then the function physicsUpdate is called\n"
                          ++ "with t (time)."
updateBadGuy4 : Element
updateBadGuy4 =
  body (padLeft 54 ' ' " | (badGuy `within` player1) -> physicsUpdate t")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy4Msg) else (Signal.send hoveredOn ""))

updateBadGuy5Msg = "This bit of code is setting forth attributes of badGuy that will be modified."
updateBadGuy5 : Element
updateBadGuy5 =
  body (padLeft 25 ' ' " { badGuy |")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy5Msg) else (Signal.send hoveredOn ""))

updateBadGuy6Msg = "The vx value of badGuy takes the result of the stepV funtion which takes the\n"
                                  ++ "the true or false value for the conditional statements."
updateBadGuy6 : Element
updateBadGuy6 =
  body (padLeft 65 ' ' " vx <- stepV vx (badGuy.vx < 0) (badGuy.vx > 0),")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy6Msg) else (Signal.send hoveredOn ""))

updateBadGuy7Msg = "The vx value of badGuy takes the result of the stepV funtion which takes the\n"
                                  ++ "the true or false value for the conditional statements."
updateBadGuy7 : Element
updateBadGuy7 =
  body (padLeft 65 ' ' " vy <- stepV vy (badGuy.vy < 0 ) (badGuy.vy > 0)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy7Msg) else (Signal.send hoveredOn ""))

updateBadGuy8Msg = "The bracket ends the attributes of badGuy which are modified."
updateBadGuy8 : Element
updateBadGuy8 =
  body (padLeft 16 ' ' " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy8Msg) else (Signal.send hoveredOn ""))

updateBadGuy9Msg = "In all other cases, the function physicsUpdate will be \ncalled with different arguments."
updateBadGuy9 : Element
updateBadGuy9 =
  body (padLeft 38 ' ' " | otherwise -> physicsUpdate t")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy9Msg) else (Signal.send hoveredOn ""))

updateBadGuy10Msg = "Once again, some of the attributes of badGuy will be modified."
updateBadGuy10 : Element
updateBadGuy10 =
  body (padLeft 25 ' ' " { badGuy |")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy10Msg) else (Signal.send hoveredOn ""))

updateBadGuy11Msg = "The value vx takes the result of the function stepV. This is checking to \nsee if "
                                    ++ "the badGuy is going outside the game area. The number 25 is used\n"
                                    ++ "that is the radius of badGuy. This will keep it in the game area."
updateBadGuy11 : Element
updateBadGuy11 =
  body (padLeft 71 ' ' " vx <- stepV vx (x < 25-halfWidth) (x > halfWidth-25),")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy11Msg) else (Signal.send hoveredOn ""))

updateBadGuy12Msg = "The value vx takes the result of the function stepV. This is checking to \nsee if "
                                    ++ "the badGuy is going outside the game area. The number 25 is used\n"
                                    ++ "that is the radius of badGuy. This will keep it in the game area."
updateBadGuy12 : Element
updateBadGuy12 =
  body (padLeft 72 ' ' " vy <- stepV vy (y < 25-halfHeight) (y > halfHeight-25)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy12Msg) else (Signal.send hoveredOn ""))

updateBadGuy13Msg = "The bracket ends the attributes of badGuy which are modified."
updateBadGuy13 : Element
updateBadGuy13 =
  body (padLeft 16 ' ' " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

-- Update Message 3
displayUpdate3 : (Int, Int) -> Int -> String -> Element
displayUpdate3 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ updateContainer3 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
updateContainer3 : (Int, Int) -> Element
updateContainer3 (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (updatePlayer1)
    , container containerWidth codeHeight midLeft (updatePlayer2)
    , container containerWidth codeHeight midLeft (updatePlayer3)
    , container containerWidth codeHeight midLeft (updatePlayer4)
    , container containerWidth codeHeight midLeft (updatePlayer5)
    , container containerWidth codeHeight midLeft (updatePlayer6)
    , container containerWidth codeHeight midLeft (updatePlayer7)
    , container containerWidth codeHeight midLeft (updatePlayer8)
    , container containerWidth codeHeight midLeft (updatePlayer9)
    , container containerWidth codeHeight midLeft (updatePlayer10)
    , container containerWidth codeHeight midLeft (updatePlayer11)
    , container containerWidth codeHeight midLeft (updatePlayer12)
    , container containerWidth codeHeight midLeft (updatePlayer13)
    ]))
  
updatePlayer1Msg = "This defines the function updatePlayer, which takes a time, an integer, \nanother "
                          ++ "integer, another integer, a player, and returns a player."
updatePlayer1 : Element
updatePlayer1 =
  body " updatePlayer : Time -> Int -> Int -> Int -> Player -> Player"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer1Msg) else (Signal.send hoveredOn ""))

updatePlayer2Msg = "The function updatePlayer is called with t, dir1, dir2, lives, and player."
updatePlayer2 : Element
updatePlayer2 =
  body " updatePlayer t dir1 dir2 lives player ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer2Msg) else (Signal.send hoveredOn ""))

updatePlayer3Msg = "An object player1 is created. Its attributes of vx and vy are set to the values \ncreated "
                              ++ "by the function physicsUpdate, which takes time t. and player.\n"
                              ++ "The updated vy attribute takes the value of dir2 multiplied by 200. However,\ndir2 "
                              ++ "multiplied by 200 is an integer. The value vy is a float. The toFloat \nfunction converts "
                              ++ "an integer into a float."
updatePlayer3 : Element
updatePlayer3 =
  body (padLeft 73 ' ' " let player1 = physicsUpdate  t { player | vx <- toFloat dir1 * 200,")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

updatePlayer4Msg = "The updated vy attribute takes the value of dir2 multiplied by 200. \nHowever, dir2 "
                              ++ "multiplied by 200 is an integer. The value vy is a float. \nThe toFloat function converts "
                              ++ "an integer into a float."
updatePlayer4 : Element
updatePlayer4 =
  body (padLeft 93 ' ' " vy <- toFloat dir2 * 200}")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer4Msg) else (Signal.send hoveredOn ""))

updatePlayer5Msg = "This is a conditional statement tha wants to know if player.lives minus lives is\n"
                               ++ "is greater than 0. Conditinals return true or false."
updatePlayer5 : Element
updatePlayer5 =
  body (padLeft 48 ' ' " alive = if (player.lives - lives < 0)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer5Msg) else (Signal.send hoveredOn ""))

updatePlayer6Msg = "If the previous conditional statement is true, then alives takes the value of 0."
updatePlayer6 : Element
updatePlayer6 =
  body (padLeft 22 ' ' " then 0")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer6Msg) else (Signal.send hoveredOn ""))

updatePlayer7Msg = "If the previous conditional statement is not true, then alive will equal player.lives\n"
                              ++ "minus the value of lives."
updatePlayer7 : Element
updatePlayer7 =
  body (padLeft 43 ' ' " else (player.lives - lives)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer7Msg) else (Signal.send hoveredOn ""))

updatePlayer8Msg = "This is the second part of the let statement. The newly introduced alive will be\n"
                               ++ "used below."
updatePlayer8 : Element
updatePlayer8 =
  body (padLeft 8 ' ' " in")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer8Msg) else (Signal.send hoveredOn ""))

updatePlayer9Msg = "This says that within player1, the following attributes will be updated."
updatePlayer9 : Element
updatePlayer9 =
  body (padLeft 22 ' ' " { player1 |")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer9Msg) else (Signal.send hoveredOn ""))

updatePlayer10Msg = "The updated attribute y takes the value of player1.y. However, the value is\n"
                                ++ "limited (or clamped) to any number between 35 - halfHeight (-165) and\n"
                                ++ "halfHeight - 35 (165)."
updatePlayer10 : Element
updatePlayer10 =
  body (padLeft 69 ' ' " y <- clamp (35-halfHeight) (halfHeight-35) player1.y,")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer10Msg) else (Signal.send hoveredOn ""))

updatePlayer11Msg = "The updated attribute x takes the value of player1.x. However, the value is\n"
                                ++ "limited (or clamped) to any number between 35 - halfWidth (-265) and\n"
                                ++ "halfWidth-35 (265)."
updatePlayer11 : Element
updatePlayer11 =
  body (padLeft 67 ' ' " x <- clamp (35-halfWidth) (halfWidth-35) player1.x,")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer11Msg) else (Signal.send hoveredOn ""))

updatePlayer12Msg = "The updated attribute lives takes the value of alive."
updatePlayer12 : Element
updatePlayer12 =
  body (padLeft 30 ' ' " lives <- alive")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer12Msg) else (Signal.send hoveredOn ""))

updatePlayer13Msg = "This bracket the update for player1."
updatePlayer13 : Element
updatePlayer13 =
  body (padLeft 12 ' ' " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

-- Update Message 4
displayUpdate4 : (Int, Int) -> Int -> String -> Element
displayUpdate4 (width, height) sig hoveredOn=
  color elmGrey (container width height middle (flow down
    [ updateContainer4 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
updateContainer4 : (Int, Int) -> Element
updateContainer4 (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (updatePhysics1)
    , container containerWidth codeHeight midLeft (updatePhysics2)
    , container containerWidth codeHeight midLeft (updatePhysics3)
    , container containerWidth codeHeight midLeft (updatePhysics4)
    , container containerWidth codeHeight midLeft (updatePhysics5)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (updateNear1)
    , container containerWidth codeHeight midLeft (updateNear2)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (updateWithin1)
    , container containerWidth codeHeight midLeft (updateWithin2)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (updateStepV1)
    , container containerWidth codeHeight midLeft (updateStepV2)
    , container containerWidth codeHeight midLeft (updateStepV3)
    , container containerWidth codeHeight midLeft (updateStepV4)
    ]))
  
updatePhysics1Msg = "The function updatePhysics takes t (time) and the values of x, y, vx, and vy\n"
                          ++ "which are treated as one object."
updatePhysics1 : Element
updatePhysics1 =
  body " physicsUpdate t ({x,y,vx,vy} as obj) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics1Msg) else (Signal.send hoveredOn ""))

updatePhysics2Msg = "This line of code means that the object will have its attribures modified."
updatePhysics2 : Element
updatePhysics2 =
  body (padLeft 13 ' ' " { obj |")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics2Msg) else (Signal.send hoveredOn ""))

updatePhysics3Msg = "The x attribute becomes x plus vx multiplied by t."
updatePhysics3 : Element
updatePhysics3 =
  body (padLeft 24 ' ' " x <- x + vx * t,")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics3Msg) else (Signal.send hoveredOn ""))

updatePhysics4Msg = "The y attribute becomes y plus vy multiplied by t."
updatePhysics4 : Element
updatePhysics4 =
  body (padLeft 23 ' ' " y <- y + vy * t")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics4Msg) else (Signal.send hoveredOn ""))

updatePhysics5Msg = "This brakcet closes the updatePhysics function."
updatePhysics5 : Element
updatePhysics5 =
  body (padLeft 7 ' ' " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics5Msg) else (Signal.send hoveredOn ""))

updateNear1Msg = "The function near takes three arguments: k, c, and n. It determines if two \nobjects "
                            ++ "(k and n) are near one another based upon a third number (c)."
updateNear1 : Element
updateNear1 =
  body " near k c n ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateNear1Msg) else (Signal.send hoveredOn ""))

updateNear2Msg = "This is the logic equation to determine if two objects are touching."
updateNear2 : Element
updateNear2 =
  body (padLeft 26 ' ' " n >= k-c && n <= k+c")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateNear2Msg) else (Signal.send hoveredOn ""))

updateWithin1Msg = "The function within takes badGuy and player1 and determines if they \nare touching."
updateWithin1 : Element
updateWithin1 =
  body " within badGuy player1 ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin1Msg) else (Signal.send hoveredOn ""))

updateWithin2Msg = "The function within calls the function near, and passes it the x positions \nof player1 "
                                ++ "and badGuy, as well as the number 25. 25 is used because that \nis the radius of "
                                ++ "badGuy. This also checks to see if the y positions are \ntouching as well."
updateWithin2 : Element
updateWithin2 =
  body (padLeft 61 ' ' " near player1.x 25 badGuy.x && near player1.y 25 badGuy.y")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin2Msg) else (Signal.send hoveredOn ""))

updateStepV1Msg = "The defines what the function stepV does. It takes two conditions (true \nor false) "
                              ++ "and a third term, v. StepV is used to bounce badGuy off of the \nedges of the "
                              ++ "game area."
updateStepV1 : Element
updateStepV1 =
  body " stepV v condition1 condition2 ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV1Msg) else (Signal.send hoveredOn ""))

updateStepV2Msg = "If condition1 is true, then stepV returns the absolute value of v. This \nbounces "
                              ++ "badGuy off of the left and bottom edges of the game area."
updateStepV2 : Element
updateStepV2 =
  body (padLeft 30 ' ' " if | condition1 -> abs v")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV2Msg) else (Signal.send hoveredOn ""))

updateStepV3Msg = "If condition2 is true, then stepV returns 0 - the absolute value of v. This \nbounces "
                              ++ "badGuy off of the right and top edges of the game area."
updateStepV3 : Element
updateStepV3 =
  body (padLeft 34 ' ' " | condition2 -> 0 - abs v")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV3Msg) else (Signal.send hoveredOn ""))

updateStepV4Msg = "In all other cases, stepV returns the value of v. If badGuy is not touching \nany "
                              ++ "edges, then do not change the direction; keep going in the same \ndirection."
updateStepV4 : Element
updateStepV4 =
  body(padLeft 26 ' '  " | otherwise  -> v")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV4Msg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the VIEW section of the game
*************************************************************
--}

-- View Welcome
viewWelcome : (Int, Int) -> Int -> Element
viewWelcome (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ viewWelcomeContainer (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (Text.plainText ""))
    ]))

viewWelcomeContainer : (Int, Int) -> Element
viewWelcomeContainer (width, height) =
  color grey (container containerWidth topHeight midLeft (flow down
  [ container containerWidth 50 middle <| title viewWelcomeMsg1
  , spacer 1 20
  , container containerWidth 50 middle <| subTitle viewWelcomeMsg2
  ]))
  
viewWelcomeMsg1 : String
viewWelcomeMsg1 =
  "View Section\n"

viewWelcomeMsg2 : String
viewWelcomeMsg2 =
  "The View Section displays the game to the computer screen."

-- View Message 1
displayView1 : (Int, Int) -> Int -> String -> Element
displayView1 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ viewContainer1 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
viewContainer1 : (Int, Int) -> Element
viewContainer1 (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (viewFunc1)
    , container containerWidth codeHeight midLeft (viewFunc2)
    , container containerWidth codeHeight midLeft (viewFunc3)
    , container containerWidth codeHeight midLeft (viewFunc4)
    , container containerWidth codeHeight midLeft (viewFunc5)
    , container containerWidth codeHeight midLeft (viewFunc6)
    , container containerWidth codeHeight midLeft (viewFunc7)
    , container containerWidth codeHeight midLeft (viewFunc8)
    , container containerWidth codeHeight midLeft (viewFunc9)
    , container containerWidth codeHeight midLeft (viewFunc10)
    , container containerWidth codeHeight midLeft (viewFunc11)
    , container containerWidth codeHeight midLeft (viewFunc12)
    , container containerWidth codeHeight midLeft (viewFunc13)
    , container containerWidth codeHeight midLeft (viewFunc14)
    , container containerWidth codeHeight midLeft (viewFunc15)
    ]))
  
viewFunc1Msg = "The function view takes a tupple of integers and a game, and the function \nreturns "
                          ++ "an element. A tupple is two numbers grouped together by \nparentheses. An "
                          ++ "integer is a number without a decimal."
viewFunc1 : Element
viewFunc1 =
  body " view : (Int, Int) -> Game -> Element"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc1Msg) else (Signal.send hoveredOn ""))

viewFunc2Msg = "The function view is passed the width and height of the window, as well as\n"
                          ++ "the attributes state, badGuy, and player1 all of which are a part of "
                          ++ "the \ndata type Game."
viewFunc2 : Element
viewFunc2 =
  body " view (w, h) {state, badGuy, player1} ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc2Msg) else (Signal.send hoveredOn ""))

viewFunc3Msg = "The let expression creates an object lives, which is of type element."
viewFunc3 : Element
viewFunc3 =
  body (padLeft 24 ' ' " let lives : Element")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc3Msg) else (Signal.send hoveredOn ""))

viewFunc4Msg = "The objecct lives is assigned the value of player1.lives, which is the\n"
                          ++ "remaining lives of player1. The object lives is converted to a string,\n"
                          ++ "and has a size of 50."
viewFunc4 : Element
viewFunc4 =
  body (padLeft 62 ' ' " lives = txt(Text.height 50) (toString player1.lives)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc4Msg) else (Signal.send hoveredOn ""))

viewFunc5Msg = "In is part of the let expression, and indicates where the newly defined\n"
                          ++ "will be used."
viewFunc5 : Element
viewFunc5 =
  body (padLeft 7 ' ' " in")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc5Msg) else (Signal.send hoveredOn ""))

viewFunc6Msg = "A container is an object that holds elements. This container has the\n"
                          ++ "same width and height as the window. In the middle of this\n"
                          ++ "container is the following:"
viewFunc6 : Element
viewFunc6 =
  body (padLeft 33 ' ' " container w h middle <|")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc6Msg) else (Signal.send hoveredOn ""))

viewFunc7Msg = "A collage is collection of 2D forms. The forms can be placed anywhere\n"
                        ++ "inside the collage. This collage has a width of gameWidth and a\n"
                        ++ "height of gameHeight. That is, the collage is a 600 by 400 rectangle."
viewFunc7 : Element
viewFunc7 =
  body (padLeft 38 ' ' " collage gameWidth gameHeight")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc7Msg) else (Signal.send hoveredOn ""))

viewFunc8Msg = "Inside of the collage is a rectangle with the same dimensions as the collage."
viewFunc8 : Element
viewFunc8 =
  body (padLeft 42 ' ' " [ rect gameWidth gameHeight")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc8Msg) else (Signal.send hoveredOn ""))

viewFunc9Msg = "The rectangle is filled with the purple/grey from the Elm logo."
viewFunc9 : Element
viewFunc9 =
  body (padLeft 37 ' ' " |> filled elmGrey")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc9Msg) else (Signal.send hoveredOn ""))

viewFunc10Msg = "Also in the collage is a six-sided shape with a radius fo 25."
viewFunc10 : Element
viewFunc10 =
  body (padLeft 26 ' ' " , ngon 6 25 ")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc10Msg) else (Signal.send hoveredOn ""))

viewFunc11Msg = "The hexagon is filled with the orange from the Elm logo."
viewFunc11 : Element
viewFunc11 =
  body (padLeft 39 ' ' " |> filled elmOrange")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc11Msg) else (Signal.send hoveredOn ""))

viewFunc12Msg = "The hexagon is moved to the x and y coordinates of badGuy.\n"
                            ++ "Thus the hexagon represents the antagonist in the game."
viewFunc12 : Element
viewFunc12 =
  body (padLeft 48 ' ' " |> move (badGuy.x, badGuy.y)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc12Msg) else (Signal.send hoveredOn ""))

viewFunc13Msg = "A circle with a radius of 20 is also in the collage."
viewFunc13 : Element
viewFunc13 =
  body (padLeft 26 ' ' " , circle 20")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc13Msg) else (Signal.send hoveredOn ""))

viewFunc14Msg = "The circle is filled with the blue from the Elm logo."
viewFunc14 : Element
viewFunc14 =
  body (padLeft 37 ' ' " |> filled elmBlue")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc14Msg) else (Signal.send hoveredOn ""))

viewFunc15Msg = "The circle is moved to the x and y coordinates of player1.\n"
                            ++ "Thus the circle represents the proagonist in the game."
viewFunc15 : Element
viewFunc15 =
  body (padLeft 50 ' ' " |> move (player1.x, player1.y)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc15Msg) else (Signal.send hoveredOn ""))

-- View Message 2
displayView2 : (Int, Int) -> Int -> String -> Element
displayView2 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ viewContainer2 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    , spacer 1 6
    , color grey (container containerWidth bottomHeight middle (body hoveredOn))
    ]))
    
viewContainer2 : (Int, Int) -> Element
viewContainer2 (width, height) =
  color grey (container containerWidth topHeight middle (flow down
    [ container containerWidth codeHeight midLeft (viewFunc16)
    , container containerWidth codeHeight midLeft (viewFunc17)
    , container containerWidth codeHeight midLeft (viewFunc18)
    , container containerWidth codeHeight midLeft (viewFunc19)
    , container containerWidth codeHeight midLeft (viewFunc20)
    , spacer 1 extraLine
    , container containerWidth codeHeight midLeft (elmGreyColor)
    , container containerWidth codeHeight midLeft (elmBlueColor)
    , container containerWidth codeHeight midLeft (elmGreenColor)
    , container containerWidth codeHeight midLeft (textColor)
    , container containerWidth codeHeight midLeft (txtFunc1)
    , container containerWidth codeHeight midLeft (txtFunc2)
    , container containerWidth codeHeight midLeft (msgFunc)
    ]))  

viewFunc16Msg = "The lives is also in the collage. Since only forms can exist in a\n"
                            ++ "collage, lives is transformed into a form."
viewFunc16 : Element
viewFunc16 =
  body (padLeft 29 ' ' " , toForm lives")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc15Msg) else (Signal.send hoveredOn ""))

viewFunc17Msg = "The form lives is moved to the location 0, gameHeight/2 - 40.\n"
                            ++ "That is to say, 40 pixels from the top of the game, or 0, 160."
viewFunc17 : Element
viewFunc17 =
  body (padLeft 50 ' ' " |> move (0, gameHeight/2 - 40)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc17Msg) else (Signal.send hoveredOn ""))

viewFunc18Msg = "There is one last form in the collage. The state of the game is Play,\n"
                           ++ "then there is a spacer with the width of 1 and the height of 1.\n"
                           ++ "A spacer is a place holder. If the state is Pause, then the contents\n"
                           ++ "of the variable msg appear as text."
viewFunc18 : Element
viewFunc18 =
  body (padLeft 80 ' ' " , toForm (if state == Play then spacer 1 1 else txt identity msg)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc18Msg) else (Signal.send hoveredOn ""))

viewFunc19Msg = "This last form is moved to the location 0, gameHeight/2 - 40.\n"
                            ++ "That is to say, 40 pixels from the bottom of the game, or 0, -160."
viewFunc19 : Element
viewFunc19 =
  body (padLeft 50 ' ' " |> move (0, 40 - gameHeight/2)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc19Msg) else (Signal.send hoveredOn ""))

viewFunc20Msg = "This bracket closes the list of forms found in the collage."
viewFunc20 : Element
viewFunc20 =
  body (padLeft 16 ' ' " ]")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc20Msg) else (Signal.send hoveredOn ""))

elmGreyColorMsg = "The variable elmGrey is set to color with the red value of 71,\n"
                                  ++ "the green value of 80, and the blue value of 102."
elmGreyColor : Element
elmGreyColor =
  body " elmGrey = rgb 71 80 102"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmGreyColorMsg) else (Signal.send hoveredOn ""))

elmBlueColorMsg = "The variable elmBlue is set to color with the red value of 76,\n"
                                  ++ "the green value of 166, and the blue value of 195."
elmBlueColor : Element
elmBlueColor =
  body " elmBlue = rgb 71 80 102"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmBlueColorMsg) else (Signal.send hoveredOn ""))

elmGreenColorMsg = "The variable elmGreen is set to color with the red value of 127,\n"
                                  ++ "the green value of 209, and the blue value of 17."
elmGreenColor : Element
elmGreenColor =
  body " elmGreen = rgb 71 80 102"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmGreenColorMsg) else (Signal.send hoveredOn ""))

textColorMsg = "The variable textColor is set to the value of white. This will be the color\n"
                        ++ "used for any text prefaced with txt."
textColor : Element
textColor =
  body " textColor = white"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textColorMsg) else (Signal.send hoveredOn ""))
    
txtFunc1Msg = "This function sets up the characteristics for the text used in the game. The \ntext "
                    ++ "is converted from a string, has the color textColor (or white)."
txtFunc1 : Element
txtFunc1 =
  body " txt f = Text.fromString >> Text.color textColor >> "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc1Msg) else (Signal.send hoveredOn ""))

txtFunc2Msg = "The text also has the font monospace, and is left aligned."
                    
txtFunc2 : Element
txtFunc2 =
  body (padLeft 51 ' ' " Text.monospace >> f >> Text.leftAligned")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc2Msg) else (Signal.send hoveredOn ""))

msgFuncMsg = "This string is converted to text and placed at the bottom of the game when\n"
                      ++ "the state is Pause. These are the instructions on how to play the game. &larr\n"
                      ++ "inserts a left arrow symbol. Remove the space before the semi-colon so the \nsymbol "
                      ++ "will appear. With a space &larr ;. Without a space &larr;."
msgFunc : Element
msgFunc =
  body " msg = 'SPACE to start, &larr ;&uarr ;&darr ;&rarr ; to move'"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn msgFuncMsg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section encourages the user to expand the game and make it better
*************************************************************
--}

-- Congrats
congrats : (Int, Int) -> Int -> Element
congrats (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ viewCongrats (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    ]))

viewCongrats : (Int, Int) -> Element
viewCongrats (width, height) =
  color grey (container containerWidth (topHeight + bottomHeight) midLeft (flow down
  [ container containerWidth 60 middle <| title viewCongratsMsg1
  , spacer 1 20
  , container containerWidth 100 middle <| subTitle viewCongratsMsg2
  ]))
  
viewCongratsMsg1 : String
viewCongratsMsg1 =
  "Congratulations"

viewCongratsMsg2 : String
viewCongratsMsg2 =
  "You have made the basis for a game. Now it is time\n" 
  ++ "to make it better. Advance through the next few\n"
  ++ "pages for some ideas on what you can do."

-- Idea 1
idea1 : (Int, Int) -> Int -> Element
idea1 (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ viewIdea1 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    ]))

viewIdea1 : (Int, Int) -> Element
viewIdea1 (width, height) =
  color grey (container containerWidth (topHeight + bottomHeight) midLeft (flow down
  [ container containerWidth 60 middle <| title viewIdea1Msg1
  , spacer 1 20
  , container containerWidth 350 middle <| subTitle viewIdea1Msg2
  ]))
  
viewIdea1Msg1 : String
viewIdea1Msg1 =
  "Advance to Next Level"

viewIdea1Msg2 : String
viewIdea1Msg2 =
  "Add a way to advance to the next level. Possible ways\n" 
  ++ "to beat a level could include:\n\n"
  ++ " &diams; Have a timer. When it gets to 0, you advance.\n"
  ++ " &diams; Have the player collect a certain number of shapes\n"
  ++ "    before advancing. Each shape randomly appears one at\n"
  ++ "    a time."
  
-- Idea 2
idea2 : (Int, Int) -> Int -> Element
idea2 (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ viewIdea2 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    ]))

viewIdea2 : (Int, Int) -> Element
viewIdea2 (width, height) =
  color grey (container containerWidth (topHeight + bottomHeight) midLeft (flow down
  [ container containerWidth 60 middle <| title viewIdea2Msg1
  , spacer 1 20
  , container containerWidth 150 middle <| subTitle viewIdea2Msg2
  ]))
  
viewIdea2Msg1 : String
viewIdea2Msg1 =
  "Add Another Enemy"

viewIdea2Msg2 : String
viewIdea2Msg2 =
  "To increase the difficulty, add another enemy to the game.\n\n" 
  ++ " &diams; Have them move at different speeds.\n" 
  ++ " &diams; Use a different size and shape.\n"
  ++ " &diams; Use a different color. Try the orange from\n"
  ++ "    the Elm logo - rgb 237 149 0."

-- Idea 3
idea3 : (Int, Int) -> Int -> Element
idea3 (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ viewIdea3 (width, height)
    , spacer 1 6
    , flow right
      [ size 297 40 <| color grey <| button (send chan (sig - 1)) "&larr;"
      , spacer 6 1
      , size 297 40 <| color grey <| button (send chan (sig + 1)) "&rarr;"
      ]
    ]))

viewIdea3 : (Int, Int) -> Element
viewIdea3 (width, height) =
  color grey (container containerWidth (topHeight + bottomHeight) midLeft (flow down
  [ container containerWidth 60 middle <| title viewIdea3Msg1
  , spacer 1 20
  , container containerWidth 150 middle <| subTitle viewIdea3Msg2
  ]))
  
viewIdea3Msg1 : String
viewIdea3Msg1 =
  "Change the Layout"

viewIdea3Msg2 : String
viewIdea3Msg2 =
  "When the change levels, have the background change.\n\n" 
  ++ " &diams; Use different colors to designate areas that will take\n"
  ++ "    a life if the circle touches it.\n"
  ++ " &diams; Create obstacles that they player cannot go through."