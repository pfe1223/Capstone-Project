import Signal (Signal, map3, foldp, subscribe, channel, send)
import Signal
import Color (..)
import Graphics.Element (..)
import Graphics.Input (hoverable)
import Text (fromString, plainText, leftAligned, asText)
import Window
import Mouse

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
     | countClick == 1 -> displayImports (width, height) countClick hoveredOn
     | countClick == 2 -> displaySignals (width, height) countClick hoveredOn
     | countClick == 3 -> displayModel (width, height) countClick hoveredOn
     | countClick == 4 -> displayUpdate (width, height) countClick
     | countClick == 5 -> displayView (width, height) countClick hoveredOn
     | otherwise -> displayWelcome (width, height) countClick

-- These numbers are used to create the containers that hold the code examples and explinations
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
    [ container (width - containerWidth) (containerHeight + extraLine) midLeft (signalMain)
    , container (width - containerWidth) containerHeight midLeft (signalGameState1)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (signalGameState2)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (signalDelta)
    , container (width - containerWidth) containerHeight midLeft (signalInput1)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (signalInput2)
    , container (width - containerWidth) containerHeight midLeft (signalInput3)
    , container (width - containerWidth) containerHeight midLeft (signalInput4)
    , container (width - containerWidth) containerHeight midLeft (signalInput5)
    , container (width - containerWidth) containerHeight midLeft (signalInput6)
    , container (width - containerWidth) containerHeight midLeft (signalInput7)
    ]))
  
signalMainMsg = "Map the signals Window.dimensions and gameState to the function view."
signalMain : Element
signalMain =
  leftAligned(fromString " main = \n    Signal.map2 view Window.dimensions gameState")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMainMsg) else (Signal.send hoveredOn ""))

signalGameState1Msg = " Import everything from the Graphics.Element library."
signalGameState1 : Element
signalGameState1 =
  leftAligned(fromString " gameState : Signal Game")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState1Msg) else (Signal.send hoveredOn ""))
    
signalGameState2Msg = " Import everything from the Graphics.Element library."
signalGameState2 : Element
signalGameState2 =
  leftAligned(fromString " gameState = \n    Signal.foldp update defaultGame input")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState2Msg) else (Signal.send hoveredOn ""))

signalDeltaMsg = " Import everything from the Graphics.Collage library."
signalDelta : Element
signalDelta =
  leftAligned(fromString " delta = \n    Signal.map inSeconds (fps 35)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDeltaMsg) else (Signal.send hoveredOn ""))

signalInput1Msg = " Import everything from the Text library."
signalInput1 : Element
signalInput1 =
  leftAligned(fromString " input : Signal Input")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput1Msg) else (Signal.send hoveredOn ""))

signalInput2Msg = " Import everything from the Text library."
signalInput2 : Element
signalInput2 =
  leftAligned(fromString " input = \n     Signal.sampleOn delta <|")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput2Msg) else (Signal.send hoveredOn ""))
    
signalInput3Msg = " Import everything from the Text library."
signalInput3 : Element
signalInput3 =
  leftAligned(fromString "        Signal.map4 Input")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput3Msg) else (Signal.send hoveredOn ""))

signalInput4Msg = " Import everything from the Text library."
signalInput4 : Element
signalInput4 =
  leftAligned(fromString "        Keyboard.space")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput4Msg) else (Signal.send hoveredOn ""))

signalInput5Msg = " Import everything from the Text library."
signalInput5 : Element
signalInput5 =
  leftAligned(fromString "        (Signal.map .x Keyboard.arrows)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput5Msg) else (Signal.send hoveredOn ""))

signalInput6Msg = " Import everything from the Text library."
signalInput6 : Element
signalInput6 =
  leftAligned(fromString "        (Signal.map .y Keyboard.arrows)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput7Msg) else (Signal.send hoveredOn ""))

signalInput7Msg = " Import everything from the Text library."
signalInput7 : Element
signalInput7 =
  leftAligned(fromString "        delta")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput7Msg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the MODEL section of the game
*************************************************************
--}

-- Model Message
displayModel : (Int, Int) -> Int -> String -> Element
displayModel (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ modelContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
modelContainer : (Int, Int) -> Element
modelContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (gameSize)
    , container (width - containerWidth) containerHeight midLeft (playingSize)
    , container (width - containerWidth) containerHeight midLeft (typeState)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (aliasBadGuy)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (aliasPlayer)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (aliasGame)
    , container (width - containerWidth) containerHeight midLeft (defaultGame1)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (defaultGame2)
    , container (width - containerWidth) containerHeight midLeft (defaultGame3)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (defaultGame4)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (aliasInput1)
    , container (width - containerWidth) containerHeight midLeft (aliasInput2)
    , container (width - containerWidth) containerHeight midLeft (aliasInput3)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (aliasInput4)
    ]))
  
gameSizeMsg = "Map the signals Window.dimensions and gameState to the function view."
gameSize : Element
gameSize =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn gameSizeMsg) else (Signal.send hoveredOn ""))

playingSizeMsg = " Import everything from the Graphics.Element library."
playingSize : Element
playingSize =
  leftAligned(fromString " (halfWidth, halfHeight) = (300, 200)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn playingSizeMsg) else (Signal.send hoveredOn ""))
    
typeStateMsg = " Import everything from the Graphics.Element library."
typeState : Element
typeState =
  leftAligned(fromString " type State = Play | Pause")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn typeStateMsg) else (Signal.send hoveredOn ""))

aliasBadGuyMsg = " Import everything from the Graphics.Collage library."
aliasBadGuy : Element
aliasBadGuy =
  leftAligned(fromString " type alias BadGuy = \n   { x:Float, y:Float, vx:Float, vy:Float }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuyMsg) else (Signal.send hoveredOn ""))

aliasPlayerMsg = " Import everything from the Text library."
aliasPlayer : Element
aliasPlayer =
  leftAligned(fromString " type alias Player = \n   { x:Float, y:Float, vx:Float, vy:Float, lives:Int }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayerMsg) else (Signal.send hoveredOn ""))

aliasGameMsg = " Import everything from the Text library."
aliasGame : Element
aliasGame =
  leftAligned(fromString " type alias Game = \n     { state:State, badGuy:BadGuy, player1:Player }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGameMsg) else (Signal.send hoveredOn ""))
    
defaultGame1Msg = " Import everything from the Text library."
defaultGame1 : Element
defaultGame1 =
  leftAligned(fromString " defaultGame : Game")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame1Msg) else (Signal.send hoveredOn ""))

defaultGame2Msg = " Import everything from the Text library."
defaultGame2 : Element
defaultGame2 =
  leftAligned(fromString " defaultGame =\n    { state   = Pause")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame2Msg) else (Signal.send hoveredOn ""))

defaultGame3Msg = " Import everything from the Text library."
defaultGame3 : Element
defaultGame3 =
  leftAligned(fromString "    , badGuy  = { x=0, y=0, vx=300, vy=300 }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame3Msg) else (Signal.send hoveredOn ""))

defaultGame4Msg = " Import everything from the Text library."
defaultGame4 : Element
defaultGame4 =
  leftAligned(fromString "    , player1 = { x = 15-halfWidth, y = 0, vx = 0, vy = 0, lives = 3 } \n    }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame4Msg) else (Signal.send hoveredOn ""))

aliasInput1Msg = " Import everything from the Text library."
aliasInput1 : Element
aliasInput1 =
  leftAligned(fromString " type alias Input =\n   { space : Bool")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput1Msg) else (Signal.send hoveredOn ""))

aliasInput2Msg = " Import everything from the Text library."
aliasInput2 : Element
aliasInput2 =
  leftAligned(fromString "   , dir1 : Int")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput2Msg) else (Signal.send hoveredOn ""))

aliasInput3Msg = " Import everything from the Text library."
aliasInput3 : Element
aliasInput3 =
  leftAligned(fromString "   , dir2 : Int")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput3Msg) else (Signal.send hoveredOn ""))

aliasInput4Msg = " Import everything from the Text library."
aliasInput4 : Element
aliasInput4 =
  leftAligned(fromString "   , delta : Time\n   }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput4Msg) else (Signal.send hoveredOn ""))

{-- 
*************************************************************
This section has all of the code for explaining the UPDATE section of the game
*************************************************************
--}

-- Update Message
displayUpdate : (Int, Int) -> Int -> Element
displayUpdate (width, height) countClick =
  color grey (container width height middle (flow down
    [ updateContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle (plainText ""))
    ]))
    
updateContainer : (Int, Int) -> Element
updateContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (leftAligned (fromString updateMsg)))
  
updateMsg : String
updateMsg =
  "This is where all the update stuff will go"

{-- 
*************************************************************
This section has all of the code for explaining the VIEW section of the game
*************************************************************
--}

-- View Message
displayView : (Int, Int) -> Int -> String -> Element
displayView (width, height) countClick hoveredOn =
  color grey (container width height middle (flow down
    [ viewContainer (width, height)
    , spacer 1 1
    , container (width - containerWidth) 20 middle (asText countClick)
    , spacer 1 1
    , color red (container (width - containerWidth) (height - bottomHeight) middle ((leftAligned(fromString hoveredOn))))
    ]))
    
viewContainer : (Int, Int) -> Element
viewContainer (width, height) =
  color lightBlue (container (width - containerWidth) (height - topHeight) middle (flow down
    [ container (width - containerWidth) containerHeight midLeft (viewFunc1)
    , container (width - containerWidth) containerHeight midLeft (viewFunc2)
    , container (width - containerWidth) containerHeight midLeft (viewFunc3)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (viewFunc4)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (viewFunc5)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (viewFunc6)
    , container (width - containerWidth) containerHeight midLeft (viewFunc7)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (viewFunc8)
    , container (width - containerWidth) containerHeight midLeft (viewFunc9)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (viewFunc10)
    , container (width - containerWidth) (containerHeight + extraLine) midLeft (viewFunc11)
    , container (width - containerWidth) containerHeight midLeft (viewFunc12)
    , container (width - containerWidth) containerHeight midLeft (viewFunc13)
    , container (width - containerWidth) containerHeight midLeft (viewFunc14)
    , container (width - containerWidth) containerHeight midLeft (viewFunc15)
    , container (width - containerWidth) containerHeight midLeft (viewFunc16)
    , container (width - containerWidth) containerHeight midLeft (viewFunc17)
    , container (width - containerWidth) containerHeight midLeft (viewFunc18)
    , container (width - containerWidth) containerHeight midLeft (aliasInput4)
    , container (width - containerWidth) containerHeight midLeft (aliasInput4)
    , container (width - containerWidth) containerHeight midLeft (aliasInput4)
    , container (width - containerWidth) containerHeight midLeft (aliasInput4)
    ]))
  
viewFunc1Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc1 : Element
viewFunc1 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc1Msg) else (Signal.send hoveredOn ""))

viewFunc2Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc2 : Element
viewFunc2 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc2Msg) else (Signal.send hoveredOn ""))

viewFunc3Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc3 : Element
viewFunc3 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc3Msg) else (Signal.send hoveredOn ""))

viewFunc4Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc4 : Element
viewFunc4 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc4Msg) else (Signal.send hoveredOn ""))

viewFunc5Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc5 : Element
viewFunc5 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc5Msg) else (Signal.send hoveredOn ""))

viewFunc6Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc6 : Element
viewFunc6 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc6Msg) else (Signal.send hoveredOn ""))

viewFunc7Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc7 : Element
viewFunc7 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc7Msg) else (Signal.send hoveredOn ""))

viewFunc8Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc8 : Element
viewFunc8 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc8Msg) else (Signal.send hoveredOn ""))

viewFunc9Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc9 : Element
viewFunc9 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc9Msg) else (Signal.send hoveredOn ""))

viewFunc10Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc10 : Element
viewFunc10 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc10Msg) else (Signal.send hoveredOn ""))

viewFunc11Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc11 : Element
viewFunc11 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc11Msg) else (Signal.send hoveredOn ""))

viewFunc12Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc12 : Element
viewFunc12 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc12Msg) else (Signal.send hoveredOn ""))

viewFunc13Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc13 : Element
viewFunc13 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc13Msg) else (Signal.send hoveredOn ""))

viewFunc14Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc14 : Element
viewFunc14 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc14Msg) else (Signal.send hoveredOn ""))

viewFunc15Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc15 : Element
viewFunc15 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc15Msg) else (Signal.send hoveredOn ""))

viewFunc16Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc16 : Element
viewFunc16 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc16Msg) else (Signal.send hoveredOn ""))

viewFunc17Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc17 : Element
viewFunc17 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc17Msg) else (Signal.send hoveredOn ""))

viewFunc18Msg = "Map the signals Window.dimensions and gameState to the function view."
viewFunc18 : Element
viewFunc18 =
  leftAligned(fromString " (gameWidth, gameHeight) = (600, 400)")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc18Msg) else (Signal.send hoveredOn ""))

backgroundColorMsg = " Import everything from the Text library."
backgroundColor : Element
backgroundColor =
  leftAligned(fromString "   , delta : Time\n   }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn backgroundColorMsg) else (Signal.send hoveredOn ""))

textColorMsg = " Import everything from the Text library."
textColor : Element
textColor =
  leftAligned(fromString "   , delta : Time\n   }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textColorMsg) else (Signal.send hoveredOn ""))
    
txtFuncMsg = " Import everything from the Text library."
txtFunc : Element
txtFunc =
  leftAligned(fromString "   , delta : Time\n   }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFuncMsg) else (Signal.send hoveredOn ""))
    
msgFuncMsg = " Import everything from the Text library."
msgFunc : Element
msgFunc =
  leftAligned(fromString "   , delta : Time\n   }")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn msgFuncMsg) else (Signal.send hoveredOn ""))