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
     | sig == 4 -> displaySignals1 (width, height) sig hoveredOn
     | sig == 5 -> displaySignals2 (width, height) sig hoveredOn
     | sig == 6 -> displaySignals3 (width, height) sig hoveredOn
     | sig == 7 -> displaySignals4 (width, height) sig hoveredOn
     | sig == 8 -> modelWelcome (width, height) sig
     | sig == 9 -> displayModel1 (width, height) sig hoveredOn
     | sig == 10 -> displayModel2 (width, height) sig hoveredOn
     | sig == 11 -> displayModel3 (width, height) sig hoveredOn
     | sig == 12 -> displayModel4 (width, height) sig hoveredOn
     | sig == 13 -> displayModel5 (width, height) sig hoveredOn
     | sig == 14 -> displayModel6 (width, height) sig hoveredOn
     | sig == 15 -> displayModel7 (width, height) sig hoveredOn
     | sig == 16 -> updateWelcome (width, height) sig
     | sig == 17 -> displayUpdate1 (width, height) sig hoveredOn
     | sig == 18 -> displayUpdate2 (width, height) sig hoveredOn
     | sig == 19 -> displayUpdate3 (width, height) sig hoveredOn
     | sig == 20 -> displayUpdate4 (width, height) sig hoveredOn
     | sig == 21 -> displayUpdate5 (width, height) sig hoveredOn
     | sig == 22 -> displayUpdate6 (width, height) sig hoveredOn
     | sig == 23 -> displayUpdate7 (width, height) sig hoveredOn
     | sig == 24 -> displayUpdate8 (width, height) sig hoveredOn
     | sig == 25 -> displayUpdate9 (width, height) sig hoveredOn
     | sig == 26 -> displayUpdate10 (width, height) sig hoveredOn
     | sig == 27 -> displayUpdate11 (width, height) sig hoveredOn
     | sig == 28 -> displayUpdate12 (width, height) sig hoveredOn
     | sig == 29 -> displayUpdate13 (width, height) sig hoveredOn
     | sig == 30 -> displayUpdate14 (width, height) sig hoveredOn
     | sig == 31 -> viewWelcome (width, height) sig
     | sig == 32 -> displayView1 (width, height) sig hoveredOn
     | sig == 33 -> displayView2 (width, height) sig hoveredOn
     | sig == 34 -> displayView3 (width, height) sig hoveredOn
     | sig == 35 -> displayView4 (width, height) sig hoveredOn
     | sig == 36 -> displayView5 (width, height) sig hoveredOn
     | sig == 37 -> displayView6 (width, height) sig hoveredOn
     | sig == 38 -> displayView7 (width, height) sig hoveredOn
     | sig == 39 -> displayView8 (width, height) sig hoveredOn
     | sig == 40 -> displayView9 (width, height) sig hoveredOn
     | sig == 41 -> displayView10 (width, height) sig hoveredOn
     | sig == 42 -> displayView11 (width, height) sig hoveredOn
     | sig == 43 -> congrats (width, height) sig
     | sig == 44 -> idea1 (width, height) sig
     | sig == 45 -> idea2 (width, height) sig
     | sig == 46 -> idea3 (width, height) sig
     | otherwise -> displayWelcome (width, height) sig

-- These numbers are used to create the containers that hold the code examples and explinations
indent = 20
containerWidth = 400
containerHeight = 700
subtitleHeight = 500
extraLine = 15
codeHeight = 30
gameHeight = 350
bottomHeight = 150

-- Wayfinding tools
wayfinderPast =
  circle 15
    |> filled elmBlue
    |> alpha 0.5

wayfinderPresent =
  circle 15
    |> filled elmBlue

wayfinderFuture =
  circle 15
    |> outlined ( solid elmBlue)

dashPast =
  rect 20 5
    |> filled elmBlue
    |> alpha 0.5

dashPresent =
  rect 20 5
    |> filled elmBlue

-- Display elements
wayfindingElement : Element -> Element
wayfindingElement wayfinding =
  color grey <| container containerWidth 50 middle <| wayfinding

titleElement : String -> Element
titleElement strg =
  color grey <| container containerWidth 100 middle <| title strg

subtitleElement : String -> Element
subtitleElement strg =
  color grey <| container containerWidth subtitleHeight middle <| subTitle strg

codeTitleElement : String -> Element
codeTitleElement strg =
  color grey <| container containerWidth 50 middle <| subTitle strg

codeElement : Element -> Element
codeElement gameCode =
  color elmBlue <| container containerWidth gameHeight midLeft gameCode

helpElement : String -> Element
helpElement hoveredOn =
  color elmOrange <| container containerWidth bottomHeight middle <| body hoveredOn

buttonGoElement : Int -> Element
buttonGoElement sig =
  color grey <| container containerWidth 50 midRight <| flow left
    [ spacer 5 1
    , letsGo sig
    ]

buttonsLRElement : Int -> Element
buttonsLRElement sig =
  color grey <| container containerWidth 50 midRight <| flow left
    [ spacer 5 1
    , rightButton sig
    , spacer 5 1
    , leftButton sig
    ]

-- Buttons
letsGo : Int -> Element
letsGo sig =
  size 100 40 <| color grey <| button (send chan (sig + 1)) "Let's get started"

rightButton : Int -> Element
rightButton sig =
  size 50 40 <| color grey <| button (send chan (sig + 1)) ">"

leftButton : Int -> Element
leftButton sig =
  size 50 40 <| color grey <| button (send chan (sig - 1)) "<"

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
    [ wayfindingElement wayfindingWelcome
    , titleElement welcomeMsg1
    , subtitleElement welcomeMsg2
    , buttonGoElement sig
    ]))

wayfindingWelcome : Element
wayfindingWelcome =
  color grey <| container 400 50 middle <| (flow right
    [ collage 30 50
        [ wayfinderPresent ] --Intro page
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Imports section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Signals section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Model section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Updae section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --View section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Congrats section
    ])

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
    [ wayfindingElement wayfindingImports
    , titleElement importsWelcomeMsg1
    , subtitleElement importsWelcomeMsg2
    , buttonsLRElement sig
    ]))

wayfindingImports : Element
wayfindingImports =
  color grey <| container 400 50 middle <| (flow right
    [ collage 30 50
        [ wayfinderPast ] --Intro page
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPresent ] --Imports section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Signals section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Model section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Updae section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --View section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Congrats section
    ])

importsWelcomeMsg1 : String
importsWelcomeMsg1 =
  "Imports Section"

importsWelcomeMsg2 : String
importsWelcomeMsg2 =
  "The Imports Section loads all of the\n" ++
  "packages needed for the game.\n" ++
  "Without these packages, the Elm\n" ++
  "language is very limited. You will\n" ++
  "add ability to:\n\n" ++
  "&diams; Use colors\n" ++
  "&diams; Draw the circle & hexagon\n" ++
  "&diams; Create elements for text\n" ++
  "&diams; Get input from the keyboard\n" ++
  "&diams; Recieve and map signals as input\n" ++
  "&diams; Modify text on the screen\n" ++
  "&diams; Keep track of time as it passes\n" ++
  "&diams; Resize the game."

-- Imports Message
displayImports : (Int, Int) -> Int -> String -> Element
displayImports (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingImports
    , titleElement importsWelcomeMsg1
    , codeElement <| importsContainer sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

importsContainer : Int -> String -> Element
importsContainer sig hoveredOn =
  flow down
    [ importColor
    , importGraphicsCollage
    , importGraphicsElement
    , importKeyboard
    , importSignal
    , importText
    , importTime
    , importWindow
    , body " 9."
    ]

colorMsg = " Import everything from the Color library."
importColor : Element
importColor =
  body " 1. import Color (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn colorMsg) else (Signal.send hoveredOn ""))

graphicsElementMsg = " Import everything from the Graphics.Element library."
importGraphicsElement : Element
importGraphicsElement =
  body " 3. import Graphics.Element (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsElementMsg) else (Signal.send hoveredOn ""))

graphicsCollageMsg = " Import everything from the Graphics.Collage library."
importGraphicsCollage : Element
importGraphicsCollage =
  body " 2. import Graphics.Collage (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsCollageMsg) else (Signal.send hoveredOn ""))

textMsg = " Import everything from the Text library."
importText : Element
importText =
  body " 6. import Text (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textMsg) else (Signal.send hoveredOn ""))

signalMsg = " Import the Signal library."
importSignal : Element
importSignal =
  body " 5. import Signal"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMsg) else (Signal.send hoveredOn ""))

keyboardMsg = " Import everything from the Keyboard library."
importKeyboard : Element
importKeyboard =
  body (" 4. import Keyboard")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn keyboardMsg) else (Signal.send hoveredOn ""))

timeMsg = " Import everything from the Time library."
importTime : Element
importTime =
  body (" 7. import Time")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn timeMsg) else (Signal.send hoveredOn ""))

windowMsg = " Import everything from the Keyboard library."
importWindow : Element
importWindow =
  body (" 8. import Window")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn windowMsg) else (Signal.send hoveredOn ""))

{--
*************************************************************
This section has all of the code for explaining the SIGNALS section of the game
*************************************************************
--}

-- Signals Welcome
signalsWelcome : (Int, Int) -> Int -> Element
signalsWelcome (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , subtitleElement signalsWelcomeMsg2
    , buttonsLRElement sig
    ]))

wayfindingSignals : Element
wayfindingSignals =
  color grey <| container 400 50 middle <| (flow right
    [ collage 30 50
        [ wayfinderPast ] --Intro page
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Imports section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPresent ] --Signals section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Model section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Updae section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --View section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Congrats section
    ])

signalsWelcomeMsg1 : String
signalsWelcomeMsg1 =
  "Signals Section"

signalsWelcomeMsg2 : String
signalsWelcomeMsg2 =
  "Signals are values that change over\n" ++
  "time. Signals tell you if the mouse is\n" ++
  "being clicked, if it is hovering over an\n" ++
  "element, or if a button is clicked. Time\n" ++
  "can be a signal. Without signals, there\n" ++
  "can be no nteraction in the game. If the\n" ++
  "user moves, changes, or interacts with\n" ++
  "the program in any way, then you need\n" ++
  "a signal. Signals in this game are:\n\n" ++
  "&diams; The size of the window.\n" ++
  "&diams; If the game is play or paused.\n" ++
  "&diams; Time.\n" ++
  "&diams; Arrow keys on the keyboard.\n"

-- Signals Message
displaySignals1 : (Int, Int) -> Int -> String -> Element
displaySignals1 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    ,  titleElement signalsWelcomeMsg1
    , codeElement <| signalsContainer1 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

signalsContainer1 : Int -> String -> Element
signalsContainer1 sig hoveredOn =
  flow down
    [ signalMain1
    , flow right
        [ body " 11."
        , spacer indent 1
        , signalMain2
        ]
    , flow right
        [ spacer (indent *4) 1
        , signalMain3
        ]
    , body " 12."
    ]

signalMain1Msg = "Define the main function Every Elm program must have a main."
signalMain1 : Element
signalMain1 =
  body " 10. main ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain1Msg) else (Signal.send hoveredOn ""))

signalMain2Msg = "Map the signals Window.dimensions and gameState to the function view."
signalMain2 : Element
signalMain2 =
  body " Signal.map2 view Window.dimensions"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain2Msg) else (Signal.send hoveredOn ""))

signalMain3 : Element
signalMain3 =
  body " gameState"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain2Msg) else (Signal.send hoveredOn ""))

displaySignals2 : (Int, Int) -> Int -> String -> Element
displaySignals2 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , codeElement <| signalsContainer2 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

signalsContainer2 : Int -> String -> Element
signalsContainer2 sig hoveredOn =
  flow down
    [ signalGameState1
    , signalGameState2
    , flow right
        [ body " 15."
        , spacer indent 1
        , signalGameState3
        ]
    , body " 16."
    ]

signalGameState1Msg = " Define gameState as a signal of type Game."
signalGameState1 : Element
signalGameState1 =
  body " 13. gameState : Signal Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState1Msg) else (Signal.send hoveredOn ""))

signalGameState2Msg = " Define the specifics of gameState."
signalGameState2 : Element
signalGameState2 =
  body " 14. gameState ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState2Msg) else (Signal.send hoveredOn ""))

signalGameState3Msg = " gameState is past dependent on defaultGame and input."
signalGameState3 : Element
signalGameState3 =
  body" Signal.foldp update defaultGame input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState3Msg) else (Signal.send hoveredOn ""))

displaySignals3 : (Int, Int) -> Int -> String -> Element
displaySignals3 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , codeElement <| signalsContainer3 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

signalsContainer3 : Int -> String -> Element
signalsContainer3 sig hoveredOn =
  flow down
    [ signalDelta1
    , flow right
        [ body " 18."
        , spacer indent 1
        , signalDelta2
        ]
    , body " 19."
    ]

signalDelta1Msg = " Define specific characteristics of the delta signal."
signalDelta1 : Element
signalDelta1 =
  body " 17. delta ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDelta1Msg) else (Signal.send hoveredOn ""))

signalDelta2Msg = "Notes the change in time 35 times a second, \nand then converts this to seconds."
signalDelta2 : Element
signalDelta2 =
  body " Signal.map inSeconds (fps 35)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDelta2Msg) else (Signal.send hoveredOn ""))

displaySignals4 : (Int, Int) -> Int -> String -> Element
displaySignals4 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , codeElement <| signalsContainer4 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

signalsContainer4 : Int -> String -> Element
signalsContainer4 sig hoveredOn =
  flow down
    [ signalInput1
    , signalInput2
    , flow right
        [ body " 22."
        , spacer indent 1
        , signalInput3
        ]
    , flow right
        [ body " 23."
        , spacer (indent*2) 1
        , signalInput4
        ]
    , flow right
        [ body " 24."
        , spacer (indent*3) 1
        , signalInput5
        ]
    , flow right
        [ body " 25."
        , spacer (indent*3) 1
        , signalInput6
        ]
    , flow right
        [ body " 26."
        , spacer (indent*3) 1
        , signalInput7
        ]
    , flow right
        [ body " 27."
        , spacer (indent*3) 1
        , signalInput8
        ]
    , body " 28."
    ]

signalInput1Msg = "Defines input as a signal of type Input."
signalInput1 : Element
signalInput1 =
  body " 20. input : Signal Input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput1Msg) else (Signal.send hoveredOn ""))

signalInput2Msg = "Defines the specifics of input."
signalInput2 : Element
signalInput2 =
  body " 21. input ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput2Msg) else (Signal.send hoveredOn ""))

signalInput3Msg = "For every delta, the specific attributes of input are updated."
signalInput3 : Element
signalInput3 =
  body "Signal.sampleOn delta <|"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput3Msg) else (Signal.send hoveredOn ""))

signalInput4Msg = "Maps all four attributes of Input to the update that happens every delta."
signalInput4 : Element
signalInput4 =
  body "Signal.map4 Input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput4Msg) else (Signal.send hoveredOn ""))

signalInput5Msg = "Gives a true or false based upon the space bar being pressed."
signalInput5 : Element
signalInput5 =
  body "Keyboard.space"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput5Msg) else (Signal.send hoveredOn ""))

signalInput6Msg = "Updates the x attribute based upon left/right arrow being pressed."
signalInput6 : Element
signalInput6 =
  body "(Signal.map .x Keyboard.arrows)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput6Msg) else (Signal.send hoveredOn ""))

signalInput7Msg = "Updates the y attribute based upon up/down arrow being pressed."
signalInput7 : Element
signalInput7 =
  body "(Signal.map .y Keyboard.arrows)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput7Msg) else (Signal.send hoveredOn ""))

signalInput8Msg = "Updates delta with the new time."
signalInput8 : Element
signalInput8 =
  body "delta"
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
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , subtitleElement modelWelcomeMsg2
    , buttonsLRElement sig
    ]))

wayfindingModel : Element
wayfindingModel =
  color grey <| container 400 50 middle <| (flow right
    [ collage 30 50
        [ wayfinderPast ] --Intro page
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Imports section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Signals section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPresent ] --Model section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Updae section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --View section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Congrats section
    ])

modelWelcomeMsg1 : String
modelWelcomeMsg1 =
  "Model Section"

modelWelcomeMsg2 : String
modelWelcomeMsg2 =
  "The Elm language does not understand\n" ++
  "what an enemy is in your video game.\n" ++
  "The Model Section is used to create the\n" ++
  "objects and their characteristics to be\n" ++
  "used in the game. You will create:\n\n" ++
  "&diams; The state of the game which is\n" ++
  "   either Play or Pause.\n" ++
  "&diams; An enemy with a position and a\n" ++
  "   velocity.\n" ++
  "&diams; A player with a position, a velocity\n" ++
  "   velocity, and three lives.\n" ++
  "&diams; A game with a good guy, a bad\n" ++
  "   guy, and a state (play or pause).\n" ++
  "&diams; Initialize the game with parameter\n" ++
  "   for when you begin playing.\n" ++
  "&diams; Input that has direction, time, and if\n" ++
  "   spacebar is pressed."

-- Model Message 1
displayModel1 : (Int, Int) -> Int -> String -> Element
displayModel1 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , codeElement <| modelContainer1 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

modelContainer1 : Int -> String -> Element
modelContainer1 sig hoveredOn =
  flow down
    [ gameSize
    , playingSize
    , body " 31."
    ]

gameSizeMsg = "Set the variable gameWidth to 600 and variable gameHeight to 400."
gameSize : Element
gameSize =
  body " 29. (gameWidth, gameHeight) = (600, 400)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn gameSizeMsg) else (Signal.send hoveredOn ""))

playingSizeMsg = " Set variable halfWidth to 300 and variable halfHeight to 200."
playingSize : Element
playingSize =
  body " 30. (halfWidth, halfHeight) = (300, 200)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn playingSizeMsg) else (Signal.send hoveredOn ""))

displayModel2 : (Int, Int) -> Int -> String -> Element
displayModel2 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , codeElement <| modelContainer2 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

modelContainer2 : Int -> String -> Element
modelContainer2 sig hoveredOn =
  flow down
    [ typeState
    , body " 33."
    ]

typeStateMsg = " Create type State and indicate it can have either the value Play or Pause."
typeState : Element
typeState =
  body " 32. type State = Play | Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn typeStateMsg) else (Signal.send hoveredOn ""))

displayModel3 : (Int, Int) -> Int -> String -> Element
displayModel3 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , codeElement <| modelContainer3 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

modelContainer3 : Int -> String -> Element
modelContainer3 sig hoveredOn =
  flow down
    [ aliasBadGuy1
    , flow right
        [ body " 35."
        , spacer indent 1
        , aliasBadGuy2
        ]
    , body " 36."
    ]

aliasBadGuy1Msg = " Create a type alias BadGuy with the following characteristics."
aliasBadGuy1 : Element
aliasBadGuy1 =
  body " 34. type alias BadGuy ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy1Msg) else (Signal.send hoveredOn ""))

aliasBadGuy2Msg = "Objects of type BadGuy have an x value of type float, a y value of \ntype float,"
                              ++ "a vx value of type Float, and a vy value of type float.\n"
                              ++ "Floats are numbers with a decimal."
aliasBadGuy2 : Element
aliasBadGuy2 =
  body "{ x:Float, y:Float, vx:Float, vy:Float }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy2Msg) else (Signal.send hoveredOn ""))

displayModel4 : (Int, Int) -> Int -> String -> Element
displayModel4 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , codeElement <| modelContainer4 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

modelContainer4 : Int -> String -> Element
modelContainer4 sig hoveredOn =
  flow down
    [ aliasPlayer1
    , flow right
        [ body " 38."
        , spacer indent 1
        , aliasPlayer2
        ]
    , body " 39."
    ]

aliasPlayer1Msg = " Create a type alias Player with the following characteristics."
aliasPlayer1 : Element
aliasPlayer1 =
  body " 37. type alias Player ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer1Msg) else (Signal.send hoveredOn ""))

aliasPlayer2Msg = "Objects of type Player have an x value of type float, a y value of type \nfloat,"
                              ++ "a vx value of type Float, a vy value of type float, and a lives value \nof type integer."
                              ++ "Floats are numbers with a decimal, and integers are \nnumber without decimals."
aliasPlayer2 : Element
aliasPlayer2 =
  body "{ x:Float, y:Float, vx:Float, vy:Float, lives:Int }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer2Msg) else (Signal.send hoveredOn ""))

displayModel5 : (Int, Int) -> Int -> String -> Element
displayModel5 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , codeElement <| modelContainer5 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

modelContainer5 : Int -> String -> Element
modelContainer5 sig hoveredOn =
  flow down
    [ aliasGame1
    , flow right
        [ body " 41."
        , spacer indent 1
        , aliasGame2
        ]
    , flow right
      [ spacer (indent*4) 1
      , aliasGame3
      ]
    , body " 42."
    ]

aliasGame1Msg = " Create a type alias Game with the following characteristics."
aliasGame1 : Element
aliasGame1 =
  body " 40. type alias Game ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame1Msg) else (Signal.send hoveredOn ""))

aliasGame2Msg = "Objects of type Game have a value state of type State,"
                           ++ "a value \nbadGuy of type BadGuy, and a value of player1 of type Player."
aliasGame2 : Element
aliasGame2 =
  body "{ state:State, badGuy:BadGuy, "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame2Msg) else (Signal.send hoveredOn ""))

aliasGame3 : Element
aliasGame3 =
  body " player1:Player }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame2Msg) else (Signal.send hoveredOn ""))

-- Model Message 2
displayModel6 : (Int, Int) -> Int -> String -> Element
displayModel6 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , codeElement <| modelContainer6 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

modelContainer6 : Int -> String -> Element
modelContainer6 sig hoveredOn =
  flow down
    [ defaultGame1
    , defaultGame2
    , flow right
        [ body " 45."
        , spacer indent 1
        , defaultGame3
        ]
    , flow right
        [ body " 46."
        , spacer indent 1
        , defaultGame4
        ]
    , flow right
        [ body " 47."
        , spacer indent 1
        , defaultGame5
        ]
    , flow right
        [ spacer (indent*7) 1
        , defaultGame6
        ]
    , flow right
        [ body " 48."
        , spacer indent 1
        , defaultGame7
        ]
    , body " 49."
    ]

defaultGame1Msg = " Create an object defaultGame of type Game."
defaultGame1 : Element
defaultGame1 =
  body " 43. defaultGame : Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame1Msg) else (Signal.send hoveredOn ""))

defaultGame2Msg = " Assign each attribute of defaultGame with the following values."
defaultGame2 : Element
defaultGame2 =
  body " 44. defaultGame ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame2Msg) else (Signal.send hoveredOn ""))

defaultGame3Msg = " The state attribute has a value of Pause."
defaultGame3 : Element
defaultGame3 =
  body "{ state = Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame3Msg) else (Signal.send hoveredOn ""))

defaultGame4Msg = "The badGuy attributes have an x value of 0, a y value of 0, a vx value \nof 300,"
                              ++ "and a vy value of 300. The x and y values are used for the \nbadGuy's postion,"
                              ++ "and the vx and vy values are the velocity (think speed) \nof the badGuy."
defaultGame4 : Element
defaultGame4 =
  body ", badGuy = { x=0, y=0, vx=300, vy=300 }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame4Msg) else (Signal.send hoveredOn ""))

defaultGame5Msg = "The player1 attributes have an x value of 15-halfWidth (or -285), a \ny value of 0,"
                              ++ " a vx value of 300, and a vy value of 300. The x and y values \nare used for the player1's postion,"
                              ++ "and the vx and vy values are the velocity \n(think speed) of the player1. player1 also has 3 lives."
defaultGame5 : Element
defaultGame5 =
  body ", player1 = { x = 15-halfWidth, y = 0"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame5Msg) else (Signal.send hoveredOn ""))

defaultGame6 : Element
defaultGame6 =
  body ", vx = 0, vy = 0, lives = 3 }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame5Msg) else (Signal.send hoveredOn ""))


defaultGame7Msg = " End the list of attributes for defaultGame."
defaultGame7 : Element
defaultGame7 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame7Msg) else (Signal.send hoveredOn ""))

displayModel7 : (Int, Int) -> Int -> String -> Element
displayModel7 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , codeElement <| modelContainer7 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

modelContainer7 : Int -> String -> Element
modelContainer7 sig hoveredOn =
  flow down
    [ aliasInput1
    , flow right
        [ body " 51."
        , spacer indent 1
        , aliasInput2
        ]
    , flow right
        [ body " 52."
        , spacer indent 1
        , aliasInput3
        ]
    , flow right
        [ body " 53."
        , spacer indent 1
        , aliasInput4
        ]
    , flow right
        [ body " 54."
        , spacer indent 1
        , aliasInput5
        ]
    , flow right
        [ body " 55."
        , spacer indent 1
        , aliasInput6
        ]
    , body " 56."
    ]

aliasInput1Msg = " Create a type alias Input with the following characteristics."
aliasInput1 : Element
aliasInput1 =
  body " 50. type alias Input ="
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
    [ wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , subtitleElement updateWelcomeMsg2
    , buttonsLRElement sig
    ]))

wayfindingUpdate : Element
wayfindingUpdate =
  color grey <| container 400 50 middle <| (flow right
    [ collage 30 50
        [ wayfinderPast ] --Intro page
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Imports section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Signals section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Model section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPresent ] --Updae section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --View section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Congrats section
    ])

updateWelcomeMsg1 : String
updateWelcomeMsg1 =
  "Update Section\n"

updateWelcomeMsg2 : String
updateWelcomeMsg2 =
  "The Update Section is where the magic\n" ++
  "happens. You created the signals which\n" ++
  "send commands to the computer. The\n" ++
  "models describe the objects used in the\n" ++
  "game. The Update Section takes those\n" ++
  "signals and changes the model for the\n" ++
  "appropriate object. You will create\n" ++
  "updates for:\n\n" ++
  "&diams; The state of the game (play or pause).\n" ++
  "&diams; The position of the bad guy.\n" ++
  "&diams; The position and lives of the good guy.\n" ++
  "&diams; Are the bad guy and good guy\n" ++
  "   touching?"

-- Update Message 1
displayUpdate1 : (Int, Int) -> Int -> String -> Element
displayUpdate1 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer1 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer1 : Int -> String -> Element
updateContainer1 sig hoveredOn =
  flow down
    [ updateFunc1
    , updateFunc2
    , flow right
        [ spacer (indent*4) 1
        , updateFunc3
        ]
    , flow right
        [ body " 59."
        , spacer indent 1
        , updateFunc4
        ]
    , flow right
        [ spacer (indent*4) 1
        , updateFunc4a
        ]
    , body " 60."
    ]

updateFunc1Msg = "Update is a function that takes an object of type Input, an object of type\n"
                          ++ "Game, and returns a Game."
updateFunc1 : Element
updateFunc1 =
  body " 57. update : Input -> Game -> Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc1Msg) else (Signal.send hoveredOn ""))

updateFunc2Msg = "Specifically, update takes Input in the form of space, dir1, dir2, and delta.\n"
                          ++ "The Game is defined as state, badGuy, and player1."
updateFunc2 : Element
updateFunc2 =
  body " 58. update {space,dir1,dir2,delta} "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc2Msg) else (Signal.send hoveredOn ""))

updateFunc3 : Element
updateFunc3 =
  body " ({state,badGuy,player1} as game) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc2Msg) else (Signal.send hoveredOn ""))


updateFunc4Msg = "The let expression assigns the value of 1 to lives if badGuy is within \nplayer1."
                          ++ "If not, the value of 0 is assigned to lives. The function within is \ndefined below."
updateFunc4 : Element
updateFunc4 =
  body "let lives = if (badGuy `within` player1) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc4Msg) else (Signal.send hoveredOn ""))

updateFunc4a : Element
updateFunc4a =
  body " then 1 else 0"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc4Msg) else (Signal.send hoveredOn ""))


displayUpdate2 : (Int, Int) -> Int -> String -> Element
displayUpdate2 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer2 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer2 : Int -> String -> Element
updateContainer2 sig hoveredOn =
  flow down
    [ flow right
        [ body " 61."
        , spacer (indent*2) 1
        , updateFunc5
        ]
    , flow right
        [ body " 62."
        , spacer (indent*3) 1
        , updateFunc6
        ]
    , flow right
        [ body " 63."
        , spacer (indent*3 + 15) 1
        , updateFunc7
        ]
    , flow right
        [ body " 64."
        , spacer (indent*3 + 15) 1
        , updateFunc8
        ]
    , body " 65."
    ]

updateFunc5Msg = "The function newState assumes a value dependent upon the cases below:"
updateFunc5 : Element
updateFunc5 =
  body "newState ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc5Msg) else (Signal.send hoveredOn ""))

updateFunc6Msg = "If the space bar is pressed, then newState takes the value Play."
updateFunc6 : Element
updateFunc6 =
  body "if | space                    -> Play"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc6Msg) else (Signal.send hoveredOn ""))

updateFunc7Msg = "NewState assumes the value of Pause if player1.lives is 0. That is, the game\n"
                          ++ "stops when the player runs out of lives."
updateFunc7 : Element
updateFunc7 =
  body "| player1.lives == 0 -> Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc7Msg) else (Signal.send hoveredOn ""))

updateFunc8Msg = "In all other cases, newState assumes the value of state. \nThat is, nothing changes."
updateFunc8 : Element
updateFunc8 =
  body "| otherwise              -> state"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc8Msg) else (Signal.send hoveredOn ""))

displayUpdate3 : (Int, Int) -> Int -> String -> Element
displayUpdate3 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer3 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer3 : Int -> String -> Element
updateContainer3 sig hoveredOn =
  flow down
    [ flow right
        [ body " 66."
        , spacer (indent*2) 1
        , updateFunc9
        ]
    , flow right
        [ body " 67."
        , spacer (indent*3) 1
        , updateFunc10
        ]
    , flow right
        [ body " 68."
        , spacer (indent*4) 1
        , updateFunc11
        ]
    , flow right
        [ body " 69."
        , spacer (indent*4) 1
        , updateFunc12
        ]
    , flow right
        [ spacer (indent*6 + 4) 1
        , updateFunc12a
        ]
    , body " 70."
    ]

updateFunc9Msg = "The function newBadGuy assumes the value dependent \nupon the following cases:"
updateFunc9 : Element
updateFunc9 =
  body "newBadGuy ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc9Msg) else (Signal.send hoveredOn ""))

updateFunc10Msg = "If the value of state is equal to Pause, the do the following thing.\n"
                          ++ "an element. A tupple is two numbers grouped together by parentheses.\n"
                          ++ "An integer is a number without a decimal."
updateFunc10 : Element
updateFunc10 =
  body "if state == Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc10Msg) else (Signal.send hoveredOn ""))

updateFunc11Msg = "The function newBadGuy takes the value badGuy. That is, nothing changes."
updateFunc11 : Element
updateFunc11 =
  body "then badGuy"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc11Msg) else (Signal.send hoveredOn ""))

updateFunc12Msg = "When state equals Play, then call the function updateBadGuy, which is \ndefined below."
                              ++ "updateBadGuy takes delta, badGuy, and player1."
updateFunc12 : Element
updateFunc12 =
  body "else updateBadGuy delta badGuy"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc12Msg) else (Signal.send hoveredOn ""))

updateFunc12a : Element
updateFunc12a =
  body "player1"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc12Msg) else (Signal.send hoveredOn ""))

displayUpdate4 : (Int, Int) -> Int -> String -> Element
displayUpdate4 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer4 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer4 : Int -> String -> Element
updateContainer4 sig hoveredOn =
  flow down
    [ flow right
        [ body " 71."
        , spacer indent 1
        , updateFunc13
        ]
    , flow right
        [ body " 72."
        , spacer (indent*2) 1
        , updateFunc14
        ]
    , flow right
        [ body " 73."
        , spacer (indent*3) 1
        , updateFunc15
        ]
    , flow right
        [ body " 74."
        , spacer (indent*3) 1
        , updateFunc16
        ]
    , flow right
        [ body " 75."
        , spacer (indent*3) 1
        , updateFunc17
        ]
    , flow right
        [ spacer (indent*5) 1
        , updateFunc17a
        ]
    , flow right
        [ body " 76."
        , spacer (indent*2) 1
        , updateFunc18
        ]
    , body " 77."
    ]

updateFunc13Msg = "The in part of the let expression tells us how the \nabove information will be used."
updateFunc13 : Element
updateFunc13 =
  body "in"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc13Msg) else (Signal.send hoveredOn ""))

updateFunc14Msg = "Game will have its attributes updated."
updateFunc14 : Element
updateFunc14 =
  body "{ game |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc14Msg) else (Signal.send hoveredOn ""))

updateFunc15Msg = "State will assume the value of newState."
updateFunc15 : Element
updateFunc15 =
  body "state   <- newState,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc15Msg) else (Signal.send hoveredOn ""))

updateFunc16Msg = "BadGuy assumes the value of newBadGuy."
updateFunc16 : Element
updateFunc16 =
  body "badGuy  <- newBadGuy,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc16Msg) else (Signal.send hoveredOn ""))

updateFunc17Msg = "Player1 assumes the value of updatePlayer which needs delta, dir1, dir2,\n"
                                ++ "lives, and player1. The function updatePlayer is defined below."
updateFunc17 : Element
updateFunc17 =
  body "player1 <- updatePlayer delta dir1 dir2"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc17Msg) else (Signal.send hoveredOn ""))

updateFunc17a : Element
updateFunc17a =
  body "lives player1"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc17Msg) else (Signal.send hoveredOn ""))

updateFunc18Msg = "This bracket closes the update function."
updateFunc18 : Element
updateFunc18 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc18Msg) else (Signal.send hoveredOn ""))

-- Update Message 2
displayUpdate5 : (Int, Int) -> Int -> String -> Element
displayUpdate5 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer5 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer5 : Int -> String -> Element
updateContainer5 sig hoveredOn=
  flow down
    [ updateBadGuy1
    , flow right
        [ spacer (indent*2) 1
        , updateBadGuy1a
        ]
    , updateBadGuy2
    , flow right
        [ spacer (indent*2) 1
        , updateBadGuy2a
        ]
    ]

updateBadGuy1Msg = "The function updateBadGuy takes a Time, a BadGuy, and a Player.\n"
                          ++ "The function returns a type of BadGuy."
updateBadGuy1 : Element
updateBadGuy1 =
  body " 78. updateBadGuy : Time -> BadGuy -> Player ->"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy1Msg) else (Signal.send hoveredOn ""))

updateBadGuy1a : Element
updateBadGuy1a =
  body " BadGuy"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy1Msg) else (Signal.send hoveredOn ""))


updateBadGuy2Msg = "UpdateBadGuy takes t as time; the x, y, vx, and vy values of badGuy;\n"
                          ++ "and the x, y, vx, and vy values of player1."
updateBadGuy2 : Element
updateBadGuy2 =
  body " 79. updateBadGuy t ({x,y,vx,vy} as badGuy)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy2Msg) else (Signal.send hoveredOn ""))

updateBadGuy2a : Element
updateBadGuy2a =
  body " ({x,y,vx,vy,lives} as player1) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy2Msg) else (Signal.send hoveredOn ""))

displayUpdate6 : (Int, Int) -> Int -> String -> Element
displayUpdate6 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer6 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer6 : Int -> String -> Element
updateContainer6 sig hoveredOn=
  flow down
    [ flow right
        [ body " 80."
        , spacer indent 1
        , updateBadGuy3
        ]
    , flow right
        [ spacer (indent*4) 1
        , updateBadGuy3a
        ]
    , flow right
        [ body " 81."
        , spacer (indent + 15) 1
        , updateBadGuy4
        ]
    , flow right
        [ spacer (indent*4) 1
        , updateBadGuy4a
        ]
    , flow right
        [ body " 82."
        , spacer (indent*2+5) 1
        , updateBadGuy5
        ]
    , flow right
        [ body " 83."
        , spacer (indent*3+5) 1
        , updateBadGuy6
        ]
    , flow right
        [ spacer (indent*5) 1
        , updateBadGuy6a
        ]
    , flow right
        [ body " 84."
        , spacer (indent*3+5) 1
        , updateBadGuy7
        ]
    , flow right
        [ spacer (indent*5) 1
        , updateBadGuy7a
        ]
    , flow right
        [ body " 85."
        , spacer (indent*2+5) 1
        , updateBadGuy8
        ]
    ]

updateBadGuy3Msg = "If player1 has no more lives, then the x and y values of badGuy are set to 0."
updateBadGuy3 : Element
updateBadGuy3 =
  body "if | (player1.lives == 0) -> { badGuy |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

updateBadGuy3a : Element
updateBadGuy3a =
  body " x <- 0, y <- 0}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

updateBadGuy4Msg = "If badGuy is touching player1, then the function physicsUpdate is called\n"
                          ++ "with t (time)."
updateBadGuy4 : Element
updateBadGuy4 =
  body "| (badGuy `within` player1) -> "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy4Msg) else (Signal.send hoveredOn ""))

updateBadGuy4a : Element
updateBadGuy4a =
  body " physicsUpdate t"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy4Msg) else (Signal.send hoveredOn ""))

updateBadGuy5Msg = "This bit of code is setting forth attributes of badGuy that will be modified."
updateBadGuy5 : Element
updateBadGuy5 =
  body "{ badGuy |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy5Msg) else (Signal.send hoveredOn ""))

updateBadGuy6Msg = "The vx value of badGuy takes the result of the stepV funtion which takes the\n"
                                  ++ "the true or false value for the conditional statements."
updateBadGuy6 : Element
updateBadGuy6 =
  body "vx <- stepV vx (badGuy.vx < 0)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy6Msg) else (Signal.send hoveredOn ""))

updateBadGuy6a : Element
updateBadGuy6a =
  body " (badGuy.vx > 0),"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy6Msg) else (Signal.send hoveredOn ""))

updateBadGuy7Msg = "The vx value of badGuy takes the result of the stepV funtion which takes the\n"
                                  ++ "the true or false value for the conditional statements."
updateBadGuy7 : Element
updateBadGuy7 =
  body "vy <- stepV vy (badGuy.vy < 0 ) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy7Msg) else (Signal.send hoveredOn ""))

updateBadGuy7a : Element
updateBadGuy7a =
  body " (badGuy.vy > 0)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy7Msg) else (Signal.send hoveredOn ""))

updateBadGuy8Msg = "The bracket ends the attributes of badGuy which are modified."
updateBadGuy8 : Element
updateBadGuy8 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy8Msg) else (Signal.send hoveredOn ""))

displayUpdate7 : (Int, Int) -> Int -> String -> Element
displayUpdate7 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer7 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer7 : Int -> String -> Element
updateContainer7 sig hoveredOn=
  flow down
    [ flow right
        [ body " 86."
        , spacer indent 1
        , updateBadGuy9
        ]
    , flow right
        [ body " 87."
        , spacer (indent*2) 1
        , updateBadGuy10
        ]
    , flow right
        [ body " 88."
        , spacer (indent*3) 1
        , updateBadGuy11
        ]
    , flow right
        [ spacer (indent*5) 1
        , updateBadGuy11a
        ]
    , flow right
        [ body " 89."
        , spacer (indent*3) 1
        , updateBadGuy12
        ]
    , flow right
        [ spacer (indent*5) 1
        , updateBadGuy12a
        ]
    , flow right
        [ body " 90."
        , spacer (indent*2) 1
        , updateBadGuy13
        ]
    , body " 91."
    ]

updateBadGuy9Msg = "In all other cases, the function physicsUpdate will be \ncalled with different arguments."
updateBadGuy9 : Element
updateBadGuy9 =
  body "| otherwise -> physicsUpdate t"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy9Msg) else (Signal.send hoveredOn ""))

updateBadGuy10Msg = "Once again, some of the attributes of badGuy will be modified."
updateBadGuy10 : Element
updateBadGuy10 =
  body "{ badGuy |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy10Msg) else (Signal.send hoveredOn ""))

updateBadGuy11Msg = "The value vx takes the result of the function stepV. This is checking to \nsee if "
                                    ++ "the badGuy is going outside the game area. The number 25 is used\n"
                                    ++ "that is the radius of badGuy. This will keep it in the game area."
updateBadGuy11 : Element
updateBadGuy11 =
  body "vx <- stepV vx (x < 25-halfWidth) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy11Msg) else (Signal.send hoveredOn ""))

updateBadGuy11a : Element
updateBadGuy11a =
  body " (x > halfWidth-25),"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy11Msg) else (Signal.send hoveredOn ""))

updateBadGuy12Msg = "The value vx takes the result of the function stepV. This is checking to \nsee if "
                                    ++ "the badGuy is going outside the game area. The number 25 is used\n"
                                    ++ "that is the radius of badGuy. This will keep it in the game area."
updateBadGuy12 : Element
updateBadGuy12 =
  body "vy <- stepV vy (y < 25-halfHeight) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy12Msg) else (Signal.send hoveredOn ""))

updateBadGuy12a : Element
updateBadGuy12a =
  body " (y > halfHeight-25)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy12Msg) else (Signal.send hoveredOn ""))

updateBadGuy13Msg = "The bracket ends the attributes of badGuy which are modified."
updateBadGuy13 : Element
updateBadGuy13 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

-- Update Message 3
displayUpdate8 : (Int, Int) -> Int -> String -> Element
displayUpdate8 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer8 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer8 : Int -> String -> Element
updateContainer8 sig hoveredOn=
  flow down
    [ updatePlayer1
    , flow right
        [ spacer (indent*2) 1
        , updatePlayer1a
        ]
    , updatePlayer2
    ]

updatePlayer1Msg = "This defines the function updatePlayer, which takes a time, an integer, \nanother "
                          ++ "integer, another integer, a player, and returns a player."
updatePlayer1 : Element
updatePlayer1 =
  body " 92. updatePlayer : Time -> Int -> Int -> Int -> "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer1Msg) else (Signal.send hoveredOn ""))

updatePlayer1a : Element
updatePlayer1a =
  body " Player -> Player"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer1Msg) else (Signal.send hoveredOn ""))

updatePlayer2Msg = "The function updatePlayer is called with t, dir1, dir2, lives, and player."
updatePlayer2 : Element
updatePlayer2 =
  body " 93. updatePlayer t dir1 dir2 lives player ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer2Msg) else (Signal.send hoveredOn ""))

displayUpdate9 : (Int, Int) -> Int -> String -> Element
displayUpdate9 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer9 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer9 : Int -> String -> Element
updateContainer9 sig hoveredOn=
  flow down
    [ flow right
        [ body " 94."
        , spacer indent 1
        , updatePlayer3
        ]
    , flow right
        [ spacer (indent*5+5) 1
        , updatePlayer3a
        ]
    , flow right
        [ body " 95."
        , spacer (indent*4) 1
        , updatePlayer4
        ]
    , flow right
        [ body " 96."
        , spacer (indent*2) 1
        , updatePlayer5
        ]
    , flow right
        [ body " 97."
        , spacer (indent*3) 1
        , updatePlayer6
        ]
    , flow right
        [ body " 98."
        , spacer (indent*3) 1
        , updatePlayer7
        ]
    , body " 99."
    ]

updatePlayer3Msg = "An object player1 is created. Its attributes of vx and vy are set to the values \ncreated "
                              ++ "by the function physicsUpdate, which takes time t. and player.\n"
                              ++ "The updated vy attribute takes the value of dir2 multiplied by 200. However,\ndir2 "
                              ++ "multiplied by 200 is an integer. The value vy is a float. The toFloat \nfunction converts "
                              ++ "an integer into a float."
updatePlayer3 : Element
updatePlayer3 =
  body "let player1 = physicsUpdate  t { player | "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

updatePlayer3a : Element
updatePlayer3a =
  body " vx <- toFloat dir1 * 200"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

updatePlayer4Msg = "The updated vy attribute takes the value of dir2 multiplied by 200. \nHowever, dir2 "
                              ++ "multiplied by 200 is an integer. The value vy is a float. \nThe toFloat function converts "
                              ++ "an integer into a float."
updatePlayer4 : Element
updatePlayer4 =
  body "vy <- toFloat dir2 * 200}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer4Msg) else (Signal.send hoveredOn ""))

updatePlayer5Msg = "This is a conditional statement tha wants to know if player.lives minus lives is\n"
                               ++ "is greater than 0. Conditinals return true or false."
updatePlayer5 : Element
updatePlayer5 =
  body "alive = if (player.lives - lives < 0)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer5Msg) else (Signal.send hoveredOn ""))

updatePlayer6Msg = "If the previous conditional statement is true, then alives takes the value of 0."
updatePlayer6 : Element
updatePlayer6 =
  body "then 0"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer6Msg) else (Signal.send hoveredOn ""))

updatePlayer7Msg = "If the previous conditional statement is not true, then alive will equal player.lives\n"
                              ++ "minus the value of lives."
updatePlayer7 : Element
updatePlayer7 =
  body "else (player.lives - lives)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer7Msg) else (Signal.send hoveredOn ""))

displayUpdate10 : (Int, Int) -> Int -> String -> Element
displayUpdate10 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer10 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer10 : Int -> String -> Element
updateContainer10 sig hoveredOn=
  flow down
    [ flow right
        [ body " 100."
        , spacer indent 1
        , updatePlayer8
        ]
    , flow right
        [ body " 101."
        , spacer (indent*2) 1
        , updatePlayer9
        ]
    , flow right
        [ body " 102."
        , spacer (indent*3) 1
        , updatePlayer10
        ]
    , flow right
        [ spacer (indent*7) 1
        , updatePlayer10a
        ]
    , flow right
        [ body " 103."
        , spacer (indent*3) 1
        , updatePlayer11
        ]
    , flow right
        [ spacer (indent*7) 1
        , updatePlayer11a
        ]
    , flow right
        [ body " 104."
        , spacer (indent*3) 1
        , updatePlayer12
        ]
    , flow right
        [ body " 105."
        , spacer (indent+8) 1
        , updatePlayer13
        ]
    , body " 106."
    ]

updatePlayer8Msg = "This is the second part of the let statement. The newly introduced alive will be\n"
                               ++ "used below."
updatePlayer8 : Element
updatePlayer8 =
  body "in"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer8Msg) else (Signal.send hoveredOn ""))

updatePlayer9Msg = "This says that within player1, the following attributes will be updated."
updatePlayer9 : Element
updatePlayer9 =
  body "{ player1 |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer9Msg) else (Signal.send hoveredOn ""))

updatePlayer10Msg = "The updated attribute y takes the value of player1.y. However, the value is\n"
                                ++ "limited (or clamped) to any number between 35 - halfHeight (-165) and\n"
                                ++ "halfHeight - 35 (165)."
updatePlayer10 : Element
updatePlayer10 =
  body "y <- clamp (35-halfHeight) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer10Msg) else (Signal.send hoveredOn ""))

updatePlayer10a : Element
updatePlayer10a =
  body " (halfHeight-35) player1.y,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer10Msg) else (Signal.send hoveredOn ""))

updatePlayer11Msg = "The updated attribute x takes the value of player1.x. However, the value is\n"
                                ++ "limited (or clamped) to any number between 35 - halfWidth (-265) and\n"
                                ++ "halfWidth-35 (265)."
updatePlayer11 : Element
updatePlayer11 =
  body "x <- clamp (35-halfWidth) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer11Msg) else (Signal.send hoveredOn ""))

updatePlayer11a : Element
updatePlayer11a =
  body " (halfWidth-35) player1.x,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer11Msg) else (Signal.send hoveredOn ""))

updatePlayer12Msg = "The updated attribute lives takes the value of alive."
updatePlayer12 : Element
updatePlayer12 =
  body "lives <- alive"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer12Msg) else (Signal.send hoveredOn ""))

updatePlayer13Msg = "This bracket the update for player1."
updatePlayer13 : Element
updatePlayer13 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

-- Update Message 4
displayUpdate11 : (Int, Int) -> Int -> String -> Element
displayUpdate11 (width, height) sig hoveredOn=
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer11 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer11 : Int -> String -> Element
updateContainer11 sig hoveredOn =
  flow down
    [ updatePhysics1
    , flow right
        [ body " 108."
        , spacer indent 1
        , updatePhysics2
        ]
    , flow right
        [ body " 109."
        , spacer (indent*2) 1
        , updatePhysics3
        ]
    , flow right
        [ body " 110."
        , spacer (indent*2) 1
        , updatePhysics4
        ]
    , flow right
        [ body " 111."
        , spacer indent 1
        , updatePhysics5
        ]
    , body " 112."
    ]

updatePhysics1Msg = "The function updatePhysics takes t (time) and the values of x, y, vx, and vy\n"
                          ++ "which are treated as one object."
updatePhysics1 : Element
updatePhysics1 =
  body " 107. physicsUpdate t ({x,y,vx,vy} as obj) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics1Msg) else (Signal.send hoveredOn ""))

updatePhysics2Msg = "This line of code means that the object will have its attribures modified."
updatePhysics2 : Element
updatePhysics2 =
  body "{ obj |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics2Msg) else (Signal.send hoveredOn ""))

updatePhysics3Msg = "The x attribute becomes x plus vx multiplied by t."
updatePhysics3 : Element
updatePhysics3 =
  body "x <- x + vx * t,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics3Msg) else (Signal.send hoveredOn ""))

updatePhysics4Msg = "The y attribute becomes y plus vy multiplied by t."
updatePhysics4 : Element
updatePhysics4 =
  body "y <- y + vy * t"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics4Msg) else (Signal.send hoveredOn ""))

updatePhysics5Msg = "This brakcet closes the updatePhysics function."
updatePhysics5 : Element
updatePhysics5 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics5Msg) else (Signal.send hoveredOn ""))

displayUpdate12 : (Int, Int) -> Int -> String -> Element
displayUpdate12 (width, height) sig hoveredOn=
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer12 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer12 : Int -> String -> Element
updateContainer12 sig hoveredOn =
  flow down
    [ updateNear1
    , flow right
        [ body " 114."
        , spacer indent 1
        , updateNear2
        ]
    , body " 115."
    ]

updateNear1Msg = "The function near takes three arguments: k, c, and n. It determines if two \nobjects "
                            ++ "(k and n) are near one another based upon a third number (c)."
updateNear1 : Element
updateNear1 =
  body " 113. near k c n ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateNear1Msg) else (Signal.send hoveredOn ""))

updateNear2Msg = "This is the logic equation to determine if two objects are touching."
updateNear2 : Element
updateNear2 =
  body "n >= k-c && n <= k+c"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateNear2Msg) else (Signal.send hoveredOn ""))

displayUpdate13 : (Int, Int) -> Int -> String -> Element
displayUpdate13 (width, height) sig hoveredOn=
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer13 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer13 : Int -> String -> Element
updateContainer13 sig hoveredOn =
  flow down
    [ updateWithin1
    , flow right
        [ body " 117."
        , spacer indent 1
        , updateWithin2
        ]
    , flow right
        [ spacer (indent*4) 1
        , updateWithin2a
        ]
    , body " 118."
    ]

updateWithin1Msg = "The function within takes badGuy and player1 and determines if they \nare touching."
updateWithin1 : Element
updateWithin1 =
  body " 116. within badGuy player1 ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin1Msg) else (Signal.send hoveredOn ""))

updateWithin2Msg = "The function within calls the function near, and passes it the x positions \nof player1 "
                                ++ "and badGuy, as well as the number 25. 25 is used because that \nis the radius of "
                                ++ "badGuy. This also checks to see if the y positions are \ntouching as well."
updateWithin2 : Element
updateWithin2 =
  body "near player1.x 25 badGuy.x && "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin2Msg) else (Signal.send hoveredOn ""))

updateWithin2a : Element
updateWithin2a =
  body " near player1.y 25 badGuy.y"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin2Msg) else (Signal.send hoveredOn ""))

displayUpdate14 : (Int, Int) -> Int -> String -> Element
displayUpdate14 (width, height) sig hoveredOn=
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , codeElement <| updateContainer14 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

updateContainer14 : Int -> String -> Element
updateContainer14 sig hoveredOn =
  flow down
    [ updateStepV1
    , flow right
        [ body " 120."
        , spacer indent 1
        , updateStepV2
        ]
    , flow right
        [ body " 121."
        , spacer (indent + 1) 1
        , updateStepV3
        ]
    , flow right
        [ body " 122."
        , spacer (indent + 1) 1
        , updateStepV4
        ]
    , body " 123."
    ]

updateStepV1Msg = "The defines what the function stepV does. It takes two conditions (true \nor false) "
                              ++ "and a third term, v. StepV is used to bounce badGuy off of the \nedges of the "
                              ++ "game area."
updateStepV1 : Element
updateStepV1 =
  body " 119. stepV v condition1 condition2 ="
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
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , subtitleElement viewWelcomeMsg2
    , buttonsLRElement sig
    ]))

wayfindingView : Element
wayfindingView =
  color grey <| container 400 50 middle <| (flow right
    [ collage 30 50
        [ wayfinderPast ] --Intro page
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Imports section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Signals section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Model section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Updae section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPresent ] --View section
    , collage 30 50
        [ dashPresent ]
    , collage 30 50
        [ wayfinderFuture ] --Congrats section
    ])

viewWelcomeMsg1 : String
viewWelcomeMsg1 =
  "View Section\n"

viewWelcomeMsg2 : String
viewWelcomeMsg2 =
  "Up until this point, there has been\n" ++
  "no graphical representation of the\n" ++
  "game. The position and lives of the\n" ++
  "characters existed only as numbers.\n" ++
  "The View Section displays the game\n" ++
  "to the computer screen. You will:\n\n" ++
  "&diams; Create specific colors and text\n" ++
  "   formatting.\n" ++
  "&diams; Draw the playing surface and\n" ++
  "   characters.\n" ++
  "&diams; Color the playing surface and \n" ++
  "   characters.\n" ++
  "&diams; Put the lives on the top of the screen\n" ++
  "   and a message on the bottom."

-- View Message 1
displayView1 : (Int, Int) -> Int -> String -> Element
displayView1 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer1 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer1 : Int -> String -> Element
viewContainer1 sig hoveredOn =
  flow down
    [ viewFunc1
    , viewFunc2
    ]

viewFunc1Msg = "The function view takes a tupple of integers and a game, and the function \nreturns "
                          ++ "an element. A tupple is two numbers grouped together by \nparentheses. An "
                          ++ "integer is a number without a decimal."
viewFunc1 : Element
viewFunc1 =
  body " 124. view : (Int, Int) -> Game -> Element"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc1Msg) else (Signal.send hoveredOn ""))

viewFunc2Msg = "The function view is passed the width and height of the window, as well as\n"
                          ++ "the attributes state, badGuy, and player1 all of which are a part of "
                          ++ "the \ndata type Game."
viewFunc2 : Element
viewFunc2 =
  body " 125. view (w, h) {state, badGuy, player1} ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc2Msg) else (Signal.send hoveredOn ""))

displayView2 : (Int, Int) -> Int -> String -> Element
displayView2 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer2 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer2 : Int -> String -> Element
viewContainer2 sig hoveredOn =
  flow down
    [ flow right
        [ body " 126."
        , spacer indent 1
        , viewFunc3
        ]
    , flow right
        [ body " 127."
        , spacer (indent*2) 1
        , viewFunc4
        ]
    , flow right
        [ spacer (indent*5) 1
        , viewFunc4a
        ]
    ]

viewFunc3Msg = "The let expression creates an object lives, which is of type element."
viewFunc3 : Element
viewFunc3 =
  body "let lives : Element"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc3Msg) else (Signal.send hoveredOn ""))

viewFunc4Msg = "The objecct lives is assigned the value of player1.lives, which is the\n"
                          ++ "remaining lives of player1. The object lives is converted to a string,\n"
                          ++ "and has a size of 50."
viewFunc4 : Element
viewFunc4 =
  body "lives = txt(Text.height 50) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc4Msg) else (Signal.send hoveredOn ""))

viewFunc4a : Element
viewFunc4a =
  body " (toString player1.lives)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc4Msg) else (Signal.send hoveredOn ""))

displayView3 : (Int, Int) -> Int -> String -> Element
displayView3 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer3 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer3 : Int -> String -> Element
viewContainer3 sig hoveredOn =
  flow down
    [ flow right
        [ body " 128."
        , spacer indent 1
        , viewFunc5
        ]
    , flow right
        [ body " 129."
        , spacer (indent*2) 1
        , viewFunc6
        ]
    , flow right
        [ body " 130."
        , spacer (indent*2) 1
        , viewFunc7
        ]
    ]

viewFunc5Msg = "In is part of the let expression, and indicates where the newly defined\n"
                          ++ "will be used."
viewFunc5 : Element
viewFunc5 =
  body "in"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc5Msg) else (Signal.send hoveredOn ""))

viewFunc6Msg = "A container is an object that holds elements. This container has the\n"
                          ++ "same width and height as the window. In the middle of this\n"
                          ++ "container is the following:"
viewFunc6 : Element
viewFunc6 =
  body "container w h middle <|"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc6Msg) else (Signal.send hoveredOn ""))

viewFunc7Msg = "A collage is collection of 2D forms. The forms can be placed anywhere\n"
                        ++ "inside the collage. This collage has a width of gameWidth and a\n"
                        ++ "height of gameHeight. That is, the collage is a 600 by 400 rectangle."
viewFunc7 : Element
viewFunc7 =
  body "collage gameWidth gameHeight"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc7Msg) else (Signal.send hoveredOn ""))

displayView4 : (Int, Int) -> Int -> String -> Element
displayView4 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer4 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer4 : Int -> String -> Element
viewContainer4 sig hoveredOn =
  flow down
    [ flow right
        [ body " 131."
        , spacer (indent*3) 1
        , viewFunc8
        ]
    , flow right
        [ body " 132."
        , spacer (indent*4) 1
        , viewFunc9
        ]
    ]

viewFunc8Msg = "Inside of the collage is a rectangle with the same dimensions as the collage."
viewFunc8 : Element
viewFunc8 =
  body "[ rect gameWidth gameHeight"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc8Msg) else (Signal.send hoveredOn ""))

viewFunc9Msg = "The rectangle is filled with the purple/grey from the Elm logo."
viewFunc9 : Element
viewFunc9 =
  body "|> filled elmGrey"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc9Msg) else (Signal.send hoveredOn ""))

displayView5 : (Int, Int) -> Int -> String -> Element
displayView5 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer5 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer5 : Int -> String -> Element
viewContainer5 sig hoveredOn =
  flow down
    [ flow right
        [ body " 133."
        , spacer (indent*3) 1
        , viewFunc10
        ]
    , flow right
        [ body " 134."
        , spacer (indent*4) 1
        , viewFunc11
        ]
    , flow right
        [ body " 135."
        , spacer (indent*4) 1
        , viewFunc12
        ]
    ]

viewFunc10Msg = "Also in the collage is a six-sided shape with a radius fo 25."
viewFunc10 : Element
viewFunc10 =
  body ", ngon 6 25 "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc10Msg) else (Signal.send hoveredOn ""))

viewFunc11Msg = "The hexagon is filled with the orange from the Elm logo."
viewFunc11 : Element
viewFunc11 =
  body "|> filled elmOrange"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc11Msg) else (Signal.send hoveredOn ""))

viewFunc12Msg = "The hexagon is moved to the x and y coordinates of badGuy.\n"
                            ++ "Thus the hexagon represents the antagonist in the game."
viewFunc12 : Element
viewFunc12 =
  body "|> move (badGuy.x, badGuy.y)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc12Msg) else (Signal.send hoveredOn ""))

displayView6 : (Int, Int) -> Int -> String -> Element
displayView6 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer6 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer6 : Int -> String -> Element
viewContainer6 sig hoveredOn =
  flow down
    [ flow right
        [ body " 136."
        , spacer (indent*3) 1
        , viewFunc13
        ]
    , flow right
        [ body " 137."
        , spacer (indent*4) 1
        , viewFunc14
        ]
    , flow right
        [ body " 138."
        , spacer (indent*4) 1
        , viewFunc15
        ]
    ]

viewFunc13Msg = "A circle with a radius of 20 is also in the collage."
viewFunc13 : Element
viewFunc13 =
  body ", circle 20"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc13Msg) else (Signal.send hoveredOn ""))

viewFunc14Msg = "The circle is filled with the blue from the Elm logo."
viewFunc14 : Element
viewFunc14 =
  body "|> filled elmBlue"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc14Msg) else (Signal.send hoveredOn ""))

viewFunc15Msg = "The circle is moved to the x and y coordinates of player1.\n"
                            ++ "Thus the circle represents the proagonist in the game."
viewFunc15 : Element
viewFunc15 =
  body "|> move (player1.x, player1.y)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc15Msg) else (Signal.send hoveredOn ""))

-- View Message 2
displayView7 : (Int, Int) -> Int -> String -> Element
displayView7 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer7 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer7 :  Int -> String -> Element
viewContainer7 sig hoveredOn =
  flow down
    [ flow right
        [ body " 139."
        , spacer (indent*3) 1
        , viewFunc16
        ]
    , flow right
        [ body " 140."
        , spacer (indent*4) 1
        , viewFunc17
        ]
    ]

viewFunc16Msg = "The lives is also in the collage. Since only forms can exist in a\n"
                            ++ "collage, lives is transformed into a form."
viewFunc16 : Element
viewFunc16 =
  body ", toForm lives"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc15Msg) else (Signal.send hoveredOn ""))

viewFunc17Msg = "The form lives is moved to the location 0, gameHeight/2 - 40.\n"
                            ++ "That is to say, 40 pixels from the top of the game, or 0, 160."
viewFunc17 : Element
viewFunc17 =
  body "|> move (0, gameHeight/2 - 40)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc17Msg) else (Signal.send hoveredOn ""))

displayView8 : (Int, Int) -> Int -> String -> Element
displayView8 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer8 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer8 :  Int -> String -> Element
viewContainer8 sig hoveredOn =
  flow down
    [ flow right
        [ body " 141."
        , spacer (indent*3) 1
        , viewFunc18
        ]
    , flow right
        [ spacer (indent*6) 1
        , viewFunc18a
        ]
    , flow right
        [ body " 142."
        , spacer (indent*4) 1
        , viewFunc19
        ]
    , flow right
        [ body " 143."
        , spacer (indent*3) 1
        , viewFunc20
        ]
    , body " 144."
    ]

viewFunc18Msg = "There is one last form in the collage. The state of the game is Play,\n"
                           ++ "then there is a spacer with the width of 1 and the height of 1.\n"
                           ++ "A spacer is a place holder. If the state is Pause, then the contents\n"
                           ++ "of the variable msg appear as text."
viewFunc18 : Element
viewFunc18 =
  body ", toForm (if state == Play then "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc18Msg) else (Signal.send hoveredOn ""))

viewFunc18a : Element
viewFunc18a =
  body " spacer 1 1 else txt identity msg"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc18Msg) else (Signal.send hoveredOn ""))

viewFunc19Msg = "This last form is moved to the location 0, gameHeight/2 - 40.\n"
                            ++ "That is to say, 40 pixels from the bottom of the game, or 0, -160."
viewFunc19 : Element
viewFunc19 =
  body "|> move (0, 40 - gameHeight/2)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc19Msg) else (Signal.send hoveredOn ""))

viewFunc20Msg = "This bracket closes the list of forms found in the collage."
viewFunc20 : Element
viewFunc20 =
  body "]"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc20Msg) else (Signal.send hoveredOn ""))

displayView9 : (Int, Int) -> Int -> String -> Element
displayView9 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer9 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer9 :  Int -> String -> Element
viewContainer9 sig hoveredOn =
  flow down
    [ elmGreyColor
    , elmBlueColor
    , elmGreenColor
    , textColor
    ]

elmGreyColorMsg = "The variable elmGrey is set to color with the red value of 71,\n"
                                  ++ "the green value of 80, and the blue value of 102."
elmGreyColor : Element
elmGreyColor =
  body " 145. elmGrey = rgb 71 80 102"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmGreyColorMsg) else (Signal.send hoveredOn ""))

elmBlueColorMsg = "The variable elmBlue is set to color with the red value of 76,\n"
                                  ++ "the green value of 166, and the blue value of 195."
elmBlueColor : Element
elmBlueColor =
  body " 146. elmBlue = rgb 71 80 102"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmBlueColorMsg) else (Signal.send hoveredOn ""))

elmGreenColorMsg = "The variable elmGreen is set to color with the red value of 127,\n"
                                  ++ "the green value of 209, and the blue value of 17."
elmGreenColor : Element
elmGreenColor =
  body " 147. elmGreen = rgb 71 80 102"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmGreenColorMsg) else (Signal.send hoveredOn ""))

textColorMsg = "The variable textColor is set to the value of white. This will be the color\n"
                        ++ "used for any text prefaced with txt."
textColor : Element
textColor =
  body " 148. textColor = white"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textColorMsg) else (Signal.send hoveredOn ""))

displayView10 : (Int, Int) -> Int -> String -> Element
displayView10 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer10 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer10 :  Int -> String -> Element
viewContainer10 sig hoveredOn =
  flow down
    [ txtFunc1
    , flow right
        [ spacer (indent*3) 1
        , txtFunc2
        ]
    , flow right
        [ spacer (indent*3) 1
        , txtFunc3
        ]
    ]

txtFunc1Msg = "This function sets up the characteristics for the text used in the game. The \ntext "
                    ++ "is converted from a string, has the color textColor (or white)."
txtFunc1 : Element
txtFunc1 =
  body " 149. txt f = Text.fromString >> Text.color "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc1Msg) else (Signal.send hoveredOn ""))

txtFunc2Msg = "The text also has the font monospace."
txtFunc2 : Element
txtFunc2 =
  body " textColor >> Text.monospace "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc2Msg) else (Signal.send hoveredOn ""))

txtFunc3Msg = "The text is left aligned."
txtFunc3 : Element
txtFunc3 =
  body " >> f >> Text.leftAligned"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc3Msg) else (Signal.send hoveredOn ""))

displayView11 : (Int, Int) -> Int -> String -> Element
displayView11 (width, height) sig hoveredOn =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , codeElement <| viewContainer11 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]))

viewContainer11 :  Int -> String -> Element
viewContainer11 sig hoveredOn =
  flow down
    [ msgFunc1
    , flow right
        [ spacer (indent*3) 1
        , msgFunc2
        ]
    ]

msgFuncMsg = "This string is converted to text and placed at the bottom of the game when\n"
                      ++ "the state is Pause. These are the instructions on how to play the game. &larr\n"
                      ++ "inserts a left arrow symbol. Remove the space before the semi-colon so the \nsymbol "
                      ++ "will appear. With a space &larr ;. Without a space &larr;."
msgFunc1 : Element
msgFunc1 =
  body " 150. msg = 'SPACE to start, &larr ;&uarr ;"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn msgFuncMsg) else (Signal.send hoveredOn ""))

msgFunc2 : Element
msgFunc2 =
  body " &darr ;&rarr ; to move'"
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
    [ wayfindingElement wayfindingCongrats
    , titleElement viewCongratsMsg1
    , subtitleElement viewCongratsMsg2
    , buttonsLRElement sig
    ]))

wayfindingCongrats : Element
wayfindingCongrats =
  color grey <| container 400 50 middle <| (flow right
    [ collage 30 50
        [ wayfinderPast ] --Intro page
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Imports section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Signals section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Model section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --Updae section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPast ] --View section
    , collage 30 50
        [ dashPast ]
    , collage 30 50
        [ wayfinderPresent ] --Congrats section
    ])

viewCongratsMsg1 : String
viewCongratsMsg1 =
  "Congratulations"

viewCongratsMsg2 : String
viewCongratsMsg2 =
  "You made the foundation of a game.\n" ++
  "Advance through the next few pages\n" ++
  "for some ideas on what you can do to\n" ++
  "make the game better. Possible ideas\n" ++
  "include:\n\n" ++
  "&diams; Adding additional levels.\n" ++
  "&diams; Adding another enemy.\n" ++
  "&diams; Changing the layout.\n\n" ++
  "This tutorial ends with some links to\n" ++
  "more resources for learning Elm."

-- Idea 1
idea1 : (Int, Int) -> Int -> Element
idea1 (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewIdea1Msg1
    , subtitleElement viewIdea1Msg2
    , buttonsLRElement sig
    ]))

viewIdea1Msg1 : String
viewIdea1Msg1 =
  "Next Level"

viewIdea1Msg2 : String
viewIdea1Msg2 =
  "Good video games hold the attention\n" ++
  "of the player. To do this, you will need\n" ++
  "to add some more levels. Some\n" ++
  "suggestions include:\n\n" ++
  " &diams; Stay alive for a certain amount of\n" ++
  "    time. The amount of time required\n" ++
  "    to stay alive will increase with each\n" ++
  "    level.\n" ++
  " &diams; Collect a certain number of objects\n" ++
  "    before advancing. Each object will\n" ++
  "    randomly appears one at a time."

-- Idea 2
idea2 : (Int, Int) -> Int -> Element
idea2 (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewIdea2Msg1
    , subtitleElement viewIdea2Msg2
    , buttonsLRElement sig
    ]))

viewIdea2Msg1 : String
viewIdea2Msg1 =
  "Another Enemy"

viewIdea2Msg2 : String
viewIdea2Msg2 =
  "To differentiate the levels and increase\n" ++
  "the difficulty, add another enemy to the\n" ++
  "game.\n\n" ++
  "&diams; Have them move at different speeds.\n" ++
  "&diams; Use a different size and shape.\n" ++
  "&diams; Use a different color. Try the orange\n" ++
  "   from the Elm logo - rgb 237 149 0.\n" ++
  "&diams; Increase the number of enemies on a\n" ++
  "   set interval, i.e. every five levels adds\n" ++
  "   another enemy."

-- Idea 3
idea3 : (Int, Int) -> Int -> Element
idea3 (width, height) sig =
  color elmGrey (container width height middle (flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewIdea3Msg1
    , subtitleElement viewIdea3Msg2
    , buttonsLRElement sig
    ]))

viewIdea3Msg1 : String
viewIdea3Msg1 =
  "New Layouts"

viewIdea3Msg2 : String
viewIdea3Msg2 =
  "Aviod boring the player by using a\n" ++
  "rectangle layout for every level.\n" ++
  "Think of ways to modify or enhance\n" ++
  "the layout to make the game fun\n" ++
  "and interesting. Some suggestions\n" ++
  "include:\n\n" ++
  "&diams; Have obstacles through which\n" ++
  "   the player cannot pass.\n" ++
  "&diams; Change the color of certain parts\n" ++
  "   of the layout. The colored regions\n" ++
  "   take a life of the player when\n" ++
  "   touched."
