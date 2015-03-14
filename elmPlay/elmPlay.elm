import Signal (Signal, map3, foldp, subscribe, channel, send)
import Signal
import Color (..)
import Graphics.Element (..)
import Graphics.Input (hoverable)
import Text (fromString, plainText, leftAligned, centered, asText)
import Window
import Mouse
import String (padLeft)

main : Signal Element
main =
  map3 view Window.dimensions countClick (Signal.subscribe hoveredOn)

countClick : Signal Int
countClick =
  foldp (\clk count -> count + 1) 0 Mouse.clicks
  
hoveredOn : Signal.Channel String
hoveredOn = Signal.channel ""
  
type State = One | Two
state : State
state = One

view : (Int, Int) -> Int -> String -> Element
view (width, height) countClick hoveredOn =
  if | countClick == 0 -> displayWelcome (width, height) countClick
     | countClick == 1 -> importsWelcome(width, height) countClick
     | countClick == 2 -> displayImports (width, height) countClick hoveredOn
     | countClick == 3 -> signalsWelcome (width, height) countClick
     | countClick == 4 -> displaySignals (width, height) countClick hoveredOn
     | countClick == 5 -> modelWelcome (width, height) countClick
     | countClick == 6 -> displayModel1 (width, height) countClick hoveredOn
     | countClick == 7 -> displayModel2 (width, height) countClick hoveredOn
     | countClick == 8 -> updateWelcome (width, height) countClick
     | countClick == 9 -> displayUpdate1 (width, height) countClick hoveredOn
     | countClick == 10 -> displayUpdate2 (width, height) countClick hoveredOn
     | countClick == 11 -> displayUpdate3 (width, height) countClick hoveredOn
     | countClick == 12 -> displayUpdate4 (width, height) countClick hoveredOn
     | countClick == 13 -> viewWelcome (width, height) countClick
     | countClick == 14 -> displayView1 (width, height) countClick hoveredOn
     | countClick == 15 -> displayView2 (width, height) countClick hoveredOn
     | otherwise -> displayWelcome (width, height) countClick

-- These numbers are used to create the containers that hold the code examples and explinations
indent = 5
containerWidth = 200
containerHeight = 30
extraLine = 15
topHeight = 290
bottomHeight = 720

-- Welcome Message
displayWelcome : (Int, Int) -> Int -> Element
displayWelcome (width, height) countClick =
  color grey (container width height middle (flow down
    [ welcomeContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle (plainText ""))
    ]))

welcomeContainer : (Int, Int) -> Element
welcomeContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (leftAligned (fromString welcomeMsg)))
  
welcomeMsg : String
welcomeMsg =
  "Welcome to Elm Play. This tutorial will walk you through creating a video game\n"
  ++ "using the Elm language. Use the arrow to navigate through the help. \n \n"
  ++ "Hover over the lines of code in this window to see an explination of what \n"
  ++ "this particular code does. \n \n"
  ++ "Copy the code in the top window into the editor to start creating your game."

{-- 
*************************************************************
This section has all of the code for explaining the IMPORT section of the game
*************************************************************
--}

-- Imports Welcome
importsWelcome : (Int, Int) -> Int -> Element
importsWelcome (width, height) countClick =
  color grey (container width height middle (flow down
    [ importsWelcomeContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle (plainText ""))
    ]))

importsWelcomeContainer : (Int, Int) -> Element
importsWelcomeContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (centered (fromString importsWelcomeMsg)))
  
importsWelcomeMsg : String
importsWelcomeMsg =
  "Imports Section\n"
  ++ "The Imports Section loads all of the packages needed for the game."

-- Imports Message
displayImports : (Int, Int) -> Int -> String -> Element
displayImports (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ importsContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
importsContainer : (Int, Int) -> Element
importsContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (importGraphicsInput)
    , container (width - containerWidth) containerHeight midLeft (importGraphicsElement)
    , container (width - containerWidth) containerHeight midLeft (importGraphicsCollage)
    , container (width - containerWidth) containerHeight midLeft (importText)
    , container (width - containerWidth) containerHeight midLeft (importSignal)
    , container (width - containerWidth) containerHeight midLeft (importMouse)
    ]))
  
graphicsInputMsg = " Import everything from the Graphics.Input library."
importGraphicsInput : Element
importGraphicsInput =
  leftAligned(fromString " import Graphics.Input (..)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsInputMsg) else (Signal.send hoveredOn ""))

graphicsElementMsg = " Import everything from the Graphics.Element library."
importGraphicsElement : Element
importGraphicsElement =
  leftAligned(fromString " import Graphics.Element (..)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsElementMsg) else (Signal.send hoveredOn ""))

graphicsCollageMsg = " Import everything from the Graphics.Collage library."
importGraphicsCollage : Element
importGraphicsCollage =
  leftAligned(fromString " import Graphics.Collage (..)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsCollageMsg) else (Signal.send hoveredOn ""))

textMsg = " Import everything from the Text library."
importText : Element
importText =
  leftAligned(fromString " import Text (..)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textMsg) else (Signal.send hoveredOn ""))

signalMsg = " Import the Signal library."
importSignal : Element
importSignal =
  leftAligned(fromString " import Signal")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMsg) else (Signal.send hoveredOn ""))

mouseMsg = " Import everything from the Mouse library."
importMouse : Element
importMouse =
  leftAligned(fromString " import Mouse (..)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn mouseMsg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the SIGNALS section of the game
*************************************************************
--}

-- Signals Welcome
signalsWelcome : (Int, Int) -> Int -> Element
signalsWelcome (width, height) countClick =
  color grey (container width height middle (flow down
    [ signalsWelcomeContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle (plainText ""))
    ]))

signalsWelcomeContainer : (Int, Int) -> Element
signalsWelcomeContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (centered (fromString signalsWelcomeMsg)))
  
signalsWelcomeMsg : String
signalsWelcomeMsg =
  "Signals Section\n"
  ++ "Signals are values that change over time."

-- Signals Message
displaySignals : (Int, Int) -> Int -> String -> Element
displaySignals (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ signalsContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
signalsContainer : (Int, Int) -> Element
signalsContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (signalMain1)
    , container (width - containerWidth) containerHeight midLeft (signalMain2)
    , spacer 1 extraLine
    , container (width - containerWidth) containerHeight midLeft (signalGameState1)
    , container (width - containerWidth) containerHeight midLeft (signalGameState2)
    , container (width - containerWidth) containerHeight midLeft (signalGameState3)
    , spacer 1 extraLine
    , container (width - containerWidth) containerHeight midLeft (signalDelta1)
    , container (width - containerWidth) containerHeight midLeft (signalDelta2)
    , spacer 1 extraLine
    , container (width - containerWidth) containerHeight midLeft (signalInput1)
    , container (width - containerWidth) containerHeight midLeft (signalInput2)
    , container (width - containerWidth) containerHeight midLeft (signalInput3)
    , container (width - containerWidth) containerHeight midLeft (signalInput4)
    , container (width - containerWidth) containerHeight midLeft (signalInput5)
    , container (width - containerWidth) containerHeight midLeft (signalInput6)
    , container (width - containerWidth) containerHeight midLeft (signalInput7)
    , container (width - containerWidth) containerHeight midLeft (signalInput8)
    ]))
  
signalMain1Msg = "Define the main function Every Elm program must have a main."
signalMain1 : Element
signalMain1 =
  leftAligned(fromString " main =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain1Msg) else (Signal.send hoveredOn ""))

signalMain2Msg = "Map the signals Window.dimensions and gameState to the function view."
signalMain2 : Element
signalMain2 =
  leftAligned(fromString (padLeft 49 ' ' " Signal.map2 view Window.dimensions gameState"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain2Msg) else (Signal.send hoveredOn ""))

signalGameState1Msg = " Define gameState as a signal of type Game."
signalGameState1 : Element
signalGameState1 =
  leftAligned(fromString " gameState : Signal Game")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState1Msg) else (Signal.send hoveredOn ""))
    
signalGameState2Msg = " Define the specifics of gameState."
signalGameState2 : Element
signalGameState2 =
  leftAligned(fromString " gameState =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState2Msg) else (Signal.send hoveredOn ""))

signalGameState3Msg = " gameState is past dependent on defaultGame and input."
signalGameState3 : Element
signalGameState3 =
  leftAligned(fromString (padLeft 42 ' ' " Signal.foldp update defaultGame input"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState3Msg) else (Signal.send hoveredOn ""))

signalDelta1Msg = " Define specific characteristics of the delta signal."
signalDelta1 : Element
signalDelta1 =
  leftAligned(fromString " delta =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDelta1Msg) else (Signal.send hoveredOn ""))
    
signalDelta2Msg = " Notes the change in time 35 times a second, and then converts this to seconds."
signalDelta2 : Element
signalDelta2 =
  leftAligned(fromString (padLeft 34 ' ' " Signal.map inSeconds (fps 35)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDelta2Msg) else (Signal.send hoveredOn ""))

signalInput1Msg = " Defines input as a signal of type Input."
signalInput1 : Element
signalInput1 =
  leftAligned(fromString " input : Signal Input")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput1Msg) else (Signal.send hoveredOn ""))

signalInput2Msg = " Defines the specifics of input."
signalInput2 : Element
signalInput2 =
  leftAligned(fromString " input =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput2Msg) else (Signal.send hoveredOn ""))
    
signalInput3Msg = " For every delta, the specific attributes of input are updated."
signalInput3 : Element
signalInput3 =
  leftAligned(fromString (padLeft 29 ' ' " Signal.sampleOn delta <|"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput3Msg) else (Signal.send hoveredOn ""))
    
signalInput4Msg = " Maps all four attributes of Input to the update that happens every delta."
signalInput4 : Element
signalInput4 =
  leftAligned(fromString (padLeft 27 ' ' " Signal.map4 Input"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput4Msg) else (Signal.send hoveredOn ""))

signalInput5Msg = " Gives a true or false based upon the space bar being pressed."
signalInput5 : Element
signalInput5 =
  leftAligned(fromString (padLeft 29 ' ' " Keyboard.space"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput5Msg) else (Signal.send hoveredOn ""))

signalInput6Msg = " Updates the x attribute based upon left/right arrow being pressed."
signalInput6 : Element
signalInput6 =
  leftAligned(fromString (padLeft 46 ' ' " (Signal.map .x Keyboard.arrows)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput6Msg) else (Signal.send hoveredOn ""))

signalInput7Msg = " Updates the y attribute based upon up/down arrow being pressed."
signalInput7 : Element
signalInput7 =
  leftAligned(fromString (padLeft 46 ' ' " (Signal.map .y Keyboard.arrows)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput7Msg) else (Signal.send hoveredOn ""))

signalInput8Msg = " Updates delta with the new time."
signalInput8 : Element
signalInput8 =
  leftAligned(fromString (padLeft 20 ' ' " delta"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput8Msg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the MODEL section of the game
*************************************************************
--}

-- Model Welcome
modelWelcome : (Int, Int) -> Int -> Element
modelWelcome (width, height) countClick =
  color grey (container width height middle (flow down
    [ modelWelcomeContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle (plainText ""))
    ]))

modelWelcomeContainer : (Int, Int) -> Element
modelWelcomeContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (centered (fromString modelWelcomeMsg)))
  
modelWelcomeMsg : String
modelWelcomeMsg =
  "Model Section\n"
  ++ "The Model Section sets up the characteristics for each object used in the game."

-- Model Message 1
displayModel1 : (Int, Int) -> Int -> String -> Element
displayModel1 (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ modelContainer1 (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
modelContainer1 : (Int, Int) -> Element
modelContainer1 (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (gameSize)
    , container (width - containerWidth) containerHeight midLeft (playingSize)
    , spacer 1 extraLine
    , container (width - containerWidth) containerHeight midLeft (typeState)
    , spacer 1 extraLine
    , container (width - containerWidth) containerHeight midLeft (aliasBadGuy1)
    , container (width - containerWidth) containerHeight midLeft (aliasBadGuy2)
    , spacer 1 extraLine
    , container (width - containerWidth) containerHeight midLeft (aliasPlayer1)
    , container (width - containerWidth) containerHeight midLeft (aliasPlayer2)
    , spacer 1 extraLine
    , container (width - containerWidth) containerHeight midLeft (aliasGame1)
    , container (width - containerWidth) containerHeight midLeft (aliasGame2)
    ]))
  
gameSizeMsg = "Set the variable gameWidth to 600 and variable gameHeight to 400."
gameSize : Element
gameSize =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn gameSizeMsg) else (Signal.send hoveredOn ""))

playingSizeMsg = " Set variable halfWidth to 300 and variable halfHeight to 200."
playingSize : Element
playingSize =
  leftAligned(fromString " (halfWidth, halfHeight) = (300, 200)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn playingSizeMsg) else (Signal.send hoveredOn ""))
    
typeStateMsg = " Create type State and indicate it can have either the value Play or Pause."
typeState : Element
typeState =
  leftAligned(fromString " type State = Play | Pause")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn typeStateMsg) else (Signal.send hoveredOn ""))

aliasBadGuy1Msg = " Create a type alias BadGuy with the following characteristics."
aliasBadGuy1 : Element
aliasBadGuy1 =
  leftAligned(fromString " type alias BadGuy =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy1Msg) else (Signal.send hoveredOn ""))
    
aliasBadGuy2Msg = "Objects of type BadGuy have an x value of type float, a y value of type float,\n"
                              ++ "a vx value of type Float, and a vy value of type float.\n"
                              ++ "Floats are numbers with a decimal."
aliasBadGuy2 : Element
aliasBadGuy2 =
  leftAligned(fromString (padLeft 45 ' ' " { x:Float, y:Float, vx:Float, vy:Float }"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy2Msg) else (Signal.send hoveredOn ""))

aliasPlayer1Msg = " Create a type alias Player with the following characteristics."
aliasPlayer1 : Element
aliasPlayer1 =
  leftAligned(fromString " type alias Player =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer1Msg) else (Signal.send hoveredOn ""))

aliasPlayer2Msg = "Objects of type Player have an x value of type float, a y value of type float,\n"
                              ++ "a vx value of type Float, a vy value of type float, and a lives value of type integer.\n"
                              ++ "Floats are numbers with a decimal, and integers are number without decimals."
aliasPlayer2 : Element
aliasPlayer2 =
  leftAligned(fromString (padLeft 56 ' ' " { x:Float, y:Float, vx:Float, vy:Float, lives:Int }"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer2Msg) else (Signal.send hoveredOn ""))

aliasGame1Msg = " Create a type alias Game with the following characteristics."
aliasGame1 : Element
aliasGame1 =
  leftAligned(fromString " type alias Game =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame1Msg) else (Signal.send hoveredOn ""))

aliasGame2Msg = "Objects of type Game have a value state of type State,\n"
                           ++ "a value badGuy of type BadGuy, and a value of player1 of type Player."
aliasGame2 : Element
aliasGame2 =
  leftAligned(fromString (padLeft 51 ' ' " { state:State, badGuy:BadGuy, player1:Player }"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame2Msg) else (Signal.send hoveredOn ""))

-- Model Message 2
displayModel2 : (Int, Int) -> Int -> String -> Element
displayModel2 (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ modelContainer2 (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
modelContainer2 : (Int, Int) -> Element
modelContainer2 (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (defaultGame1)
    , container (width - containerWidth) containerHeight midLeft (defaultGame2)
    , container (width - containerWidth) containerHeight midLeft (defaultGame3)
    , container (width - containerWidth) containerHeight midLeft (defaultGame4)
    , container (width - containerWidth) containerHeight midLeft (defaultGame5)
    , container (width - containerWidth) containerHeight midLeft (defaultGame6)
    , spacer 1 extraLine
    , container (width - containerWidth) containerHeight midLeft (aliasInput1)
    , container (width - containerWidth) containerHeight midLeft (aliasInput2)
    , container (width - containerWidth) containerHeight midLeft (aliasInput3)
    , container (width - containerWidth) containerHeight midLeft (aliasInput4)
    , container (width - containerWidth) containerHeight midLeft (aliasInput5)
    , container (width - containerWidth) containerHeight midLeft (aliasInput6)
    ]))

defaultGame1Msg = " Create an object defaultGame of type Game."
defaultGame1 : Element
defaultGame1 =
  leftAligned(fromString " defaultGame : Game")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame1Msg) else (Signal.send hoveredOn ""))

defaultGame2Msg = " Assign each attribute of defaultGame with the following values."
defaultGame2 : Element
defaultGame2 =
  leftAligned(fromString " defaultGame =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame2Msg) else (Signal.send hoveredOn ""))

defaultGame3Msg = " The state attribute has a value of Pause."
defaultGame3 : Element
defaultGame3 =
  leftAligned(fromString (padLeft 20 ' ' " { state = Pause"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame3Msg) else (Signal.send hoveredOn ""))

defaultGame4Msg = " The badGuy attributes have an x value of 0, a y value of 0, a vx value of 300,\n"
                              ++ "and a vy value of 300. The x and y values are used for the badGuy's postion,\n"
                              ++ "and the vx and vy values are the velocity (think speed) of the badGuy."
defaultGame4 : Element
defaultGame4 =
  leftAligned(fromString (padLeft 44 ' ' " , badGuy = { x=0, y=0, vx=300, vy=300 }"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame4Msg) else (Signal.send hoveredOn ""))

defaultGame5Msg = " The player1 attributes have an x value of 15-halfWidth (or -285), a y value of 0,\n"
                              ++ " a vx value of 300, and a vy value of 300. The x and y values are used for the player1's postion,\n"
                              ++ "and the vx and vy values are the velocity (think speed) of the player1. player1 also has 3 lives."
defaultGame5 : Element
defaultGame5 =
  leftAligned(fromString (padLeft 71 ' ' " , player1 = { x = 15-halfWidth, y = 0, vx = 0, vy = 0, lives = 3 }"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame5Msg) else (Signal.send hoveredOn ""))

defaultGame6Msg = " End the list of attributes for defaultGame."
defaultGame6 : Element
defaultGame6 =
  leftAligned(fromString (padLeft 6 ' ' " }"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame6Msg) else (Signal.send hoveredOn ""))

aliasInput1Msg = " Create a type alias Input with the following characteristics."
aliasInput1 : Element
aliasInput1 =
  leftAligned(fromString " type alias Input =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput1Msg) else (Signal.send hoveredOn ""))

aliasInput2Msg = " Objects of type Input has an attribute called space with a boolean value.\n"
                          ++ "Boolean means either true or false."
aliasInput2 : Element
aliasInput2 =
  leftAligned(fromString (padLeft 19 ' ' " { space : Bool"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput2Msg) else (Signal.send hoveredOn ""))

aliasInput3Msg = " Objects of type Input has an attribute called dir2 with a integer value.\n"
                          ++ "Integer means a number without a decimal."
aliasInput3 : Element
aliasInput3 =
  leftAligned(fromString (padLeft 17 ' ' " , dir1 : Int"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput3Msg) else (Signal.send hoveredOn ""))

aliasInput4Msg = " Objects of type Input has an attribute called dir2 with a integer value.\n"
                          ++ "Integer means a number without a decimal."
aliasInput4 : Element
aliasInput4 =
  leftAligned(fromString (padLeft 17 ' ' " , dir2 : Int"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput4Msg) else (Signal.send hoveredOn ""))

aliasInput5Msg = " Objects fo type Input have an attribute called delta with a Time value."
aliasInput5 : Element
aliasInput5 =
  leftAligned(fromString (padLeft 19 ' ' " , delta : Time"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput5Msg) else (Signal.send hoveredOn ""))

aliasInput6Msg = " End the list of attributes for Input."
aliasInput6 : Element
aliasInput6 =
  leftAligned(fromString (padLeft 6 ' ' " }"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput6Msg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the UPDATE section of the game
*************************************************************
--}

-- Update Welcome
updateWelcome : (Int, Int) -> Int -> Element
updateWelcome (width, height) countClick =
  color grey (container width height middle (flow down
    [ updateWelcomeContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle (plainText""))
    ]))

updateWelcomeContainer : (Int, Int) -> Element
updateWelcomeContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (centered (fromString updateWelcomeMsg)))
  
updateWelcomeMsg : String
updateWelcomeMsg =
  "Update Section\n"
  ++ "The Update Section changes the values for each object\n if the user has provided input."

-- Update Message 1
displayUpdate1 : (Int, Int) -> Int -> String -> Element
displayUpdate1 (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ updateContainer1 (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
updateContainer1 : (Int, Int) -> Element
updateContainer1 (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (updateFunc1)
    , container (width - containerWidth) containerHeight midLeft (updateFunc2)
    , container (width - containerWidth) containerHeight midLeft (updateFunc3)
    , container (width - containerWidth) containerHeight midLeft (updateFunc4)
    , container (width - containerWidth) containerHeight midLeft (updateFunc5)
    , container (width - containerWidth) containerHeight midLeft (updateFunc6)
    , container (width - containerWidth) containerHeight midLeft (updateFunc7)
    , container (width - containerWidth) containerHeight midLeft (updateFunc8)
    , container (width - containerWidth) containerHeight midLeft (updateFunc9)
    , container (width - containerWidth) containerHeight midLeft (updateFunc10)
    , container (width - containerWidth) containerHeight midLeft (updateFunc11)
    , container (width - containerWidth) containerHeight midLeft (updateFunc12)
    , container (width - containerWidth) containerHeight midLeft (updateFunc13)
    , container (width - containerWidth) containerHeight midLeft (updateFunc14)
    , container (width - containerWidth) containerHeight midLeft (updateFunc15)
    , container (width - containerWidth) containerHeight midLeft (updateFunc16)
    , container (width - containerWidth) containerHeight midLeft (updateFunc17)
    ]))
  
updateFunc1Msg = "Update is a function that takes an object of type Input, an object of type\n"
                          ++ "Game, and returns a Game."
updateFunc1 : Element
updateFunc1 =
  leftAligned(fromString " update : Input -> Game -> Game")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc1Msg) else (Signal.send hoveredOn ""))

updateFunc2Msg = "Specifically, update takes Input in the form of space, dir1, dir2, and delta\n"
                          ++ "The Game is defined as state, badGuy, and player1."
updateFunc2 : Element
updateFunc2 =
  leftAligned(fromString " update {space,dir1,dir2,delta} ({state,badGuy,player1} as game) =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc2Msg) else (Signal.send hoveredOn ""))

updateFunc3Msg = "The let expression assigns the value of 1 to lives if badGuy is within player1.\n"
                          ++ "If not, the value of 0 is assigned to lives. The function within is defined below."
updateFunc3 : Element
updateFunc3 =
  leftAligned(fromString " let lives = if (badGuy `within` player1) then 1 else 0")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc3Msg) else (Signal.send hoveredOn ""))

updateFunc4Msg = "The function newState assumes a value dependent upon the cases below:\n"
updateFunc4 : Element
updateFunc4 =
  leftAligned(fromString " newState =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc4Msg) else (Signal.send hoveredOn ""))

updateFunc5Msg = "If the space bar is pressed, then newState takes the value Play."
updateFunc5 : Element
updateFunc5 =
  leftAligned(fromString " if  | space              -> Play")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc5Msg) else (Signal.send hoveredOn ""))

updateFunc6Msg = "NewState assumes the value of Pause if player1.lives is 0. That is, the game\n"
                          ++ "stops when the player runs out of lives."
updateFunc6 : Element
updateFunc6 =
  leftAligned(fromString " | player1.lives == 0 -> Pause")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc6Msg) else (Signal.send hoveredOn ""))

updateFunc7Msg = "In all other cases, newState assumes the value of state. That is, nothing changes."
updateFunc7 : Element
updateFunc7 =
  leftAligned(fromString " | otherwise          -> state")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc7Msg) else (Signal.send hoveredOn ""))

updateFunc8Msg = "The function newBadGuy assumes the value dependent upong the following cases:"
updateFunc8 : Element
updateFunc8 =
  leftAligned(fromString " newBadGuy =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc8Msg) else (Signal.send hoveredOn ""))

updateFunc9Msg = "If the value of state is equal to Pause, the do the following thing.\n"
                          ++ "an element. A tupple is two numbers grouped together by parentheses.\n"
                          ++ "An integer is a number without a decimal."
updateFunc9 : Element
updateFunc9 =
  leftAligned(fromString " if state == Pause")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc9Msg) else (Signal.send hoveredOn ""))

updateFunc10Msg = "The function newBadGuy takes the value badGuy. That is, nothing changes."
updateFunc10 : Element
updateFunc10 =
  leftAligned(fromString " then badGuy")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc10Msg) else (Signal.send hoveredOn ""))

updateFunc11Msg = "When state equals Play, then call the function updateBadGuy, which defined below.\n"
                              ++ "updateBadGuy takes delta, badGuy, and player1."
updateFunc11 : Element
updateFunc11 =
  leftAligned(fromString " else updateBadGuy delta badGuy player1")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc11Msg) else (Signal.send hoveredOn ""))

updateFunc12Msg = "The in part of the let expression tells us how the above information will be used."
updateFunc12 : Element
updateFunc12 =
  leftAligned(fromString " in")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc12Msg) else (Signal.send hoveredOn ""))

updateFunc13Msg = "Game will have its attributes updated."
updateFunc13 : Element
updateFunc13 =
  leftAligned(fromString " { game |")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc13Msg) else (Signal.send hoveredOn ""))

updateFunc14Msg = "State will assume the value of newState."
updateFunc14 : Element
updateFunc14 =
  leftAligned(fromString " state   <- newState,")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc14Msg) else (Signal.send hoveredOn ""))

updateFunc15Msg = "BadGuy assumes the value of newBadGuy."
updateFunc15 : Element
updateFunc15 =
  leftAligned(fromString " badGuy  <- newBadGuy,")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc15Msg) else (Signal.send hoveredOn ""))

updateFunc16Msg = "Player1 assumes the value of updatePlayer which needs delta, dir1, dir2,\n"
                                ++ "lives, and player1. The function updatePlayer is defined below."
updateFunc16 : Element
updateFunc16 =
  leftAligned(fromString " player1 <- updatePlayer delta dir1 dir2 lives player1")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc16Msg) else (Signal.send hoveredOn ""))

updateFunc17Msg = "This bracket closes the update function."
updateFunc17 : Element
updateFunc17 =
  leftAligned(fromString " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc17Msg) else (Signal.send hoveredOn ""))

-- Update Message 2
displayUpdate2 : (Int, Int) -> Int -> String -> Element
displayUpdate2 (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ updateContainer2 (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
updateContainer2 : (Int, Int) -> Element
updateContainer2 (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (updateBadGuy1)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy2)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy3)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy4)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy5)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy6)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy7)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy8)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy9)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy10)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy11)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy12)
    , container (width - containerWidth) containerHeight midLeft (updateBadGuy13)
    ]))
  
updateBadGuy1Msg = "The function updateBadGuy takes a Time, a BadGuy, and a Player.\n"
                          ++ "The function returns a type of BadGuy."
updateBadGuy1 : Element
updateBadGuy1 =
  leftAligned(fromString " updateBadGuy : Time -> BadGuy -> Player -> BadGuy")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy1Msg) else (Signal.send hoveredOn ""))

updateBadGuy2Msg = "UpdateBadGuy takes t as time; the x, y, vx, and vy values of badGuy;\n"
                          ++ "and the x, y, vx, and vy values of player1."
updateBadGuy2 : Element
updateBadGuy2 =
  leftAligned(fromString " updateBadGuy t ({x,y,vx,vy} as badGuy) ({x,y,vx,vy,lives} as player1) =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy2Msg) else (Signal.send hoveredOn ""))

updateBadGuy3Msg = "If player1 has no more lives, then the x and y values of badGuy are set to 0."
updateBadGuy3 : Element
updateBadGuy3 =
  leftAligned(fromString " if | (player1.lives == 0) -> { badGuy | x <- 0, y <- 0}")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

updateBadGuy4Msg = "If badGuy is touching player1, then the function physicsUpdate is called\n"
                          ++ "with t (time)."
updateBadGuy4 : Element
updateBadGuy4 =
  leftAligned(fromString " | (badGuy `within` player1) -> physicsUpdate t")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy4Msg) else (Signal.send hoveredOn ""))

updateBadGuy5Msg = "This bit of code is setting forth attributes of badGuy that will be modified."
updateBadGuy5 : Element
updateBadGuy5 =
  leftAligned(fromString " { badGuy |")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy5Msg) else (Signal.send hoveredOn ""))

updateBadGuy6Msg = "The vx value of badGuy takes the result of the stepV funtion which takes the\n"
                                  ++ "the true or false value for the conditional statements."
updateBadGuy6 : Element
updateBadGuy6 =
  leftAligned(fromString " vx <- stepV vx (badGuy.vx < 0) (badGuy.vx > 0),")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy6Msg) else (Signal.send hoveredOn ""))

updateBadGuy7Msg = "The vx value of badGuy takes the result of the stepV funtion which takes the\n"
                                  ++ "the true or false value for the conditional statements."
updateBadGuy7 : Element
updateBadGuy7 =
  leftAligned(fromString " vy <- stepV vy (badGuy.vy < 0 ) (badGuy.vy > 0)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy7Msg) else (Signal.send hoveredOn ""))

updateBadGuy8Msg = "The bracket ends the attributes of badGuy which are modified."
updateBadGuy8 : Element
updateBadGuy8 =
  leftAligned(fromString " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy8Msg) else (Signal.send hoveredOn ""))

updateBadGuy9Msg = "In all other cases, the function physicsUpdate will be called with different arguments."
updateBadGuy9 : Element
updateBadGuy9 =
  leftAligned(fromString " | otherwise -> physicsUpdate t")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy9Msg) else (Signal.send hoveredOn ""))

updateBadGuy10Msg = "Once again, some of the attributes of badGuy will be modified."
updateBadGuy10 : Element
updateBadGuy10 =
  leftAligned(fromString " { badGuy |")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy10Msg) else (Signal.send hoveredOn ""))

updateBadGuy11Msg = "The value vx takes the result of the function stepV. This is checking to see if\n"
                                    ++ "the badGuy is going outside the game area. The number 25 is used\n"
                                    ++ "that is the radius of badGuy. This will keep it in the game area."
updateBadGuy11 : Element
updateBadGuy11 =
  leftAligned(fromString " vx <- stepV vx (x < 25-halfWidth) (x > halfWidth-25),")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy11Msg) else (Signal.send hoveredOn ""))

updateBadGuy12Msg = "The value vx takes the result of the function stepV. This is checking to see if\n"
                                    ++ "the badGuy is going outside the game area. The number 25 is used\n"
                                    ++ "that is the radius of badGuy. This will keep it in the game area."
updateBadGuy12 : Element
updateBadGuy12 =
  leftAligned(fromString " vy <- stepV vy (y < 25-halfHeight) (y > halfHeight-25)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy12Msg) else (Signal.send hoveredOn ""))

updateBadGuy13Msg = "The bracket ends the attributes of badGuy which are modified."
updateBadGuy13 : Element
updateBadGuy13 =
  leftAligned(fromString " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

-- Update Message 3
displayUpdate3 : (Int, Int) -> Int -> String -> Element
displayUpdate3 (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ updateContainer3 (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
updateContainer3 : (Int, Int) -> Element
updateContainer3 (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (updatePlayer1)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer2)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer3)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer4)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer5)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer6)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer7)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer8)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer9)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer10)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer11)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer12)
    , container (width - containerWidth) containerHeight midLeft (updatePlayer13)
    ]))
  
updatePlayer1Msg = "This defines the function updatePlayer, which takes a time, an integer, another\n"
                          ++ "integer, another integer, a player, and returns a player."
updatePlayer1 : Element
updatePlayer1 =
  leftAligned(fromString " updatePlayer : Time -> Int -> Int -> Int -> Player -> Player")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer1Msg) else (Signal.send hoveredOn ""))

updatePlayer2Msg = "The function updatePlayer is called with t, dir1, dir2, lives, and player."
updatePlayer2 : Element
updatePlayer2 =
  leftAligned(fromString " updatePlayer t dir1 dir2 lives player =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer2Msg) else (Signal.send hoveredOn ""))

updatePlayer3Msg = "An object player1 is created. Its attributes of vx and vy are set to the values created\n"
                              ++ "by the function physicsUpdate, which takes time t. and player.\n"
                              ++ "The updated vy attribute takes the value of dir2 multiplied by 200. However, dir2\n"
                              ++ "multiplied by 200 is an integer. The value vy is a float. The toFloat function converts\n"
                              ++ "an integer into a float."
updatePlayer3 : Element
updatePlayer3 =
  leftAligned(fromString (padLeft 73 ' ' " let player1 = physicsUpdate  t { player | vx <- toFloat dir1 * 200,"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

updatePlayer4Msg = "The updated vy attribute takes the value of dir2 multiplied by 200. However, dir2\n"
                              ++ "multiplied by 200 is an integer. The value vy is a float. The toFloat function converts\n"
                              ++ "an integer into a float."
updatePlayer4 : Element
updatePlayer4 =
  leftAligned(fromString (padLeft 93 ' ' " vy <- toFloat dir2 * 200}"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer4Msg) else (Signal.send hoveredOn ""))

updatePlayer5Msg = "This is a conditional statement tha wants to know if player.lives minus lives is\n"
                               ++ "is greater than 0. Conditinals return true or false."
updatePlayer5 : Element
updatePlayer5 =
  leftAligned(fromString (padLeft 48 ' ' " alive = if (player.lives - lives < 0)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer5Msg) else (Signal.send hoveredOn ""))

updatePlayer6Msg = "If the previous conditional statement is true, then alives takes the value of 0."
updatePlayer6 : Element
updatePlayer6 =
  leftAligned(fromString (padLeft 22 ' ' " then 0"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer6Msg) else (Signal.send hoveredOn ""))

updatePlayer7Msg = "If the previous conditional statement is not true, then alive will equal player.lives\n"
                              ++ "minus the value of lives."
updatePlayer7 : Element
updatePlayer7 =
  leftAligned(fromString (padLeft 43 ' ' " else (player.lives - lives)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer7Msg) else (Signal.send hoveredOn ""))

updatePlayer8Msg = "This is the second part of the let statement. The newly introduced alive will be\n"
                               ++ "used below."
updatePlayer8 : Element
updatePlayer8 =
  leftAligned(fromString (padLeft 8 ' ' " in"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer8Msg) else (Signal.send hoveredOn ""))

updatePlayer9Msg = "This says that within player1, the following attributes will be updated."
updatePlayer9 : Element
updatePlayer9 =
  leftAligned(fromString (padLeft 22 ' ' " { player1 |"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer9Msg) else (Signal.send hoveredOn ""))

updatePlayer10Msg = "The updated attribute y takes the value of player1.y. However, the value is\n"
                                ++ "limited (or clamped) to any number between 35 - halfHeight (-165) and\n"
                                ++ "halfHeight - 35 (165)."
updatePlayer10 : Element
updatePlayer10 =
  leftAligned(fromString (padLeft 69 ' ' " y <- clamp (35-halfHeight) (halfHeight-35) player1.y,"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer10Msg) else (Signal.send hoveredOn ""))

updatePlayer11Msg = "The updated attribute x takes the value of player1.x. However, the value is\n"
                                ++ "limited (or clamped) to any number between 35 - halfWidth (-265) and\n"
                                ++ "halfWidth-35 (265)."
updatePlayer11 : Element
updatePlayer11 =
  leftAligned(fromString (padLeft 67 ' ' " x <- clamp (35-halfWidth) (halfWidth-35) player1.x,"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer11Msg) else (Signal.send hoveredOn ""))

updatePlayer12Msg = "The updated attribute lives takes the value of alive."
updatePlayer12 : Element
updatePlayer12 =
  leftAligned(fromString (padLeft 30 ' ' " lives <- alive"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer12Msg) else (Signal.send hoveredOn ""))

updatePlayer13Msg = "This bracket the update for player1."
updatePlayer13 : Element
updatePlayer13 =
  leftAligned(fromString (padLeft 12 ' ' " }"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

-- Update Message 4
displayUpdate4 : (Int, Int) -> Int -> String -> Element
displayUpdate4 (width, height) countClick hoveredOn=
  color grey (container width height middle (flow down
    [ updateContainer4 (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
updateContainer4 : (Int, Int) -> Element
updateContainer4 (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (updatePhysics1)
    , container (width - containerWidth) containerHeight midLeft (updatePhysics2)
    , container (width - containerWidth) containerHeight midLeft (updatePhysics3)
    , container (width - containerWidth) containerHeight midLeft (updatePhysics4)
    , container (width - containerWidth) containerHeight midLeft (updatePhysics5)
    , container (width - containerWidth) containerHeight midLeft (updateNear1)
    , container (width - containerWidth) containerHeight midLeft (updateNear2)
    , container (width - containerWidth) containerHeight midLeft (updateWithin1)
    , container (width - containerWidth) containerHeight midLeft (updateWithin2)
    , container (width - containerWidth) containerHeight midLeft (updateStepV1)
    , container (width - containerWidth) containerHeight midLeft (updateStepV2)
    , container (width - containerWidth) containerHeight midLeft (updateStepV3)
    , container (width - containerWidth) containerHeight midLeft (updateStepV4)
    ]))
  
updatePhysics1Msg = "The function updatePhysics takes t (time) and the values of x, y, vx, and vy\n"
                          ++ "which are treated as one object."
updatePhysics1 : Element
updatePhysics1 =
  leftAligned(fromString " physicsUpdate t ({x,y,vx,vy} as obj) =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics1Msg) else (Signal.send hoveredOn ""))

updatePhysics2Msg = "This line of code means that the object will have its attribures modified."
updatePhysics2 : Element
updatePhysics2 =
  leftAligned(fromString " { obj |")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics2Msg) else (Signal.send hoveredOn ""))

updatePhysics3Msg = "The x attribute becomes x plus vx multiplied by t."
updatePhysics3 : Element
updatePhysics3 =
  leftAligned(fromString " x <- x + vx * t,")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics3Msg) else (Signal.send hoveredOn ""))

updatePhysics4Msg = "The y attribute becomes y plus vy multiplied by t."
updatePhysics4 : Element
updatePhysics4 =
  leftAligned(fromString " y <- y + vy * t")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics4Msg) else (Signal.send hoveredOn ""))

updatePhysics5Msg = "This brakcet closes the updatePhysics function."
updatePhysics5 : Element
updatePhysics5 =
  leftAligned(fromString " }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics5Msg) else (Signal.send hoveredOn ""))

updateNear1Msg = "The function near takes three arguments: k, c, and n. It determines if two objects\n"
                            ++ "(k and n) are near one another based upon a third number (c)."
updateNear1 : Element
updateNear1 =
  leftAligned(fromString " near k c n =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateNear1Msg) else (Signal.send hoveredOn ""))

updateNear2Msg = "This is the logic equation to determine if two objects are touching."
updateNear2 : Element
updateNear2 =
  leftAligned(fromString " n >= k-c && n <= k+c")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateNear2Msg) else (Signal.send hoveredOn ""))

updateWithin1Msg = "The function within takes badGuy and player1 and determines if they are touching."
updateWithin1 : Element
updateWithin1 =
  leftAligned(fromString " within badGuy player1 =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin1Msg) else (Signal.send hoveredOn ""))

updateWithin2Msg = "The function within calls the function near, and passes it the x positions of player1\n"
                                ++ "and badGuy, as well as the number 25. 25 is used because that is the radius of\n"
                                ++ "badGuy. This also checks to see if the y positions are touching as well."
updateWithin2 : Element
updateWithin2 =
  leftAligned(fromString " near player1.x 25 badGuy.x && near player1.y 25 badGuy.y")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin2Msg) else (Signal.send hoveredOn ""))

updateStepV1Msg = "The defines what the function stepV does. It takes two conditions (true of false)\n"
                              ++ "and a third term, v. StepV is used to bounce badGuy off of the edges of the\n"
                              ++ "game area."
updateStepV1 : Element
updateStepV1 =
  leftAligned(fromString " stepV v condition1 condition2 =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV1Msg) else (Signal.send hoveredOn ""))

updateStepV2Msg = "If condition1 is true, then stepV returns the absolute value of v. This bounces\n"
                              ++ "badGuy off of the left and bottom edges of the game area."
updateStepV2 : Element
updateStepV2 =
  leftAligned(fromString " if | condition1 -> abs v")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV2Msg) else (Signal.send hoveredOn ""))

updateStepV3Msg = "If condition2 is true, then stepV returns 0 - the absolute value of v. This bounces\n"
                              ++ "badGuy off of the right and top edges of the game area."
updateStepV3 : Element
updateStepV3 =
  leftAligned(fromString " | condition2 -> 0 - abs v")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV3Msg) else (Signal.send hoveredOn ""))

updateStepV4Msg = "In all other cases, stepV returns the value of v. If badGuy is not touching any\n"
                              ++ "edges, then do not change the direction; keep going in the same direction."
updateStepV4 : Element
updateStepV4 =
  leftAligned(fromString " | otherwise  -> v")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV4Msg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the VIEW section of the game
*************************************************************
--}

-- View Welcome
viewWelcome : (Int, Int) -> Int -> Element
viewWelcome (width, height) countClick =
  color grey (container width height middle (flow down
    [ viewWelcomeContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle (plainText ""))
    ]))

viewWelcomeContainer : (Int, Int) -> Element
viewWelcomeContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (centered (fromString viewWelcomeMsg)))
  
viewWelcomeMsg : String
viewWelcomeMsg =
  "View Section\n"
  ++ "The View Section displays the game to the computer screen."

-- View Message 1
displayView1 : (Int, Int) -> Int -> String -> Element
displayView1 (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ viewContainer1 (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
viewContainer1 : (Int, Int) -> Element
viewContainer1 (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (viewFunc1)
    , container (width - containerWidth) containerHeight midLeft (viewFunc2)
    , container (width - containerWidth) containerHeight midLeft (viewFunc3)
    , container (width - containerWidth) containerHeight midLeft (viewFunc4)
    , container (width - containerWidth) containerHeight midLeft (viewFunc5)
    , container (width - containerWidth) containerHeight midLeft (viewFunc6)
    , container (width - containerWidth) containerHeight midLeft (viewFunc7)
    , container (width - containerWidth) containerHeight midLeft (viewFunc8)
    , container (width - containerWidth) containerHeight midLeft (viewFunc9)
    , container (width - containerWidth) containerHeight midLeft (viewFunc10)
    , container (width - containerWidth) containerHeight midLeft (viewFunc11)
    , container (width - containerWidth) containerHeight midLeft (viewFunc12)
    , container (width - containerWidth) containerHeight midLeft (viewFunc13)
    , container (width - containerWidth) containerHeight midLeft (viewFunc14)
    , container (width - containerWidth) containerHeight midLeft (viewFunc15)
    ]))
  
viewFunc1Msg = "The function view takes a tupple of integers and a game, and the function returns\n"
                          ++ "an element. A tupple is two numbers grouped together by parentheses. An\n"
                          ++ "integer is a number without a decimal."
viewFunc1 : Element
viewFunc1 =
  leftAligned(fromString " view : (Int, Int) -> Game -> Element")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc1Msg) else (Signal.send hoveredOn ""))

viewFunc2Msg = "The function view is passed the width and height of the window, as well as\n."
                          ++ "the attributes state, badGuy, and player1 all of which are a part of\n"
                          ++ "the data type Game."
viewFunc2 : Element
viewFunc2 =
  leftAligned(fromString " view (w, h) {state, badGuy, player1} =")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc2Msg) else (Signal.send hoveredOn ""))

viewFunc3Msg = "The let expression creates an object lives, which is of type element."
viewFunc3 : Element
viewFunc3 =
  leftAligned(fromString (padLeft 24 ' ' " let lives : Element"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc3Msg) else (Signal.send hoveredOn ""))

viewFunc4Msg = "The objecct lives is assigned the value of player1.lives, which is the\n"
                          ++ "remaining lives of player1. The object lives is converted to a string,\n"
                          ++ "and has a size of 50."
viewFunc4 : Element
viewFunc4 =
  leftAligned(fromString (padLeft 62 ' ' " lives = txt(Text.height 50) (toString player1.lives)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc4Msg) else (Signal.send hoveredOn ""))

viewFunc5Msg = "In is part of the let expression, and indicates where the newly defined\n"
                          ++ "will be used."
viewFunc5 : Element
viewFunc5 =
  leftAligned(fromString (padLeft 7 ' ' " in"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc5Msg) else (Signal.send hoveredOn ""))

viewFunc6Msg = "A container is an object that holds elements. This container has the\n"
                          ++ "same width and height as the window. In the middle of this\n"
                          ++ "container is the following:"
viewFunc6 : Element
viewFunc6 =
  leftAligned(fromString (padLeft 33 ' ' " container w h middle <|"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc6Msg) else (Signal.send hoveredOn ""))

viewFunc7Msg = "A collage is collection of 2D forms. The forms can be placed anywhere\n"
                        ++ "inside the collage. This collage has a width of gameWidth and a\n"
                        ++ "height of gameHeight. That is, the collage is a 600 by 400 rectangle."
viewFunc7 : Element
viewFunc7 =
  leftAligned(fromString (padLeft 38 ' ' " collage gameWidth gameHeight"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc7Msg) else (Signal.send hoveredOn ""))

viewFunc8Msg = "Inside of the collage is a rectangle with the same dimensions as the collage."
viewFunc8 : Element
viewFunc8 =
  leftAligned(fromString (padLeft 42 ' ' " [ rect gameWidth gameHeight"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc8Msg) else (Signal.send hoveredOn ""))

viewFunc9Msg = "The rectangle is filled with the color specified by the variable backgroudColor."
viewFunc9 : Element
viewFunc9 =
  leftAligned(fromString (padLeft 45 ' ' " |> filled backgroundColor"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc9Msg) else (Signal.send hoveredOn ""))

viewFunc10Msg = "Also in the collage is a six-sided shape with a radius fo 25."
viewFunc10 : Element
viewFunc10 =
  leftAligned(fromString (padLeft 26 ' ' " , ngon 6 25 "))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc10Msg) else (Signal.send hoveredOn ""))

viewFunc11Msg = "The hexagon is filled with the color light orange."
viewFunc11 : Element
viewFunc11 =
  leftAligned(fromString (padLeft 41 ' ' " |> filled lightOrange"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc11Msg) else (Signal.send hoveredOn ""))

viewFunc12Msg = "The hexagon is moved to the x and y coordinates of badGuy.\n"
                            ++ "Thus the hexagon represents the antagonist in the game."
viewFunc12 : Element
viewFunc12 =
  leftAligned(fromString (padLeft 48 ' ' " |> move (badGuy.x, badGuy.y)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc12Msg) else (Signal.send hoveredOn ""))

viewFunc13Msg = "A circle with a radius of 20 is also in the collage."
viewFunc13 : Element
viewFunc13 =
  leftAligned(fromString (padLeft 26 ' ' " , circle 20"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc13Msg) else (Signal.send hoveredOn ""))

viewFunc14Msg = "The circle is filled with the color light purple."
viewFunc14 : Element
viewFunc14 =
  leftAligned(fromString (padLeft 41 ' ' " |> filled lightPurple"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc13Msg) else (Signal.send hoveredOn ""))

viewFunc15Msg = "The circle is moved to the x and y coordinates of player1.\n"
                            ++ "Thus the circle represents the proagonist in the game."
viewFunc15 : Element
viewFunc15 =
  leftAligned(fromString (padLeft 50 ' ' " |> move (player1.x, player1.y)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc15Msg) else (Signal.send hoveredOn ""))

-- View Message 2
displayView2 : (Int, Int) -> Int -> String -> Element
displayView2 (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ viewContainer2 (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
viewContainer2 : (Int, Int) -> Element
viewContainer2 (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (viewFunc16)
    , container (width - containerWidth) containerHeight midLeft (viewFunc17)
    , container (width - containerWidth) containerHeight midLeft (viewFunc18)
    , container (width - containerWidth) containerHeight midLeft (viewFunc19)
    , container (width - containerWidth) containerHeight midLeft (viewFunc20)
    , spacer 1 extraLine
    , container (width - containerWidth) containerHeight midLeft (backgroundColor)
    , container (width - containerWidth) containerHeight midLeft (textColor)
    , container (width - containerWidth) containerHeight midLeft (txtFunc)
    , container (width - containerWidth) containerHeight midLeft (msgFunc)
    ]))  

viewFunc16Msg = "The lives is also in the collage. Since only forms can exist in a\n"
                            ++ "collage, lives is transformed into a form."
viewFunc16 : Element
viewFunc16 =
  leftAligned(fromString (padLeft 29 ' ' " , toForm lives"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc15Msg) else (Signal.send hoveredOn ""))

viewFunc17Msg = "The form lives is moved to the location 0, gameHeight/2 - 40.\n"
                            ++ "That is to say, 40 pixels from the top of the game, or 0, 160."
viewFunc17 : Element
viewFunc17 =
  leftAligned(fromString (padLeft 50 ' ' " |> move (0, gameHeight/2 - 40)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc17Msg) else (Signal.send hoveredOn ""))

viewFunc18Msg = "There is one last form in the collage. The state of the game is Play,\n"
                           ++ "then there is a spacer with the width of 1 and the height of 1.\n"
                           ++ "A spacer is a place holder. If the state is Pause, then the contents\n"
                           ++ "of the variable msg appear as text."
viewFunc18 : Element
viewFunc18 =
  leftAligned(fromString (padLeft 80 ' ' " , toForm (if state == Play then spacer 1 1 else txt identity msg)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc18Msg) else (Signal.send hoveredOn ""))

viewFunc19Msg = "This last form is moved to the location 0, gameHeight/2 - 40.\n"
                            ++ "That is to say, 40 pixels from the bottom of the game, or 0, -160."
viewFunc19 : Element
viewFunc19 =
  leftAligned(fromString (padLeft 50 ' ' " |> move (0, 40 - gameHeight/2)"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc19Msg) else (Signal.send hoveredOn ""))

viewFunc20Msg = "This bracket closes the list of forms found in the collage."
viewFunc20 : Element
viewFunc20 =
  leftAligned(fromString (padLeft 16 ' ' " ]"))
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc20Msg) else (Signal.send hoveredOn ""))

backgroundColorMsg = "The variable backgroundColor is set to color with the red value of 178,\n"
                                  ++ "the green value of 8, and the blue value of 1."
backgroundColor : Element
backgroundColor =
  leftAligned(fromString " backgroundColor = rgb 178 8 1")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn backgroundColorMsg) else (Signal.send hoveredOn ""))

textColorMsg = "The variable textColor is set to the value of white. This will be the color\n"
                        ++ "used for any text prefaced with txt."
textColor : Element
textColor =
  leftAligned(fromString " textColor = white")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textColorMsg) else (Signal.send hoveredOn ""))
    
txtFuncMsg = "This function sets up the characteristics for the text used in the game. The text\n"
                    ++ "is converted from a string, has the color textColor (or white), has the font\n"
                    ++ "monospace, and is left aligned."
txtFunc : Element
txtFunc =
  leftAligned(fromString " txt f = Text.fromString >> Text.color textColor >> Text.monospace >> f >> Text.leftAligned")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFuncMsg) else (Signal.send hoveredOn ""))
    
msgFuncMsg = "This string is converted to text and placed at the bottom of the game when\n"
                      ++ "the state is Pause. These are the instructions on how to play the game. &larr\n"
                      ++ "inserts a left arrow symbol. Remove the space before the semi-colon so the symbol\n"
                      ++ "will appear. With a space &larr ;. Without a space &larr;."
msgFunc : Element
msgFunc =
  leftAligned(fromString " msg = 'SPACE to start, &larr ;&uarr ;&darr ;&rarr ; to move'")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn msgFuncMsg) else (Signal.send hoveredOn ""))