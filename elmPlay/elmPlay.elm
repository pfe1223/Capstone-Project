import Signal (Signal, map3, foldp, subscribe, channel, Channel, send)
import Signal
import Color (..)
import Graphics.Element (..)
import Graphics.Input (hoverable, button, customButton)
import Text
import Window
import Mouse
import String (padLeft)
import Graphics.Collage (..)
import Html (a, text, toElement)
import Html.Attributes (href, target)

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
  if | sig == 0 -> displayWelcome (width, height) sig
     | sig == 1 -> importsWelcome(width, height) sig
     | sig == 2 -> displayImports (width, height) sig hoveredOn
     | sig == 3 -> signalsWelcome (width, height) sig
     | sig == 4 -> displaySignals1 (width, height) sig hoveredOn
     | sig == 5 -> displaySignals2 (width, height) sig hoveredOn
     | sig == 6 -> displaySignals3 (width, height) sig hoveredOn
     | sig == 7 -> displaySignals4 (width, height) sig hoveredOn
     | sig == 8 -> modelWelcome (width, height) sig
     | sig == 9 -> displayModel1 (width, height) sig hoveredOn
     | sig == 10-> displayModel2 (width, height) sig hoveredOn
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
     | sig == 47 -> elmResources (width, height) sig
     | otherwise -> displayWelcome (width, height) sig

-- These numbers are used to create the containers that hold the code examples and explinations
indent = 20
containerWidth = 400
containerHeight = 700
subtitleHeight = 375
extraLine = 15
codeHeight = 30
gameHeight = 225
bottomHeight = 150
iconHeight = 125
linkWidth = 200
questionHeight = 300
dropdownHeight = 100

-- Wayfinding tools
wayfinderPast =
  circle 15
    |> filled darkerBlue
    |> alpha 0.5

wayfinderPresent =
  circle 15
    |> filled darkerBlue

wayfinderFuture =
  circle 15
    |> outlined (solid darkerBlue)

dashPast =
  rect 20 5
    |> filled darkerBlue
    |> alpha 0.5

dashPresent =
  rect 20 5
    |> filled darkerBlue

-- Display elements
gifElement gif =
  color grey <| collage containerWidth 125 [ toForm gifImage ]

resourcesElement : String -> Element
resourcesElement strg =
  color grey <| container containerWidth 90 middle <| subTitle strg

welcomeElement : String -> Element
welcomeElement strg =
  color grey <| container containerWidth 375 middle <| subTitle strg

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
  color grey <| container containerWidth gameHeight midLeft gameCode

helpElement : String -> Element
helpElement hoveredOn =
  color grey <| container containerWidth bottomHeight middle <| body hoveredOn

iconElement : Element -> Element
iconElement iconType =
  color grey <| container containerWidth iconHeight middle iconType

buttonGoElement : Int -> Element
buttonGoElement sig =
  color grey <| container containerWidth 50 midRight <| flow left
    [ spacer 5 1
    , customGoButton sig
    ]

buttonsLRElement : Int -> Element
buttonsLRElement sig =
  color grey <| container containerWidth 50 midRight <| flow left
    [ spacer 5 1
    , customRButton sig
    , spacer 5 1
    , customLButton sig
    ]

buttonSOElement : Int -> Element
buttonSOElement sig =
  color grey <| container containerWidth 50 midLeft <| flow right
    [ spacer 5 1
    , startOver sig
    ]

questionElement : String -> Element
questionElement strg =
  color grey <| container containerWidth questionHeight middle <| subTitle strg

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

startOver : Int -> Element
startOver sig =
  size 100 40 <| color grey <| button (send chan (0)) "Start Over"

customLButton : Int -> Element
customLButton sig =
 customButton (send chan (sig - 1))
 (image 40 40 "/images/leftButton.svg")
 (image 40 40 "/images/leftButton.svg")
 (image 40 40 "/images/leftButton.svg")

customRButton : Int -> Element
customRButton sig =
 customButton (send chan (sig + 1))
 (image 40 40 "/images/rightButton.svg")
 (image 40 40 "/images/rightButton.svg")
 (image 40 40 "/images/rightButton.svg")

customGoButton : Int -> Element
customGoButton sig =
 customButton (send chan (sig + 1))
 (image 100 40 "/images/goButton.svg")
 (image 100 40 "/images/goButton.svg")
 (image 100 40 "/images/goButton.svg")

-- Custom colors based on the Elm logo
backgroundColor = rgb 39 45 60
darkerGreen = rgb 90 146 15
darkerBlue = rgb 42 105 129
darkerOrange = rgb 166 105 10
elmGrey = rgb 71 80 102
elmOrange = rgb 237 149 0
elmBlue = rgb 76 166 195
elmGreen = rgb 127 209 17

-- Images
gifImage = image 180 119 "/images/demoGif1.gif"
elmLogo = image 100 100 "/images/elmLogo.svg"
importsIcon = image 100 100 "images/importsIcon.svg"
modelIcon = image 100 100 "images/modelIcon.svg"
signalsIcon = image 100 100 "images/signalsIcon.svg"
updateIcon = image 100 100 "images/updateIcon.svg"
viewIcon = image 100 100 "images/viewIcon.svg"

-- Text formatting
title f = Text.fromString(f)
            |> Text.color darkerGreen
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingWelcome
    , titleElement welcomeMsg1
    , gifElement gifImage
    , welcomeElement welcomeMsg2
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
  "Welcome to Elm Play, where you will\n" ++
  "learn how to make a game with the\n" ++
  "Elm language. The pages that follow\n" ++
  "give you code to copy into the editor.\n" ++
  "Put the mouse over the code to get an \n" ++
  "explanation of what the code does. Pay\n" ++
  "attention to the line numbers. Some\n" ++
  "lines are left blank to separate blocks\n" ++
  "of code. Some code does not have a\n" ++
  "line number as it goes with the line of\n" ++
  "code above. Click on the button below\n" ++
  "to begin."


{--
*************************************************************
This section has all of the code for explaining the IMPORT section of the game
*************************************************************
--}

-- Imports Welcome
importsWelcome : (Int, Int) -> Int -> Element
importsWelcome (width, height) sig =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingImports
    , titleElement importsWelcomeMsg1
    , iconElement importsIcon
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingImports
    , titleElement importsWelcomeMsg1
    , iconElement importsIcon
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

colorMsg = "Import the Color library. This allows you\n" ++
           "setting the colors for the game area and\n" ++
           "the shapes."
importColor : Element
importColor =
  body " 1. import Color (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn colorMsg) else (Signal.send hoveredOn ""))

graphicsElementMsg = "Import everything from the Graphics.Element\n" ++
                     "library. Elements help with the layoutof the\n" ++
                     "game. This program uses an element to center\n" ++
                     "the game in the middle of the page."
importGraphicsElement : Element
importGraphicsElement =
  body " 3. import Graphics.Element (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsElementMsg) else (Signal.send hoveredOn ""))

graphicsCollageMsg = "Import everything from the Graphics.Collage\n" ++
                     "library. Collages are freeform graphics. This is\n" ++
                     "the game area with the shapes that move around."
importGraphicsCollage : Element
importGraphicsCollage =
  body " 2. import Graphics.Collage (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsCollageMsg) else (Signal.send hoveredOn ""))

textMsg = "Import everything from the Text library. This\n" ++
          "library allows you to change the size, color,\n" ++
          "and position of the text used in this game."
importText : Element
importText =
  body " 6. import Text (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textMsg) else (Signal.send hoveredOn ""))

signalMsg = "Import the Signal library. Signals are values\n" ++
            "that change over time. Signals often are input\n" ++
            "from the user. Signals can also be time or the\n" ++
            "size of a window."
importSignal : Element
importSignal =
  body " 5. import Signal"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMsg) else (Signal.send hoveredOn ""))

keyboardMsg = "Import the Keyboard library. This allows the\n" ++
              "game to register the key presses when moveing\n" ++
              "the circle."
importKeyboard : Element
importKeyboard =
  body (" 4. import Keyboard")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn keyboardMsg) else (Signal.send hoveredOn ""))

timeMsg = "Import the Time library. Specifically, you\n" ++
          "need the frames per second function, which\n" ++
          "notes the changes in time."
importTime : Element
importTime =
  body (" 7. import Time")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn timeMsg) else (Signal.send hoveredOn ""))

windowMsg = "Import the Window library. This allows you to\n" ++
            "access the width and height of the window, which\n" ++
            "is used when centering the game on the page."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
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

signalMain1Msg = "Define the main function. Every Elm\n" ++
                 "program must have a main. Main functions\n" ++
                 "often combine signals with the function\n" ++
                 "that writes the output to the screen."
signalMain1 : Element
signalMain1 =
  body " 10. main ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain1Msg) else (Signal.send hoveredOn ""))

signalMain2Msg = "This function maps (or combines) the view\n" ++
                 "function (writes the game to the screen)\n" ++
                 "with the windo dimensions signal and the\n" ++
                 "gameState signal."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
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

signalGameState1Msg = "Define gameState as a signal of type Game.\n" ++
                      "The data type Game will be discussed in the\n" ++
                      "Model section."
signalGameState1 : Element
signalGameState1 =
  body " 13. gameState : Signal Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState1Msg) else (Signal.send hoveredOn ""))

signalGameState2Msg = "Define the specifics of gameState."
signalGameState2 : Element
signalGameState2 =
  body " 14. gameState ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState2Msg) else (Signal.send hoveredOn ""))

signalGameState3Msg = "gameState is a past dependent function, which\n" ++
                      "means it remembers the past values of update,\n" ++
                      "defaultGame, and input.\n"
signalGameState3 : Element
signalGameState3 =
  body" Signal.foldp update defaultGame input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState3Msg) else (Signal.send hoveredOn ""))

displaySignals3 : (Int, Int) -> Int -> String -> Element
displaySignals3 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
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

signalDelta2Msg = "inSeconds marks the current time in seconds. fps\n" ++
                  "marks the change in time every one-thrity-fifth\n" ++
                  "of a second. This signal maps (or combines) the\n" ++
                  "above together so that the change in time is in\n." ++
                  "seconds."

signalDelta2 : Element
signalDelta2 =
  body " Signal.map inSeconds (fps 35)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDelta2Msg) else (Signal.send hoveredOn ""))

displaySignals4 : (Int, Int) -> Int -> String -> Element
displaySignals4 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
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

signalInput1Msg = "Defines input as a signal of type Input.\n" ++
                  "The data type Input will be discussed in\n" ++
                  "Model section."
signalInput1 : Element
signalInput1 =
  body " 20. input : Signal Input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput1Msg) else (Signal.send hoveredOn ""))

signalInput2Msg = "Defines the specifics of input."
signalInput2 : Element
signalInput2 =
  body " 21. input ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput2Msg) else (Signal.send hoveredOn ""))

signalInput3Msg = "This function records some data on every delta,\n" ++
                  "which is every 1/35 of a second."
signalInput3 : Element
signalInput3 =
  body "Signal.sampleOn delta <|"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput3Msg) else (Signal.send hoveredOn ""))

signalInput4Msg = "The data recorded is a signal that combines the\n" ++
                  "four attributes of type Indput."
signalInput4 : Element
signalInput4 =
  body "Signal.map4 Input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput4Msg) else (Signal.send hoveredOn ""))

signalInput5Msg = "The first piece of data recorded is the space bar.\n" ++
                  "The result is a true or false based upon the space\n" ++
                  "bar being pressed."
signalInput5 : Element
signalInput5 =
  body "Keyboard.space"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput5Msg) else (Signal.send hoveredOn ""))

signalInput6Msg = "The next pieceof data recorded is the left/right\n" ++
                  "keys. If left arrow is pressed then, the x-value\n" ++
                  "decreases. If the right arrow is pressed, then the\n" ++
                  "x-value increases."
signalInput6 : Element
signalInput6 =
  body "(Signal.map .x Keyboard.arrows)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput6Msg) else (Signal.send hoveredOn ""))

signalInput7Msg = "The next pieceof data recorded is the up/down\n" ++
                  "keys. If down arrow is pressed then, the y-value\n" ++
                  "decreases. If the up arrow is pressed, then the\n" ++
                  "y-value increases."
signalInput7 : Element
signalInput7 =
  body "(Signal.map .y Keyboard.arrows)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput7Msg) else (Signal.send hoveredOn ""))

signalInput8Msg = "Finally, the change in time is recorded in seconds."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
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

gameSizeMsg = "Set gameWidth to 600 and gameHeight to 400.\n" ++
              "gameWidth and gameHeight are also grouped\n" ++
              "together as a tuple.\n"
gameSize : Element
gameSize =
  body " 29. (gameWidth, gameHeight) = (600, 400)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn gameSizeMsg) else (Signal.send hoveredOn ""))

playingSizeMsg = "Set halfWidth to 300 and halfHeight to 200.\n" ++
                 "halfWidth and halfHeight are also grouped\n" ++
                 "together as a tuple.\n"
playingSize : Element
playingSize =
  body " 30. (halfWidth, halfHeight) = (300, 200)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn playingSizeMsg) else (Signal.send hoveredOn ""))

displayModel2 : (Int, Int) -> Int -> String -> Element
displayModel2 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
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

typeStateMsg = "The data type State is created. It has\n" ++
               "the value of either Play or Pause."
typeState : Element
typeState =
  body " 32. type State = Play | Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn typeStateMsg) else (Signal.send hoveredOn ""))

displayModel3 : (Int, Int) -> Int -> String -> Element
displayModel3 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
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

aliasBadGuy1Msg = "Create the type BadGuy as an alias. An alias\n" ++
                  "means that you can define attributes individually.\n"

aliasBadGuy1 : Element
aliasBadGuy1 =
  body " 34. type alias BadGuy ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy1Msg) else (Signal.send hoveredOn ""))

aliasBadGuy2Msg = "The data type BadGuy has the following attributes:\n" ++
                  "an x-value of type float, a y-value of type float,\n" ++
                  "a vx-value of type Float, and a vy-value of type\n" ++
                  "float. Floats are numbers with a decimal."
aliasBadGuy2 : Element
aliasBadGuy2 =
  body "{ x:Float, y:Float, vx:Float, vy:Float }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy2Msg) else (Signal.send hoveredOn ""))

displayModel4 : (Int, Int) -> Int -> String -> Element
displayModel4 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
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

aliasPlayer1Msg = "Create the type BadGuy as an alias. An alias\n" ++
                  "means that you can define attributes individually.\n"
aliasPlayer1 : Element
aliasPlayer1 =
  body " 37. type alias Player ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer1Msg) else (Signal.send hoveredOn ""))

aliasPlayer2Msg = "The data type Player has the following attributes:\n" ++
                  "an x-value of type float, a y-value of type float,\n" ++
                  "a vx-value of type Float, and a vy-value of type\n" ++
                  "float. Floats are numbers with a decimal. Player\n" ++
                  "also has an integer that represents its lives."
aliasPlayer2 : Element
aliasPlayer2 =
  body "{ x:Float, y:Float, vx:Float, vy:Float, lives:Int }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer2Msg) else (Signal.send hoveredOn ""))

displayModel5 : (Int, Int) -> Int -> String -> Element
displayModel5 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
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

aliasGame1Msg = "Create the type Game as an alias. An alias\n" ++
                "means that you can define attributes individually.\n"
aliasGame1 : Element
aliasGame1 =
  body " 40. type alias Game ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame1Msg) else (Signal.send hoveredOn ""))

aliasGame2Msg = "The data type Game has the following attributes:\n" ++
                "a state of type State (either Play or Pause), a \n" ++
                "badGuy of type BadGuy including all its attributes,\n" ++
                "and a player of type Player with all of its attributes.\n"
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
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

defaultGame1Msg = "Create an object defaultGame of type Game."
defaultGame1 : Element
defaultGame1 =
  body " 43. defaultGame : Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame1Msg) else (Signal.send hoveredOn ""))

defaultGame2Msg = "Describe specific values for defaultGame."
defaultGame2 : Element
defaultGame2 =
  body " 44. defaultGame ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame2Msg) else (Signal.send hoveredOn ""))

defaultGame3Msg = "The state is set to the value of Pause."
defaultGame3 : Element
defaultGame3 =
  body "{ state = Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame3Msg) else (Signal.send hoveredOn ""))

defaultGame4Msg = "The badGuy attribute has the values of:\n" ++
                  "x = 0 and y = 0, its starting position\n" ++
                  "vx = 300 and vy = 300, its velocity (speed)."
defaultGame4 : Element
defaultGame4 =
  body ", badGuy = { x=0, y=0, vx=300, vy=300 }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame4Msg) else (Signal.send hoveredOn ""))

defaultGame5Msg = "The player1 attribute has the values of:\n" ++
                  "x = 15-halfWidth and y = 0, its starting position\n" ++
                  "15 is the radius of player1, so 15-halfWidth keeps\n" ++
                  "all of player1 on the game area. vx = 0 and vy = 0,\n" ++
                  "its velocity (speed). The velocity is set to 0 as\n" ++
                  "you have to use arrow keys to make player1 move.\n" ++
                  "It does not move automatically. lives are set to 3."
defaultGame5 : Element
defaultGame5 =
  body ", player1 = { x = 15-halfWidth, y = 0"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame5Msg) else (Signal.send hoveredOn ""))

defaultGame6 : Element
defaultGame6 =
  body ", vx = 0, vy = 0, lives = 3 }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame5Msg) else (Signal.send hoveredOn ""))


defaultGame7Msg = "Ends the list of attributes for defaultGame."
defaultGame7 : Element
defaultGame7 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame7Msg) else (Signal.send hoveredOn ""))

displayModel7 : (Int, Int) -> Int -> String -> Element
displayModel7 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
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

aliasInput1Msg = "Create data type Input wich is an alias."
aliasInput1 : Element
aliasInput1 =
  body " 50. type alias Input ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput1Msg) else (Signal.send hoveredOn ""))

aliasInput2Msg = "There is an attribute called space, which is a\n" ++
                 "boolean value. That is, it is either true or false.\n" ++
                 "space is mapped to the space bar in gameState."
aliasInput2 : Element
aliasInput2 =
  body (padLeft 19 ' ' " { space : Bool")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput2Msg) else (Signal.send hoveredOn ""))

aliasInput3Msg = "There is an attribute called dir1, of type integer.\n" ++
                 "Integer means a number without a decimal."
aliasInput3 : Element
aliasInput3 =
  body (padLeft 17 ' ' " , dir1 : Int")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput3Msg) else (Signal.send hoveredOn ""))

aliasInput4Msg = "There is an attribute called dir2, of type integer.\n" ++
                 "Integer means a number without a decimal."
aliasInput4 : Element
aliasInput4 =
  body (padLeft 17 ' ' " , dir2 : Int")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput4Msg) else (Signal.send hoveredOn ""))

aliasInput5Msg = "There is an attribute called delta with a Time value."
aliasInput5 : Element
aliasInput5 =
  body (padLeft 19 ' ' " , delta : Time")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput5Msg) else (Signal.send hoveredOn ""))

aliasInput6Msg = "Ends the list of attributes for Input."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateFunc1Msg = "Update is a function that takes an object of type\n" ++
                 "Input, an object of type Game, and returns\n" ++
                 "a Game."
updateFunc1 : Element
updateFunc1 =
  body " 57. update : Input -> Game -> Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc1Msg) else (Signal.send hoveredOn ""))

updateFunc2Msg = "Specifically, update takes Input in the form of\n" ++
                 "space, dir1, dir2, and delta. The Game is defined\n" ++
                 "as state, badGuy, and player1."
updateFunc2 : Element
updateFunc2 =
  body " 58. update {space,dir1,dir2,delta} "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc2Msg) else (Signal.send hoveredOn ""))

updateFunc3 : Element
updateFunc3 =
  body " ({state,badGuy,player1} as game) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc2Msg) else (Signal.send hoveredOn ""))


updateFunc4Msg = "The let expression assigns the value of 1 to\n" ++
                 "lives if badGuy is within player1. within is a\n" ++
                 "that will be discussed later in this section. If\n" ++
                 "If badGuy is not within player1, the value of 0\n" ++
                 "is assigned to lives."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateFunc5Msg = "The function newState assumes a value\n" ++
                 "dependent upon the cases below:"
updateFunc5 : Element
updateFunc5 =
  body "newState ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc5Msg) else (Signal.send hoveredOn ""))

updateFunc6Msg = "If the space bar is pressed, then newState takes\n" ++
                 "the value Play."
updateFunc6 : Element
updateFunc6 =
  body "if | space                    -> Play"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc6Msg) else (Signal.send hoveredOn ""))

updateFunc7Msg = "newState assumes the value of Pause if\n" ++
                 "player1.lives is 0. That is, the game stops\n" ++
                 "when player1 runs out of lives."
updateFunc7 : Element
updateFunc7 =
  body "| player1.lives == 0 -> Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc7Msg) else (Signal.send hoveredOn ""))

updateFunc8Msg = "In all other cases, newState assumes the value\n" ++
                 "of state. That is, nothing changes."
updateFunc8 : Element
updateFunc8 =
  body "| otherwise              -> state"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc8Msg) else (Signal.send hoveredOn ""))

displayUpdate3 : (Int, Int) -> Int -> String -> Element
displayUpdate3 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateFunc9Msg = "The value of the function newBadGuy is\n" ++
                 "dependent upon the following cases:"
updateFunc9 : Element
updateFunc9 =
  body "newBadGuy ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc9Msg) else (Signal.send hoveredOn ""))

updateFunc10Msg = "The function checks to see if the value\n" ++
                  "of state is equal to Pause."
updateFunc10 : Element
updateFunc10 =
  body "if state == Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc10Msg) else (Signal.send hoveredOn ""))

updateFunc11Msg = "If the value of state is Pause, then\n" ++
                  "the function newBadGuy takes the value\n" ++
                  "badGuy. That is, nothing changes."
updateFunc11 : Element
updateFunc11 =
  body "then badGuy"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc11Msg) else (Signal.send hoveredOn ""))

updateFunc12Msg = "When state is not equal to Pause, then\n" ++
                  "newBadGuy takes the value of the function\n" ++
                  "updateBadGuy, which is defined later. This\n" ++
                  "function takes delta, badGuy, and player1."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateFunc13Msg = "The in part of the let expression tells us how\n" ++
                  "the newBadGuy function will be used."
updateFunc13 : Element
updateFunc13 =
  body "in"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc13Msg) else (Signal.send hoveredOn ""))

updateFunc14Msg = "Game will have its attributes updated."
updateFunc14 : Element
updateFunc14 =
  body "{ game |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc14Msg) else (Signal.send hoveredOn ""))

updateFunc15Msg = "State will assume the value of the\n" ++
                  "function newState."
updateFunc15 : Element
updateFunc15 =
  body "state   <- newState,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc15Msg) else (Signal.send hoveredOn ""))

updateFunc16Msg = "BadGuy assumes the value of the\n" ++
                  "function newBadGuy from the previous\n" ++
                  "page."
updateFunc16 : Element
updateFunc16 =
  body "badGuy  <- newBadGuy,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc16Msg) else (Signal.send hoveredOn ""))

updateFunc17Msg = "Player1 assumes the value of the function\n" ++
                  "updatePlayer which needs delta, dir1, dir2,\n" ++
                  "lives, and player1. The function updatePlayer\n" ++
                  "is defined later."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateBadGuy1Msg = "The function updateBadGuy takes a Time, a\n" ++
                   "BadGuy, and a Player. The function returns\n" ++
                   "a type of BadGuy."
updateBadGuy1 : Element
updateBadGuy1 =
  body " 78. updateBadGuy : Time -> BadGuy -> Player ->"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy1Msg) else (Signal.send hoveredOn ""))

updateBadGuy1a : Element
updateBadGuy1a =
  body " BadGuy"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy1Msg) else (Signal.send hoveredOn ""))


updateBadGuy2Msg = "UpdateBadGuy takes t as time; the x, y,\n" ++
                   "vx, and vy values of badGuy; and the x,\n" ++
                   "y, vx, vy, and lives values of player1."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateBadGuy3Msg = "If player1 has no more lives, then\n" ++
                   "the x- and y-values of badGuy are set\n" ++
                   "to 0. That is, badGuy moves to the\n" ++
                   "middle of the game area."
updateBadGuy3 : Element
updateBadGuy3 =
  body "if | (player1.lives == 0) -> { badGuy |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

updateBadGuy3a : Element
updateBadGuy3a =
  body " x <- 0, y <- 0}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

updateBadGuy4Msg = "If badGuy is touching player1, then the\n" ++
                   "function physicsUpdate is called with t\n" ++
                   "(time)."
updateBadGuy4 : Element
updateBadGuy4 =
  body "| (badGuy `within` player1) -> "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy4Msg) else (Signal.send hoveredOn ""))

updateBadGuy4a : Element
updateBadGuy4a =
  body " physicsUpdate t"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy4Msg) else (Signal.send hoveredOn ""))

updateBadGuy5Msg = "This bit of code is setting up the\n" ++
                   "attributes of badGuy that will be\n" ++
                   "modified."
updateBadGuy5 : Element
updateBadGuy5 =
  body "{ badGuy |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy5Msg) else (Signal.send hoveredOn ""))

updateBadGuy6Msg = "The vx-value of badGuy takes the\n" ++
                   "result of the stepV funtion which\n" ++
                   "takes the true or false value for\n" ++
                   "the conditional statements."
updateBadGuy6 : Element
updateBadGuy6 =
  body "vx <- stepV vx (badGuy.vx < 0)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy6Msg) else (Signal.send hoveredOn ""))

updateBadGuy6a : Element
updateBadGuy6a =
  body " (badGuy.vx > 0),"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy6Msg) else (Signal.send hoveredOn ""))

updateBadGuy7Msg = "The vy-value of badGuy takes the\n" ++
                   "result of the stepV funtion which\n" ++
                   "takes the true or false value for\n" ++
                   "the conditional statements."
updateBadGuy7 : Element
updateBadGuy7 =
  body "vy <- stepV vy (badGuy.vy < 0 ) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy7Msg) else (Signal.send hoveredOn ""))

updateBadGuy7a : Element
updateBadGuy7a =
  body " (badGuy.vy > 0)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy7Msg) else (Signal.send hoveredOn ""))

updateBadGuy8Msg = "The bracket ends the attributes of\n" ++
                   "badGuy which are modified."
updateBadGuy8 : Element
updateBadGuy8 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy8Msg) else (Signal.send hoveredOn ""))

displayUpdate7 : (Int, Int) -> Int -> String -> Element
displayUpdate7 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateBadGuy9Msg = "In all other cases, the function physicsUpdate\n" ++
                   "will be called with different arguments."
updateBadGuy9 : Element
updateBadGuy9 =
  body "| otherwise -> physicsUpdate t"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy9Msg) else (Signal.send hoveredOn ""))

updateBadGuy10Msg = "Some of the attributes of the object badGuy\n" ++
                    "will be modified."
updateBadGuy10 : Element
updateBadGuy10 =
  body "{ badGuy |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy10Msg) else (Signal.send hoveredOn ""))

updateBadGuy11Msg = "The value vx takes the result of the function\n" ++
                    "stepV. This is checking to see if badGuy is\n" ++
                    "going outside the game area. The number 25 is\n" ++
                    "the radius of badGuy. This will keep it in the\n" ++
                    "game area."
updateBadGuy11 : Element
updateBadGuy11 =
  body "vx <- stepV vx (x < 25-halfWidth) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy11Msg) else (Signal.send hoveredOn ""))

updateBadGuy11a : Element
updateBadGuy11a =
  body " (x > halfWidth-25),"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy11Msg) else (Signal.send hoveredOn ""))

updateBadGuy12Msg = "The value vy takes the result of the function\n" ++
                    "stepV. This is checking to see if badGuy is\n" ++
                    "going outside the game area. The number 25 is\n" ++
                    "the radius of badGuy. This will keep it in the\n" ++
                    "game area."
updateBadGuy12 : Element
updateBadGuy12 =
  body "vy <- stepV vy (y < 25-halfHeight) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy12Msg) else (Signal.send hoveredOn ""))

updateBadGuy12a : Element
updateBadGuy12a =
  body " (y > halfHeight-25)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy12Msg) else (Signal.send hoveredOn ""))

updateBadGuy13Msg = "The bracket ends the attributes of badGuy which\n" ++
                    "are modified."
updateBadGuy13 : Element
updateBadGuy13 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy13Msg) else (Signal.send hoveredOn ""))

-- Update Message 3
displayUpdate8 : (Int, Int) -> Int -> String -> Element
displayUpdate8 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updatePlayer1Msg = "This defines the function updatePlayer,\n" ++
                   "which takes a time, an integer, another\n" ++
                   "integer, another integer, a player, and\n" ++
                   "returns a player."
updatePlayer1 : Element
updatePlayer1 =
  body " 92. updatePlayer : Time -> Int -> Int -> Int -> "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer1Msg) else (Signal.send hoveredOn ""))

updatePlayer1a : Element
updatePlayer1a =
  body " Player -> Player"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer1Msg) else (Signal.send hoveredOn ""))

updatePlayer2Msg = "The function updatePlayer is called with\n" ++
                   "t, dir1, dir2, lives, and player."
updatePlayer2 : Element
updatePlayer2 =
  body " 93. updatePlayer t dir1 dir2 lives player ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer2Msg) else (Signal.send hoveredOn ""))

displayUpdate9 : (Int, Int) -> Int -> String -> Element
displayUpdate9 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updatePlayer3Msg = "An object player1 is created. Its attributes\n" ++
                   "of vx and vy are set to the values created by\n" ++
                   "the function physicsUpdate, which takes time t.\n" ++
                   "The updated vx attribute takes the value of dir1\n" ++
                   "multiplied by 200. However, dir1 multiplied by\n" ++
                   "200 is an integer. The value vy is a float. The\n" ++
                   "toFloat function converts an integer into a float."
updatePlayer3 : Element
updatePlayer3 =
  body "let player1 = physicsUpdate  t { player | "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

updatePlayer3a : Element
updatePlayer3a =
  body " vx <- toFloat dir1 * 200"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

updatePlayer4Msg = "The updated vy attribute takes the value of dir2\n" ++
                   "multiplied by 200. However, dir2 multiplied by\n" ++
                   "200 is an integer. The value vy is a float. The\n" ++
                   "toFloat function converts an integer into a float."
updatePlayer4 : Element
updatePlayer4 =
  body "vy <- toFloat dir2 * 200}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer4Msg) else (Signal.send hoveredOn ""))

updatePlayer5Msg = "The value of alive depends upon the conditional\n" ++
                   "statement tha wants to know if player.lives minus\n" ++
                   "lives is greater than 0. Conditionals return either\n" ++
                   "true or false."
updatePlayer5 : Element
updatePlayer5 =
  body "alive = if (player.lives - lives < 0)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer5Msg) else (Signal.send hoveredOn ""))

updatePlayer6Msg = "If the previous conditional statement is true,\n" ++
                   "then alives takes the value of 0. This keeps the\n" ++
                   "lives from becoming a negative number."
updatePlayer6 : Element
updatePlayer6 =
  body "then 0"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer6Msg) else (Signal.send hoveredOn ""))

updatePlayer7Msg = "If the previous conditional statement is not\n" ++
                   "true, then alive will equal player.lives minus\n" ++
                   "the value of lives."
updatePlayer7 : Element
updatePlayer7 =
  body "else (player.lives - lives)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer7Msg) else (Signal.send hoveredOn ""))

displayUpdate10 : (Int, Int) -> Int -> String -> Element
displayUpdate10 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updatePlayer8Msg = "This is the second part of the let statement.\n" ++
                   "The newly introduced alive will be used below."
updatePlayer8 : Element
updatePlayer8 =
  body "in"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer8Msg) else (Signal.send hoveredOn ""))

updatePlayer9Msg = "This says that within player1, the following\n" ++
                   "attributes will be updated."
updatePlayer9 : Element
updatePlayer9 =
  body "{ player1 |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer9Msg) else (Signal.send hoveredOn ""))

updatePlayer10Msg = "The updated attribute y takes the value of\n" ++
                    "player1.y. However, the value is limited (or\n" ++
                    "clamped) to any number between 35 -\n" ++
                    "halfHeight (-165) and halfHeight - 35 (165)."
updatePlayer10 : Element
updatePlayer10 =
  body "y <- clamp (35-halfHeight) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer10Msg) else (Signal.send hoveredOn ""))

updatePlayer10a : Element
updatePlayer10a =
  body " (halfHeight-35) player1.y,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer10Msg) else (Signal.send hoveredOn ""))

updatePlayer11Msg = "The updated attribute x takes the value of\n" ++
                    "player1.x. However, the value is limited (or\n" ++
                    "clamped) to any number between 35 -\n" ++
                    "halfWidth (-265) and halfWidth - 35 (265)."
updatePlayer11 : Element
updatePlayer11 =
  body "x <- clamp (35-halfWidth) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer11Msg) else (Signal.send hoveredOn ""))

updatePlayer11a : Element
updatePlayer11a =
  body " (halfWidth-35) player1.x,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer11Msg) else (Signal.send hoveredOn ""))

updatePlayer12Msg = "The updated attribute lives takes the\n" ++
                    "value of alive."
updatePlayer12 : Element
updatePlayer12 =
  body "lives <- alive"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer12Msg) else (Signal.send hoveredOn ""))

updatePlayer13Msg = "This bracket ends the update for player1."
updatePlayer13 : Element
updatePlayer13 =
  body "}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer13Msg) else (Signal.send hoveredOn ""))

-- Update Message 4
displayUpdate11 : (Int, Int) -> Int -> String -> Element
displayUpdate11 (width, height) sig hoveredOn=
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updatePhysics1Msg = "The function updatePhysics takes t (time) and\n" ++
                    "the values of x, y, vx, and vy which are treated\n" ++
                    "as one object. This function determines the\n" ++
                    "location of badGuy and player1 in the game area.\n"
updatePhysics1 : Element
updatePhysics1 =
  body " 107. physicsUpdate t ({x,y,vx,vy} as obj) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics1Msg) else (Signal.send hoveredOn ""))

updatePhysics2Msg = "This code means that the object will have its\n" ++
                    "attribures modified."
updatePhysics2 : Element
updatePhysics2 =
  body "{ obj |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics2Msg) else (Signal.send hoveredOn ""))

updatePhysics3Msg = "The x attribute takes the value of x plus vx\n" ++
                    "multiplied by t."
updatePhysics3 : Element
updatePhysics3 =
  body "x <- x + vx * t,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics3Msg) else (Signal.send hoveredOn ""))

updatePhysics4Msg = "The y attribute takes the value y plus vy\n" ++
                    "multiplied by t."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateNear1Msg = "The function near takes three arguments: k, c,\n" ++
                 "and n.It determines if two objects (k and n) are\n" ++
                 "near one another based upon a third number (c).\n" ++
                 "c represents the radius of badGuy. k and n are the\n" ++
                 "x- or y-values of badGuy and player1."
updateNear1 : Element
updateNear1 =
  body " 113. near k c n ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateNear1Msg) else (Signal.send hoveredOn ""))

updateNear2Msg = "This is the logic equation to determine if two\n" ++
                 "objects are touching. If the x-value of badGuy\n" ++
                 "is greater than or equal to its radius minus the\n" ++
                 "x-value of player1 and the x-value of badGuy is\n" ++
                 "less than or equal to its radius plus the x-value\n" ++
                 "of player1, then the function returns true. In all\n" ++
                 "other cases, it returns false."
updateNear2 : Element
updateNear2 =
  body "n >= k-c && n <= k+c"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateNear2Msg) else (Signal.send hoveredOn ""))

displayUpdate13 : (Int, Int) -> Int -> String -> Element
displayUpdate13 (width, height) sig hoveredOn=
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateWithin1Msg = "The function within takes badGuy and player1\n" ++
                   "and determines if they are touching."
updateWithin1 : Element
updateWithin1 =
  body " 116. within badGuy player1 ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin1Msg) else (Signal.send hoveredOn ""))

updateWithin2Msg = "The function within calls the function near,\n" ++
                   "and passes it the x positions of player1 and\n" ++
                   "badGuy, as well as the number 25. 25 is used\n" ++
                   "because that is the radius of badGuy. This also\n" ++
                   "checks to see if the y positions are touching."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
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

updateStepV1Msg = "The function stepV takes two conditions (true\n" ++
                  "or false) and a thrid term v. stepV is used to\n" ++
                  "bounce badGuy off of the edges of the game area."
updateStepV1 : Element
updateStepV1 =
  body " 119. stepV v condition1 condition2 ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV1Msg) else (Signal.send hoveredOn ""))

updateStepV2Msg = "If condition1 is true, then stepV returns the\n" ++
                  "absolute value of v. This bounces badGuy off\n" ++
                  "of the left and bottom edges of the game area."
updateStepV2 : Element
updateStepV2 =
  body (padLeft 30 ' ' " if | condition1 -> abs v")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV2Msg) else (Signal.send hoveredOn ""))

updateStepV3Msg = "If condition2 is true, then stepV returns 0 -\n" ++
                  "absolute value of v. This bounces badGuy off\n" ++
                  "of the right and top edges of the game area."
updateStepV3 : Element
updateStepV3 =
  body (padLeft 34 ' ' " | condition2 -> 0 - abs v")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV3Msg) else (Signal.send hoveredOn ""))

updateStepV4Msg = "In all other cases, stepV returns the value\n" ++
                  "of v. If badGuy is not touching any edges, then\n" ++
                  "do not change the direction; keep going in the\n" ++
                  "same direction."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

viewFunc1Msg = "The view function is what outputs the game\n" ++
               "to the computer screen. The view function\n" ++
               "takes a pair of integers and a game, and it\n" ++
               "returns an element."
viewFunc1 : Element
viewFunc1 =
  body " 124. view : (Int, Int) -> Game -> Element"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc1Msg) else (Signal.send hoveredOn ""))

viewFunc2Msg = "The function view is passed the width and\n" ++
               "height of the window, as well as state, badGuy\n" ++
               "and player1 which make up defaultGame."
viewFunc2 : Element
viewFunc2 =
  body " 125. view (w, h) {state, badGuy, player1} ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc2Msg) else (Signal.send hoveredOn ""))

displayView2 : (Int, Int) -> Int -> String -> Element
displayView2 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

viewFunc3Msg = "The let expression creates an object lives,\n" ++
               "which is of type element."
viewFunc3 : Element
viewFunc3 =
  body "let lives : Element"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc3Msg) else (Signal.send hoveredOn ""))

viewFunc4Msg = "The objecct lives is assigned the value of\n" ++
               "player1.lives, which is the remaining lives\n" ++
               "of player1. The object lives is converted to\n" ++
               "a string, and has a size of 50."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

viewFunc5Msg = "In is part of the let expression, and indicates\n" ++
               "where the newly defined lives will be used."
viewFunc5 : Element
viewFunc5 =
  body "in"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc5Msg) else (Signal.send hoveredOn ""))

viewFunc6Msg = "A container is an object that holds elements. It\n" ++
               "width and a height. Whatever it is holding will be\n" ++
               "placed in the middle of the element."
viewFunc6 : Element
viewFunc6 =
  body "container w h middle <|"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc6Msg) else (Signal.send hoveredOn ""))

viewFunc7Msg = "The container holds a collage, which is a\n" ++
               "collection of 2D forms. The forms can be\n" ++
               "placed anywhere inside the collage. This\n" ++
               "collage has a width of gameWidth (600) and\n" ++
               "a height of gameHeight (400)."
viewFunc7 : Element
viewFunc7 =
  body "collage gameWidth gameHeight"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc7Msg) else (Signal.send hoveredOn ""))

displayView4 : (Int, Int) -> Int -> String -> Element
displayView4 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

viewFunc8Msg = "Inside of the collage is a rectangle with\n" ++
               "the same dimensions as the collage."
viewFunc8 : Element
viewFunc8 =
  body "[ rect gameWidth gameHeight"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc8Msg) else (Signal.send hoveredOn ""))

viewFunc9Msg = "The rectangle is filled with the custom color\n" ++
               "elmGrey, which is defined below. The color comes\n" ++
               "from the Elm logo."
viewFunc9 : Element
viewFunc9 =
  body "|> filled elmGrey"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc9Msg) else (Signal.send hoveredOn ""))

displayView5 : (Int, Int) -> Int -> String -> Element
displayView5 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

viewFunc10Msg = "Also in the collage is a six-sided polygon\n" ++
                "with a radius of 25."
viewFunc10 : Element
viewFunc10 =
  body ", ngon 6 25 "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc10Msg) else (Signal.send hoveredOn ""))

viewFunc11Msg = "The hexagon is filled with the custom color\n" ++
                "elmOrange, which is defined below. The color\n" ++
                "comes from the Elm logo."
viewFunc11 : Element
viewFunc11 =
  body "|> filled elmOrange"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc11Msg) else (Signal.send hoveredOn ""))

viewFunc12Msg = "The hexagon is moved to the x and y\n" ++
                "coordinates of badGuy. The hexagon\n" ++
                "represents the antagonist in the game."
viewFunc12 : Element
viewFunc12 =
  body "|> move (badGuy.x, badGuy.y)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc12Msg) else (Signal.send hoveredOn ""))

displayView6 : (Int, Int) -> Int -> String -> Element
displayView6 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

viewFunc14Msg = "The circle is filled with the custom color\n" ++
                "elmBue, which is defined below. The color\n" ++
                "comes from the Elm logo."
viewFunc14 : Element
viewFunc14 =
  body "|> filled elmBlue"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc14Msg) else (Signal.send hoveredOn ""))

viewFunc15Msg = "The circle is moved to the x and y\n" ++
                "coordinates of player1. The circle\n" ++
                "represents the protagonist in the game."
viewFunc15 : Element
viewFunc15 =
  body "|> move (player1.x, player1.y)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc15Msg) else (Signal.send hoveredOn ""))

-- View Message 2
displayView7 : (Int, Int) -> Int -> String -> Element
displayView7 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

viewFunc16Msg = "The object lives (created 5 pages ago)\n" ++
                "is also in the collage. Since only forms\n" ++
                "can exist in a collage, lives is transformed\n" ++
                "into a form."
viewFunc16 : Element
viewFunc16 =
  body ", toForm lives"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc16Msg) else (Signal.send hoveredOn ""))

viewFunc17Msg = "The form lives is moved to the location 0\n" ++
                "(centered), gameHeight/2 - 40 (40 pixels\n" ++
                "from the top of the game area)."
viewFunc17 : Element
viewFunc17 =
  body "|> move (0, gameHeight/2 - 40)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc17Msg) else (Signal.send hoveredOn ""))

displayView8 : (Int, Int) -> Int -> String -> Element
displayView8 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

viewFunc18Msg = "There is one last form in the collage. If the\n" ++
                "state of the game is Play, then there is a\n" ++
                "spacer with the width of 1 and the height of 1.\n" ++
                "A spacer is an empty place holder. If the state\n" ++
                "is Pause, then the contents of the variable msg\n" ++
                "are modified by the function txt. Both msg and\n" ++
                "txt are defined over the next few pages."
viewFunc18 : Element
viewFunc18 =
  body ", toForm (if state == Play then "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc18Msg) else (Signal.send hoveredOn ""))

viewFunc18a : Element
viewFunc18a =
  body " spacer 1 1 else txt identity msg"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc18Msg) else (Signal.send hoveredOn ""))

viewFunc19Msg = "The form is moved to the location 0 (centered),\n" ++
                "gameHeight/2 - 40 (40 pixels from the bottom\n" ++
                "of the game area)."
viewFunc19 : Element
viewFunc19 =
  body "|> move (0, 40 - gameHeight/2)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc19Msg) else (Signal.send hoveredOn ""))

viewFunc20Msg = "This bracket closes the list of forms\n" ++
                "found in the collage."
viewFunc20 : Element
viewFunc20 =
  body "]"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc20Msg) else (Signal.send hoveredOn ""))

displayView9 : (Int, Int) -> Int -> String -> Element
displayView9 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

elmGreyColorMsg = "elmGrey is a custom color with a red value\n" ++
                  "of 71, a green value of 80, and a blue value\n" ++
                  "of 102. This color was taken from the Elm logo."
elmGreyColor : Element
elmGreyColor =
  body " 145. elmGrey = rgb 71 80 102"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmGreyColorMsg) else (Signal.send hoveredOn ""))

elmBlueColorMsg = "elmBlue is a custom color with a red value\n" ++
                  "of 76, a green value of 166, and a blue value\n" ++
                  "of 195. This color was taken from the Elm logo."
elmBlueColor =
  body " 146. elmBlue = rgb 76 166 195"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmBlueColorMsg) else (Signal.send hoveredOn ""))

elmGreenColorMsg = "elmGreen is a custom color with a red value\n" ++
                   "of 127, a green value of 209, and a blue value\n" ++
                   "of 17. This color was taken from the Elm logo."
elmGreenColor : Element
elmGreenColor =
  body " 147. elmGreen = rgb 127 209 17"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmGreenColorMsg) else (Signal.send hoveredOn ""))

textColorMsg = "textColor is set to white. This is the color\n" ++
               "used for any text prefaced with txt."
textColor : Element
textColor =
  body " 148. textColor = white"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textColorMsg) else (Signal.send hoveredOn ""))

displayView10 : (Int, Int) -> Int -> String -> Element
displayView10 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

txtFunc1Msg = "The txt function sets up the characteristics for\n" ++
              "the text used in the game. The text is converted\n" ++
              "from a string, has the color textColor (white)."
txtFunc1 : Element
txtFunc1 =
  body " 149. txt f = Text.fromString >> Text.color "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc1Msg) else (Signal.send hoveredOn ""))

txtFunc2Msg = "The text function also sets the font to monospace."
txtFunc2 : Element
txtFunc2 =
  body " textColor >> Text.monospace "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc2Msg) else (Signal.send hoveredOn ""))

txtFunc3Msg = "Lastly, the text is left aligned."
txtFunc3 : Element
txtFunc3 =
  body " >> f >> Text.leftAligned"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc3Msg) else (Signal.send hoveredOn ""))

displayView11 : (Int, Int) -> Int -> String -> Element
displayView11 (width, height) sig hoveredOn =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
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

msgFuncMsg = "When the state of the game is Pause, you\n" ++
             "will see this message at the bottom of the\n" ++
             "game. These are the instructions. &larr ;\n" ++
             "inserts a left arrow symbol. Remove the\n" ++
             "space before the semi-colon so the symbol\n" ++
             "will appear. With a space &larr ;. Without\n" ++
             "a space &larr;."
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewCongratsMsg1
    , iconElement elmLogo
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewIdea1Msg1
    , iconElement elmLogo
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewIdea2Msg1
    , iconElement elmLogo
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
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewIdea3Msg1
    , iconElement elmLogo
    , subtitleElement viewIdea3Msg2
    , buttonsLRElement sig
    ]))

viewIdea3Msg1 : String
viewIdea3Msg1 =
  "New Layouts"

viewIdea3Msg2 : String
viewIdea3Msg2 =
  "Avoid boring the player by using a\n" ++
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

-- Elm Resources
elmResources : (Int, Int) -> Int -> Element
elmResources (width, height) sig =
  color backgroundColor (container width height middle (flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement resourcesTitle
    , iconElement elmLogo
    , resourcesElement resourcesMsg
    , color grey <| container containerWidth 285 middle (flow down
      [ subTitle "Elm Websites"
      , toElement linkWidth 20 packageLink
      , toElement linkWidth 20 exampleLink
      , toElement linkWidth 20 syntaxLink
      , spacer 1 5
      , subTitle "Elm Community"
      , toElement linkWidth 20 mailingLink
      , toElement linkWidth 20 twitterLink
      , toElement linkWidth 20 ircLink
      , spacer 1 5
      , subTitle "Elm Videos"
      , toElement linkWidth 20 videoLink1
      , toElement linkWidth 20 videoLink2
      , toElement linkWidth 20 videoLink3
      ])
    , buttonSOElement sig
    ]))

packageLink = a [href "http://package.elm-lang.org/", target "_blank"] [text "Elm Package Catalog"]
exampleLink = a [href "http://elm-lang.org/Examples.elm", target "_blank"] [text "Elm Examples"]
syntaxLink = a [href "http://elm-lang.org/learn/Syntax.elm", target "_blank"] [text "Elm Syntax"]
mailingLink = a [href "https://groups.google.com/forum/?fromgroups#!forum/elm-discuss", target "_blank"] [text "Elm Mailing List"]
twitterLink = a [href "https://twitter.com/elmlang", target "_blank"] [text "Elm on Twitter"]
ircLink = a [href "http://webchat.freenode.net/?channels=elm", target "_black"] [text "Elm on IRC"]
videoLink1 = a [href "http://elm-lang.org/learn/courses/beginner/Programming.elm", target "_blank"] [text "Intro to Elm Video"]
videoLink2 = a [href "http://elm-lang.org/learn/courses/beginner/Graphics.elm", target "_blank"] [text "Intro to Elm Graphics"]
videoLink3 = a [href "http://elm-lang.org/learn/courses/beginner/Lists-and-Records.elm", target "_blank"] [text "Intro to Lists and Records"]

resourcesTitle : String
resourcesTitle =
  "Elm Resources"

resourcesMsg : String
resourcesMsg =
  "For more information on the Elm\n" ++
  "language, check out the following\n" ++
  "resources:"
