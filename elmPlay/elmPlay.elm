import Signal (Signal, map2, foldp, subscribe, channel, Channel, send)
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
  map2 view sig (Signal.subscribe hoveredOn)

chan : Channel Int
chan = channel 0

sig : Signal Int
sig = subscribe chan

hoveredOn : Signal.Channel String
hoveredOn = Signal.channel ""

view : Int -> String -> Element
view sig hoveredOn =
  color backgroundColor <| container 420 720 middle (
    if | sig == 0 -> displayWelcome1 sig
       | sig == 1 -> displayWelcome2 sig
       | sig == 2 -> displayWelcome3 sig
       | sig == 3 -> importsWelcome sig
       | sig == 4 -> displayImports sig hoveredOn
       | sig == 5 -> signalsWelcome sig
       | sig == 6 -> displaySignals1 sig hoveredOn
       | sig == 7 -> displaySignals2 sig hoveredOn
       | sig == 8 -> displaySignals3 sig hoveredOn
       | sig == 9 -> displaySignals4 sig hoveredOn
       | sig == 10 -> modelWelcome sig
       | sig == 11 -> displayModel1 sig hoveredOn
       | sig == 12-> displayModel2 sig hoveredOn
       | sig == 13 -> displayModel3 sig hoveredOn
       | sig == 14 -> displayModel4 sig hoveredOn
       | sig == 15 -> displayModel5 sig hoveredOn
       | sig == 16 -> displayModel6 sig hoveredOn
       | sig == 17 -> displayModel7 sig hoveredOn
       | sig == 18 -> updateWelcome sig
       | sig == 19 -> displayUpdate1 sig hoveredOn
       | sig == 20 -> displayUpdate2 sig hoveredOn
       | sig == 21 -> displayUpdate3 sig hoveredOn
       | sig == 22 -> displayUpdate4 sig hoveredOn
       | sig == 23 -> displayUpdate5 sig hoveredOn
       | sig == 24 -> displayUpdate6 sig hoveredOn
       | sig == 25 -> displayUpdate7 sig hoveredOn
       | sig == 26 -> displayUpdate8 sig hoveredOn
       | sig == 27 -> displayUpdate9 sig hoveredOn
       | sig == 28 -> displayUpdate10 sig hoveredOn
       | sig == 29 -> displayUpdate11 sig hoveredOn
       | sig == 30 -> displayUpdate12 sig hoveredOn
       | sig == 31 -> displayUpdate13 sig hoveredOn
       | sig == 32 -> displayUpdate14 sig hoveredOn
       | sig == 33 -> viewWelcome sig
       | sig == 34 -> displayView1 sig hoveredOn
       | sig == 35 -> displayView2 sig hoveredOn
       | sig == 36 -> displayView3 sig hoveredOn
       | sig == 37 -> displayView4 sig hoveredOn
       | sig == 38 -> displayView5 sig hoveredOn
       | sig == 39 -> displayView6 sig hoveredOn
       | sig == 40 -> displayView7 sig hoveredOn
       | sig == 41 -> displayView8 sig hoveredOn
       | sig == 42 -> displayView9 sig hoveredOn
       | sig == 43 -> displayView10 sig hoveredOn
       | sig == 44 -> displayView11 sig hoveredOn
       | sig == 45 -> congrats sig
       | sig == 46 -> idea1 sig
       | sig == 47 -> idea2 sig
       | sig == 48 -> idea3 sig
       | sig == 49 -> elmResources sig
       | otherwise -> displayWelcome1 sig)

-- These numbers are used to create the containers that hold the code examples and explinations
indent = 20
containerWidth = 400
containerHeight = 700
subtitleHeight = 375
codeHeight = 30
gameHeight = 225
bottomHeight = 150
iconHeight = 125
linkWidth = 200
questionHeight = 300
dropdownHeight = 100

extraLine : String
extraLine = "\n" ++ "-- "

-- Wayfinding tools
wayfinderPast =
  circle 15
    |> filled elmBlue
    |> alpha 0.5

wayfinderPresent =
  circle 15
    |> filled elmBlue

wayfinderFuture =
  circle 13
    |> outlined {defaultLine | color <- elmBlue, width <- 4}

dashPast =
  rect 35 5
    |> filled elmBlue
    |> alpha 0.5

dashPresent =
  rect 35 5
    |> filled elmBlue

-- Display elements
gifElement gif =
  color containerColor <| collage containerWidth 125 [ toForm gifImage ]

resourcesElement : String -> Element
resourcesElement strg =
  color containerColor <| container containerWidth 90 middle <| subTitle strg

welcomeElement : String -> Element
welcomeElement strg =
  color containerColor <| container containerWidth 70 middle <| subTitle strg

animationElement : Form -> String -> String -> Element
animationElement form stepNumber stepDescription =
  flow down
    [ color containerColor <| container containerWidth 305 middle <| (collage 400 305
      [ rect 380 260
          |> outlined {defaultLine | color <- elmBlue, width <- 4, join <- Sharp 10, cap <- Padded}
      , toForm (subTitle stepDescription)
          |> move (0, 100)
      , circle 15
          |> filled elmBlue
          |> move (0, 130)
      , toForm (subTitle stepNumber)
          |> move (0, 130)
      , form
      ])
    ]

wayfindingElement : Element -> Element
wayfindingElement wayfinding =
  color containerColor <| container containerWidth 50 middle <| wayfinding

titleElement : String -> Element
titleElement strg =
  color containerColor <| container containerWidth 100 middle <| title strg

subtitleElement : String -> Element
subtitleElement strg =
  color containerColor <| container containerWidth subtitleHeight middle <| subTitle strg

codeTitleElement : String -> Element
codeTitleElement strg =
  color containerColor <| container containerWidth 50 middle <| subTitle strg

codeElement : Element -> Element
codeElement gameCode =
  color containerColor <| container containerWidth gameHeight midLeft gameCode

helpElement : String -> Element
helpElement hoveredOn =
  color containerColor <| container containerWidth bottomHeight middle <| body hoveredOn

iconElement : Element -> Element
iconElement iconType =
  color containerColor <| container containerWidth iconHeight middle iconType

buttonGoElement : Int -> Element
buttonGoElement sig =
  color containerColor <| container containerWidth 50 midRight <| flow left
    [ spacer 5 1
    , customGoButton sig
    ]

buttonsLRElement : Int -> Element
buttonsLRElement sig =
  color containerColor <| container containerWidth 50 midRight <| flow left
    [ spacer 5 1
    , customRButton sig
    , spacer 5 1
    , customLButton sig
    ]

buttonSOElement : Int -> Element
buttonSOElement sig =
  color containerColor <| container containerWidth 50 midLeft <| flow right
    [ spacer 5 1
    , customRestartButton
    , spacer 205 1
    , customLButton sig
    ]

questionElement : String -> Element
questionElement strg =
  color containerColor <| container containerWidth questionHeight middle <| subTitle strg

-- Buttons
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

customRestartButton : Element
customRestartButton =
 customButton (send chan (0))
 (image 100 40 "/images/restartButton.svg")
 (image 100 40 "/images/restartButton.svg")
 (image 100 40 "/images/restartButton.svg")

-- Custom colors based on the Elm logo
backgroundColor = darkerPurple
containerColor = white
darkerPurple = rgb 39 45 60
darkerGreen = rgb 90 146 15
darkerBlue = rgb 42 105 129
darkerOrange = rgb 166 105 10
elmGrey = rgb 71 80 102
elmOrange = rgb 237 149 0
elmBlue = rgb 76 166 195
elmGreen = rgb 127 209 17

-- Images
gifImage = image 180 119 "/images/demoGif1.gif"
copyCode = image 180 103 "/images/copyCodeGIF.gif"
hoverCode = image 226 190 "/images/hoverCodeGIF.gif"
multiLine = image 344 27 "/images/multiLineGIF.gif"
importsGIF = image 350 96 "/images/importsGIF.gif"
buttonGIF = image 116 64 "/images/buttonGIF.gif"
modelGIF = image 326 260 "/images/modelGIF.gif"
updateGIF = image 218 112 "/images/updateGIF.gif"
viewGIF = image 388 260 "/images/view2GIF.gif"
elmLogoGIF1 = image 145 125 "/images/multiLogoGIF1.gif"
elmLogoGIF2 = image 145 125 "/images/multiLogoGIF2.gif"
elmLogoGIF3 = image 145 125 "/images/multiLogoGIF3.gif"
elmLogoGIF4 = image 145 125 "/images/multiLogoGIF4.gif"
elmLogoGIF5 = image 145 125 "/images/multiLogoGIF5.gif"
importsIcon = image 100 100 "images/importsIcon.svg"
modelIcon = image 100 100 "images/modelIcon.svg"
signalsIcon = image 100 100 "images/signalsIcon.svg"
updateIcon = image 100 100 "images/updateIcon.svg"
viewIcon = image 100 100 "images/viewIcon.svg"

-- Text formatting
title f = Text.fromString(f)
  |> Text.typeface ["futura", "sans-serif"]
  |> Text.color elmGreen
  |> Text.height 50
  |> Text.centered

subTitle f = Text.fromString(f)
  |> Text.typeface ["futura", "sans-serif"]
  |> Text.height 20
  |> Text.leftAligned

body f = Text.fromString(f)
  |> Text.typeface ["futura", "sans-serif"]
  |> Text.leftAligned

middleText f = Text.fromString(f)
  |> Text.typeface ["futura", "sans-serif"]
  |> Text.height 20
  |> Text.centered

codeText f = Text.fromString(f)
  |> Text.typeface ["futura", "sans-serif"]
  |> Text.color elmBlue
  |> Text.leftAligned

-- Welcome Message 1
-- `````````````````
displayWelcome1 : Int -> Element
displayWelcome1 sig =
  flow down
    [ wayfindingElement wayfindingWelcome
    , titleElement welcomeMsg1
    , gifElement gifImage
    , welcomeElement welcomeMsg2
    , animationElement welcomeAnimation1 stepNumber1 stepDescription1
    , buttonGoElement sig
    ]

wayfindingWelcome : Element
wayfindingWelcome =
  flow right
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
    ]

welcomeMsg1 : String
welcomeMsg1 = "elm play"

welcomeMsg2 : String
welcomeMsg2 =
  "Let's make a game with elm play.\n" ++
  "Here's how:"

stepNumber1 : String
stepNumber1 = "1"

stepDescription1 : String
stepDescription1 = "Copy the code to the editor"

welcomeAnimation1 : Form
welcomeAnimation1 = toForm(copyCode)

-- Welcome Message 2
-- `````````````````
displayWelcome2 : Int -> Element
displayWelcome2 sig =
  flow down
    [ wayfindingElement wayfindingWelcome
    , titleElement welcomeMsg1
    , gifElement gifImage
    , welcomeElement welcomeMsg2
    , animationElement welcomeAnimation2 stepNumber2 stepDescription2
    , buttonsLRElement sig
    ]

stepNumber2 : String
stepNumber2 = "2"

stepDescription2 : String
stepDescription2 = "Mouse over the code for an explanation"

welcomeAnimation2 : Form
welcomeAnimation2 = toForm(hoverCode) |> move (0, -20)

-- Welcome Message 3
-- `````````````````
displayWelcome3 : Int -> Element
displayWelcome3 sig =
  flow down
    [ wayfindingElement wayfindingWelcome
    , titleElement welcomeMsg1
    , gifElement gifImage
    , welcomeElement welcomeMsg2
    , animationElement welcomeAnimation3 stepNumber3 stepDescription3
    , buttonsLRElement sig
    ]

stepNumber3 : String
stepNumber3 = "3"

stepDescription3: String
stepDescription3 = "Move code with &uArr; to the line above"

welcomeAnimation3 : Form
welcomeAnimation3 = toForm(multiLine)

{--
*************************************************************
This section has all of the code for explaining the IMPORT section of the game
*************************************************************
--}

-- Imports Welcome
importsWelcome : Int -> Element
importsWelcome sig =
  flow down
    [ wayfindingElement wayfindingImports
    , titleElement importsWelcomeMsg1
    , iconElement importsIcon
    , color containerColor <| container containerWidth 100 middle <| subTitle importsWelcomeMsg2
    , color containerColor <| collage containerWidth 275
      [ toForm(importsGIF)]
    , buttonsLRElement sig
    ]

wayfindingImports : Element
wayfindingImports =
  flow right
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
    ]

importsWelcomeMsg1 : String
importsWelcomeMsg1 =
  "Imports Section"

importsWelcomeMsg2 : String
importsWelcomeMsg2 =
  "Imports allow us to add features\n" ++
  "to the game. Here's what we can\n" ++
  "now use:" 

-- Imports Message
displayImports : Int -> String -> Element
displayImports sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingImports
    , titleElement importsWelcomeMsg1
    , iconElement importsIcon
    , codeElement <| importsContainer sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

importsContainer : Int -> String -> Element
importsContainer sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, importColor]
    , flow right [spacer 10 5, importGraphicsCollage] 
    , flow right [spacer 10 5, importGraphicsElement]
    , flow right [spacer 10 5, importKeyboard]
    , flow right [spacer 10 5, importSignal]
    , flow right [spacer 10 5, importText]
    , flow right [spacer 10 5, importTime]
    , flow right [spacer 10 5, importWindow]
    , flow right [spacer 10 5, codeText extraLine]
    ]

colorMsg = "Import the Color library. This allows you\n" ++
           "setting the colors for the game area and\n" ++
           "the shapes."
importColor : Element
importColor =
  codeText "import Color exposing (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn colorMsg) else (Signal.send hoveredOn ""))

graphicsElementMsg = "Import everything from the Graphics.Element\n" ++
                     "library. Elements help with the layoutof the\n" ++
                     "game. This program uses an element to center\n" ++
                     "the game in the middle of the page."
importGraphicsElement : Element
importGraphicsElement =
  codeText "import Graphics.Element exposing (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsElementMsg) else (Signal.send hoveredOn ""))

graphicsCollageMsg = "Import everything from the Graphics.Collage\n" ++
                     "library. Collages are freeform graphics. This is\n" ++
                     "the game area with the shapes that move around."
importGraphicsCollage : Element
importGraphicsCollage =
  codeText "import Graphics.Collage exposing (..)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn graphicsCollageMsg) else (Signal.send hoveredOn ""))

textMsg = "Import the Text library. This library allows\n" ++
          "you to change the size, color, and position\n" ++
          "of the text used in this game."
importText : Element
importText =
  codeText "import Text"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textMsg) else (Signal.send hoveredOn ""))

signalMsg = "Import the Signal library. Signals are values\n" ++
            "that change over time. Signals often are input\n" ++
            "from the user. Signals can also be time or the\n" ++
            "size of a window."
importSignal : Element
importSignal =
  codeText "import Signal"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMsg) else (Signal.send hoveredOn ""))

keyboardMsg = "Import the Keyboard library. This allows the\n" ++
              "game to register the key presses when moveing\n" ++
              "the circle."
importKeyboard : Element
importKeyboard =
  codeText ("import Keyboard")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn keyboardMsg) else (Signal.send hoveredOn ""))

timeMsg = "Import the Time library. Specifically, you\n" ++
          "need the frames per second function, which\n" ++
          "notes the changes in time."
importTime : Element
importTime =
  codeText ("import Time")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn timeMsg) else (Signal.send hoveredOn ""))

windowMsg = "Import the Window library. This allows you to\n" ++
            "access the width and height of the window, which\n" ++
            "is used when centering the game on the page."
importWindow : Element
importWindow =
  codeText ("import Window")
    |> hoverable (\ r -> if r then (Signal.send hoveredOn windowMsg) else (Signal.send hoveredOn ""))


{--
*************************************************************
This section has all of the code for explaining the SIGNALS section of the game
*************************************************************
--}

-- Signals Welcome
signalsWelcome : Int -> Element
signalsWelcome sig =
  flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
    , color containerColor <| container containerWidth 100 middle <| subTitle signalsWelcomeMsg2
    , color containerColor <| collage containerWidth 275
      [ toForm(buttonGIF)]
    , buttonsLRElement sig
    ]

wayfindingSignals : Element
wayfindingSignals =
  flow right
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
    ]

signalsWelcomeMsg1 : String
signalsWelcomeMsg1 =
  "Signals Section"

signalsWelcomeMsg2 : String
signalsWelcomeMsg2 =
  "Signals are the interactions in the game.\n" ++
  "Some signals, like clicks, come from the\n" ++
  "user. Other signals, like time, happen all\n" ++
  "by themselves."

-- Signals Message
displaySignals1 : Int -> String -> Element
displaySignals1 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
    , codeElement <| signalsContainer1 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

signalsContainer1 : Int -> String -> Element
signalsContainer1 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, signalMain1]
    , flow right [spacer 10 5, signalMain2]
    , flow right [spacer 10 5, codeText extraLine]
    ]

signalMain1Msg = "Define the main function. Every Elm\n" ++
                 "program must have a main. Main functions\n" ++
                 "often combine signals with the function\n" ++
                 "that writes the output to the screen."
signalMain1 : Element
signalMain1 =
  codeText "main ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain1Msg) else (Signal.send hoveredOn ""))

signalMain2Msg = "This function maps (or combines) the view\n" ++
                 "function (writes the game to the screen)\n" ++
                 "with the windo dimensions signal and the\n" ++
                 "gameState signal."
signalMain2 : Element
signalMain2 =
  codeText "  Signal.map2 view Window.dimensions gameState"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalMain2Msg) else (Signal.send hoveredOn ""))

displaySignals2 : Int -> String -> Element
displaySignals2 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
    , codeElement <| signalsContainer2 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

signalsContainer2 : Int -> String -> Element
signalsContainer2 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, signalGameState1]
    , flow right [spacer 10 5, signalGameState2]
    , flow right [spacer 10 5, signalGameState3]
    , flow right [spacer 10 5, codeText extraLine]
    ]

signalGameState1Msg = "Define gameState as a signal of type Game.\n" ++
                      "The data type Game will be discussed in the\n" ++
                      "Model section."
signalGameState1 : Element
signalGameState1 =
  codeText "gameState : Signal Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState1Msg) else (Signal.send hoveredOn ""))

signalGameState2Msg = "Define the specifics of gameState."
signalGameState2 : Element
signalGameState2 =
  codeText "gameState ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState2Msg) else (Signal.send hoveredOn ""))

signalGameState3Msg = "gameState is a past dependent function, which\n" ++
                      "means it remembers the past values of update,\n" ++
                      "defaultGame, and input.\n"
signalGameState3 : Element
signalGameState3 =
  codeText "  Signal.foldp update defaultGame input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalGameState3Msg) else (Signal.send hoveredOn ""))

displaySignals3 : Int -> String -> Element
displaySignals3 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
    , codeElement <| signalsContainer3 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

signalsContainer3 : Int -> String -> Element
signalsContainer3 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, signalDelta1]
    , flow right [spacer 10 5, signalDelta2]
    , flow right [spacer 10 5, codeText extraLine]
    ]

signalDelta1Msg = " Define specific characteristics of the delta signal."
signalDelta1 : Element
signalDelta1 =
  codeText "delta ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDelta1Msg) else (Signal.send hoveredOn ""))

signalDelta2Msg = "inSeconds marks the current time in seconds. fps\n" ++
                  "marks the change in time every one-thrity-fifth\n" ++
                  "of a second. This signal maps (or combines) the\n" ++
                  "above together so that the change in time is in\n." ++
                  "seconds."

signalDelta2 : Element
signalDelta2 =
  codeText "  Signal.map inSeconds (fps 35)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalDelta2Msg) else (Signal.send hoveredOn ""))

displaySignals4 : Int -> String -> Element
displaySignals4 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingSignals
    , titleElement signalsWelcomeMsg1
    , iconElement signalsIcon
    , codeElement <| signalsContainer4 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

signalsContainer4 : Int -> String -> Element
signalsContainer4 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, signalInput1]
    , flow right [spacer 10 5, signalInput2]
    , flow right [spacer 10 5, signalInput3]
    , flow right [spacer 10 5, signalInput4]
    , flow right [spacer 10 5, signalInput5]
    , flow right [spacer 10 5, signalInput6]
    , flow right [spacer 10 5, signalInput7]
    , flow right [spacer 10 5, signalInput8]
    , flow right [spacer 10 5, codeText extraLine]
    ]

signalInput1Msg = "Defines input as a signal of type Input.\n" ++
                  "The data type Input will be discussed in\n" ++
                  "Model section."
signalInput1 : Element
signalInput1 =
  codeText "input : Signal Input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput1Msg) else (Signal.send hoveredOn ""))

signalInput2Msg = "Defines the specifics of input."
signalInput2 : Element
signalInput2 =
  codeText "input ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput2Msg) else (Signal.send hoveredOn ""))

signalInput3Msg = "This function records some data on every delta,\n" ++
                  "which is every 1/35 of a second."
signalInput3 : Element
signalInput3 =
  codeText "  Signal.sampleOn delta <|"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput3Msg) else (Signal.send hoveredOn ""))

signalInput4Msg = "The data recorded is a signal that combines the\n" ++
                  "four attributes of type Indput."
signalInput4 : Element
signalInput4 =
  codeText "    Signal.map4 Input"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput4Msg) else (Signal.send hoveredOn ""))

signalInput5Msg = "The first piece of data recorded is the space bar.\n" ++
                  "The result is a true or false based upon the space\n" ++
                  "bar being pressed."
signalInput5 : Element
signalInput5 =
  codeText "      Keyboard.space"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput5Msg) else (Signal.send hoveredOn ""))

signalInput6Msg = "The next pieceof data recorded is the left/right\n" ++
                  "keys. If left arrow is pressed then, the x-value\n" ++
                  "decreases. If the right arrow is pressed, then the\n" ++
                  "x-value increases."
signalInput6 : Element
signalInput6 =
  codeText "      (Signal.map .x Keyboard.arrows)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput6Msg) else (Signal.send hoveredOn ""))

signalInput7Msg = "The next pieceof data recorded is the up/down\n" ++
                  "keys. If down arrow is pressed then, the y-value\n" ++
                  "decreases. If the up arrow is pressed, then the\n" ++
                  "y-value increases."
signalInput7 : Element
signalInput7 =
  codeText "      (Signal.map .y Keyboard.arrows)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput7Msg) else (Signal.send hoveredOn ""))

signalInput8Msg = "Finally, the change in time is recorded in seconds."
signalInput8 : Element
signalInput8 =
  codeText "      delta"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn signalInput8Msg) else (Signal.send hoveredOn ""))

{--
*************************************************************
This section has all of the code for explaining the MODEL section of the game
*************************************************************
--}

-- Model Welcome
modelWelcome : Int -> Element
modelWelcome sig =
  flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
    , color containerColor <| container containerWidth 100 middle <| subTitle modelWelcomeMsg2
    , color containerColor <| collage containerWidth 275
      [ toForm(modelGIF)]
    , buttonsLRElement sig
    ]

wayfindingModel : Element
wayfindingModel =
  flow right
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
    ]

modelWelcomeMsg1 : String
modelWelcomeMsg1 =
  "Model Section"

modelWelcomeMsg2 : String
modelWelcomeMsg2 =
  "In the Model Section we'll create the\n" ++
  "objects and their characteristics to be\n" ++
  "used in the game."

-- Model Message 1
displayModel1 : Int -> String -> Element
displayModel1 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
    , codeElement <| modelContainer1 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

modelContainer1 : Int -> String -> Element
modelContainer1 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, gameSize]
    , flow right [spacer 10 5, playingSize]
    , flow right [spacer 10 5, codeText extraLine]
    ]

gameSizeMsg = "Set gameWidth to 600 and gameHeight to 400.\n" ++
              "gameWidth and gameHeight are also grouped\n" ++
              "together as a tuple.\n"
gameSize : Element
gameSize =
  codeText "(gameWidth, gameHeight) = (600, 400)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn gameSizeMsg) else (Signal.send hoveredOn ""))

playingSizeMsg = "Set halfWidth to 300 and halfHeight to 200.\n" ++
                 "halfWidth and halfHeight are also grouped\n" ++
                 "together as a tuple.\n"
playingSize : Element
playingSize =
  codeText "(halfWidth, halfHeight) = (300, 200)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn playingSizeMsg) else (Signal.send hoveredOn ""))

displayModel2 : Int -> String -> Element
displayModel2 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
    , codeElement <| modelContainer2 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

modelContainer2 : Int -> String -> Element
modelContainer2 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, typeState]
    , flow right [spacer 10 5, codeText extraLine]
    ]

typeStateMsg = "The data type State is created. It has\n" ++
               "the value of either Play or Pause."
typeState : Element
typeState =
  codeText "type State = Play | Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn typeStateMsg) else (Signal.send hoveredOn ""))

displayModel3 : Int -> String -> Element
displayModel3 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
    , codeElement <| modelContainer3 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

modelContainer3 : Int -> String -> Element
modelContainer3 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, aliasBadGuy1]
    , flow right [spacer 10 5, aliasBadGuy2]
    , flow right [spacer 10 5, codeText extraLine]
    ]

aliasBadGuy1Msg = "Create the type BadGuy as an alias. An alias\n" ++
                  "means that you can define attributes individually.\n"

aliasBadGuy1 : Element
aliasBadGuy1 =
  codeText "type alias BadGuy ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy1Msg) else (Signal.send hoveredOn ""))

aliasBadGuy2Msg = "The data type BadGuy has the following attributes:\n" ++
                  "an x-value of type float, a y-value of type float,\n" ++
                  "a vx-value of type Float, and a vy-value of type\n" ++
                  "float. Floats are numbers with a decimal."
aliasBadGuy2 : Element
aliasBadGuy2 =
  codeText "  { x:Float, y:Float, vx:Float, vy:Float }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasBadGuy2Msg) else (Signal.send hoveredOn ""))

displayModel4 : Int -> String -> Element
displayModel4 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
    , codeElement <| modelContainer4 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

modelContainer4 : Int -> String -> Element
modelContainer4 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, aliasPlayer1]
    , flow right [spacer 10 5, aliasPlayer2]
    , flow right [spacer 10 5, codeText extraLine]
    ]

aliasPlayer1Msg = "Create the type BadGuy as an alias. An alias\n" ++
                  "means that you can define attributes individually.\n"
aliasPlayer1 : Element
aliasPlayer1 =
  codeText "type alias Player ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer1Msg) else (Signal.send hoveredOn ""))

aliasPlayer2Msg = "The data type Player has the following attributes:\n" ++
                  "an x-value of type float, a y-value of type float,\n" ++
                  "a vx-value of type Float, and a vy-value of type\n" ++
                  "float. Floats are numbers with a decimal. Player\n" ++
                  "also has an integer that represents its lives."
aliasPlayer2 : Element
aliasPlayer2 =
  codeText "  { x:Float, y:Float, vx:Float, vy:Float, lives:Int }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasPlayer2Msg) else (Signal.send hoveredOn ""))

displayModel5 : Int -> String -> Element
displayModel5 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
    , codeElement <| modelContainer5 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

modelContainer5 : Int -> String -> Element
modelContainer5 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, aliasGame1]
    , flow right [spacer 10 5, aliasGame2]
    , flow right [spacer 10 5, codeText extraLine]
    ]

aliasGame1Msg = "Create the type Game as an alias. An alias\n" ++
                "means that you can define attributes individually.\n"
aliasGame1 : Element
aliasGame1 =
  codeText "type alias Game ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame1Msg) else (Signal.send hoveredOn ""))

aliasGame2Msg = "The data type Game has the following attributes:\n" ++
                "a state of type State (either Play or Pause), a \n" ++
                "badGuy of type BadGuy including all its attributes,\n" ++
                "and a player of type Player with all of its attributes.\n"
aliasGame2 : Element
aliasGame2 =
  codeText "  { state:State, badGuy:BadGuy, player1:Player }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasGame2Msg) else (Signal.send hoveredOn ""))

-- Model Message 2
displayModel6 : Int -> String -> Element
displayModel6 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
    , codeElement <| modelContainer6 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

modelContainer6 : Int -> String -> Element
modelContainer6 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, defaultGame1]
    , flow right [spacer 10 5, defaultGame2]
    , flow right [spacer 10 5, defaultGame3]
    , flow right [spacer 10 5, defaultGame4]
    , flow right [spacer 10 5, defaultGame5]
    , flow right [spacer 10 5, defaultGame6]
    , flow right [spacer 10 5, defaultGame7]
    , flow right [spacer 10 5, codeText extraLine]
    ]

defaultGame1Msg = "Create an object defaultGame of type Game."
defaultGame1 : Element
defaultGame1 =
  codeText "defaultGame : Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame1Msg) else (Signal.send hoveredOn ""))

defaultGame2Msg = "Describe specific values for defaultGame."
defaultGame2 : Element
defaultGame2 =
  codeText "defaultGame ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame2Msg) else (Signal.send hoveredOn ""))

defaultGame3Msg = "The state is set to the value of Pause."
defaultGame3 : Element
defaultGame3 =
  codeText "  { state = Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame3Msg) else (Signal.send hoveredOn ""))

defaultGame4Msg = "The badGuy attribute has the values of:\n" ++
                  "x = 0 and y = 0, its starting position\n" ++
                  "vx = 300 and vy = 300, its velocity (speed)."
defaultGame4 : Element
defaultGame4 =
  codeText "  , badGuy = { x=0, y=0, vx=300, vy=300 }"
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
  codeText "  , player1 = { x = 15-halfWidth, y = 0, vx = 0,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame5Msg) else (Signal.send hoveredOn ""))

defaultGame6 : Element
defaultGame6 =
  codeText "&uArr; vy = 0, lives = 3 }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame5Msg) else (Signal.send hoveredOn ""))


defaultGame7Msg = "Ends the list of attributes for defaultGame."
defaultGame7 : Element
defaultGame7 =
  codeText "  }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn defaultGame7Msg) else (Signal.send hoveredOn ""))

displayModel7 : Int -> String -> Element
displayModel7 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingModel
    , titleElement modelWelcomeMsg1
    , iconElement modelIcon
    , codeElement <| modelContainer7 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

modelContainer7 : Int -> String -> Element
modelContainer7 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, aliasInput1]
    , flow right [spacer 10 5, aliasInput2]
    , flow right [spacer 10 5, aliasInput3]
    , flow right [spacer 10 5, aliasInput4]
    , flow right [spacer 10 5, aliasInput5]
    , flow right [spacer 10 5, aliasInput6]
    , flow right [spacer 10 5, codeText extraLine]
    ]

aliasInput1Msg = "Create data type Input wich is an alias."
aliasInput1 : Element
aliasInput1 =
  codeText "type alias Input ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput1Msg) else (Signal.send hoveredOn ""))

aliasInput2Msg = "There is an attribute called space, which is a\n" ++
                 "boolean value. That is, it is either true or false.\n" ++
                 "space is mapped to the space bar in gameState."
aliasInput2 : Element
aliasInput2 =
  codeText "  { space : Bool"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput2Msg) else (Signal.send hoveredOn ""))

aliasInput3Msg = "There is an attribute called dir1, of type integer.\n" ++
                 "Integer means a number without a decimal."
aliasInput3 : Element
aliasInput3 =
  codeText "  , dir1 : Int"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput3Msg) else (Signal.send hoveredOn ""))

aliasInput4Msg = "There is an attribute called dir2, of type integer.\n" ++
                 "Integer means a number without a decimal."
aliasInput4 : Element
aliasInput4 =
  codeText "  , dir2 : Int"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput4Msg) else (Signal.send hoveredOn ""))

aliasInput5Msg = "There is an attribute called delta with a Time value."
aliasInput5 : Element
aliasInput5 =
  codeText "  , delta : Time"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput5Msg) else (Signal.send hoveredOn ""))

aliasInput6Msg = "Ends the list of attributes for Input."
aliasInput6 : Element
aliasInput6 =
  codeText "  }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn aliasInput6Msg) else (Signal.send hoveredOn ""))

{--
*************************************************************
This section has all of the code for explaining the UPDATE section of the game
*************************************************************
--}

-- Update Welcome
updateWelcome : Int -> Element
updateWelcome sig =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , color containerColor <| container containerWidth 100 middle <| subTitle updateWelcomeMsg2
    , color containerColor <| collage containerWidth 275
      [ toForm(updateGIF)]
    , buttonsLRElement sig
    ]

wayfindingUpdate : Element
wayfindingUpdate =
  flow right
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
    ]

updateWelcomeMsg1 : String
updateWelcomeMsg1 =
  "Update Section\n"

updateWelcomeMsg2 : String
updateWelcomeMsg2 =
  "The Update Section is where the magic\n" ++
  "happens. We're going to take the signals\n" ++
  "and have them modify the models."

-- Update Message 1
displayUpdate1 : Int -> String -> Element
displayUpdate1 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer1 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer1 : Int -> String -> Element
updateContainer1 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, updateFunc1]
    , flow right [spacer 10 5, updateFunc2]
    , flow right [spacer 10 5, updateFunc3]
    , flow right [spacer 10 5, updateFunc4]
    , flow right [spacer 10 5, updateFunc4a]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updateFunc1Msg = "Update is a function that takes an object of type\n" ++
                 "Input, an object of type Game, and returns\n" ++
                 "a Game."
updateFunc1 : Element
updateFunc1 =
  codeText "update : Input -> Game -> Game"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc1Msg) else (Signal.send hoveredOn ""))

updateFunc2Msg = "Specifically, update takes Input in the form of\n" ++
                 "space, dir1, dir2, and delta. The Game is defined\n" ++
                 "as state, badGuy, and player1."
updateFunc2 : Element
updateFunc2 =
  codeText "update {space,dir1,dir2,delta} ({state,badGuy,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc2Msg) else (Signal.send hoveredOn ""))

updateFunc3 : Element
updateFunc3 =
  codeText "    &uArr; player1} as game) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc2Msg) else (Signal.send hoveredOn ""))


updateFunc4Msg = "The let expression assigns the value of 1 to\n" ++
                 "lives if badGuy is within player1. within is a\n" ++
                 "that will be discussed later in this section. If\n" ++
                 "If badGuy is not within player1, the value of 0\n" ++
                 "is assigned to lives."
updateFunc4 : Element
updateFunc4 =
  codeText "  let lives = if (badGuy `within` player1) then 1"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc4Msg) else (Signal.send hoveredOn ""))

updateFunc4a : Element
updateFunc4a =
  codeText "    &uArr; else 0"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc4Msg) else (Signal.send hoveredOn ""))


displayUpdate2 : Int -> String -> Element
displayUpdate2 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer2 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer2 : Int -> String -> Element
updateContainer2 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, updateFunc5]
    , flow right [spacer 10 5, updateFunc6]
    , flow right [spacer 10 5, updateFunc7]
    , flow right [spacer 10 5, updateFunc8]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updateFunc5Msg = "The function newState assumes a value\n" ++
                 "dependent upon the cases below:"
updateFunc5 : Element
updateFunc5 =
  codeText "    newState ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc5Msg) else (Signal.send hoveredOn ""))

updateFunc6Msg = "If the space bar is pressed, then newState takes\n" ++
                 "the value Play."
updateFunc6 : Element
updateFunc6 =
  codeText "      if | space                    -> Play"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc6Msg) else (Signal.send hoveredOn ""))

updateFunc7Msg = "newState assumes the value of Pause if\n" ++
                 "player1.lives is 0. That is, the game stops\n" ++
                 "when player1 runs out of lives."
updateFunc7 : Element
updateFunc7 =
  codeText "         | player1.lives == 0 -> Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc7Msg) else (Signal.send hoveredOn ""))

updateFunc8Msg = "In all other cases, newState assumes the value\n" ++
                 "of state. That is, nothing changes."
updateFunc8 : Element
updateFunc8 =
  codeText "         | otherwise              -> state"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc8Msg) else (Signal.send hoveredOn ""))

displayUpdate3 : Int -> String -> Element
displayUpdate3 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer3 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer3 : Int -> String -> Element
updateContainer3 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, updateFunc9]
    , flow right [spacer 10 5, updateFunc10]
    , flow right [spacer 10 5, updateFunc11]
    , flow right [spacer 10 5, updateFunc12]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updateFunc9Msg = "The value of the function newBadGuy is\n" ++
                 "dependent upon the following cases:"
updateFunc9 : Element
updateFunc9 =
  codeText "    newBadGuy ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc9Msg) else (Signal.send hoveredOn ""))

updateFunc10Msg = "The function checks to see if the value\n" ++
                  "of state is equal to Pause."
updateFunc10 : Element
updateFunc10 =
  codeText "      if state == Pause"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc10Msg) else (Signal.send hoveredOn ""))

updateFunc11Msg = "If the value of state is Pause, then\n" ++
                  "the function newBadGuy takes the value\n" ++
                  "badGuy. That is, nothing changes."
updateFunc11 : Element
updateFunc11 =
  codeText "         then badGuy"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc11Msg) else (Signal.send hoveredOn ""))

updateFunc12Msg = "When state is not equal to Pause, then\n" ++
                  "newBadGuy takes the value of the function\n" ++
                  "updateBadGuy, which is defined later. This\n" ++
                  "function takes delta, badGuy, and player1."
updateFunc12 : Element
updateFunc12 =
  codeText "         else updateBadGuy delta badGuy player1"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc12Msg) else (Signal.send hoveredOn ""))

displayUpdate4 : Int -> String -> Element
displayUpdate4 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer4 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer4 : Int -> String -> Element
updateContainer4 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, updateFunc13]
    , flow right [spacer 10 5, updateFunc14]
    , flow right [spacer 10 5, updateFunc15]
    , flow right [spacer 10 5, updateFunc16]
    , flow right [spacer 10 5, updateFunc17]
    , flow right [spacer 10 5, updateFunc17a]
    , flow right [spacer 10 5, updateFunc18]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updateFunc13Msg = "The in part of the let expression tells us how\n" ++
                  "the newBadGuy function will be used."
updateFunc13 : Element
updateFunc13 =
  codeText "  in"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc13Msg) else (Signal.send hoveredOn ""))

updateFunc14Msg = "Game will have its attributes updated."
updateFunc14 : Element
updateFunc14 =
  codeText "    { game |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc14Msg) else (Signal.send hoveredOn ""))

updateFunc15Msg = "State will assume the value of the\n" ++
                  "function newState."
updateFunc15 : Element
updateFunc15 =
  codeText "      state   <- newState,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc15Msg) else (Signal.send hoveredOn ""))

updateFunc16Msg = "BadGuy assumes the value of the\n" ++
                  "function newBadGuy from the previous\n" ++
                  "page."
updateFunc16 : Element
updateFunc16 =
  codeText "      badGuy  <- newBadGuy,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc16Msg) else (Signal.send hoveredOn ""))

updateFunc17Msg = "Player1 assumes the value of the function\n" ++
                  "updatePlayer which needs delta, dir1, dir2,\n" ++
                  "lives, and player1. The function updatePlayer\n" ++
                  "is defined later."
updateFunc17 : Element
updateFunc17 =
  codeText "      player1 <- updatePlayer delta dir1 dir2"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc17Msg) else (Signal.send hoveredOn ""))

updateFunc17a : Element
updateFunc17a =
  codeText "        &uArr; lives player1"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc17Msg) else (Signal.send hoveredOn ""))

updateFunc18Msg = "This bracket closes the update function."
updateFunc18 : Element
updateFunc18 =
  codeText "    }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateFunc18Msg) else (Signal.send hoveredOn ""))

-- Update Message 2
displayUpdate5 : Int -> String -> Element
displayUpdate5 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer5 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer5 : Int -> String -> Element
updateContainer5 sig hoveredOn=
  flow down
    [ flow right [spacer 10 5, updateBadGuy1]
    , flow right [spacer 10 5, updateBadGuy1a]
    , flow right [spacer 10 5, updateBadGuy2]
    , flow right [spacer 10 5, updateBadGuy2a]
    ]

updateBadGuy1Msg = "The function updateBadGuy takes a Time, a\n" ++
                   "BadGuy, and a Player. The function returns\n" ++
                   "a type of BadGuy."
updateBadGuy1 : Element
updateBadGuy1 =
  codeText "updateBadGuy : Time -> BadGuy -> Player ->"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy1Msg) else (Signal.send hoveredOn ""))

updateBadGuy1a : Element
updateBadGuy1a =
  codeText "  &uArr; BadGuy"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy1Msg) else (Signal.send hoveredOn ""))


updateBadGuy2Msg = "UpdateBadGuy takes t as time; the x, y,\n" ++
                   "vx, and vy values of badGuy; and the x,\n" ++
                   "y, vx, vy, and lives values of player1."
updateBadGuy2 : Element
updateBadGuy2 =
  codeText "updateBadGuy t ({x,y,vx,vy} as badGuy)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy2Msg) else (Signal.send hoveredOn ""))

updateBadGuy2a : Element
updateBadGuy2a =
  codeText "  &uArr; ({x,y,vx,vy,lives} as player1) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy2Msg) else (Signal.send hoveredOn ""))

displayUpdate6 : Int -> String -> Element
displayUpdate6 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer6 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer6 : Int -> String -> Element
updateContainer6 sig hoveredOn=
  flow down
    [ flow right [spacer 10 5, updateBadGuy3]
    , flow right [spacer 10 5, updateBadGuy3a]
    , flow right [spacer 10 5, updateBadGuy4]
    , flow right [spacer 10 5, updateBadGuy5]
    , flow right [spacer 10 5, updateBadGuy6]
    , flow right [spacer 10 5, updateBadGuy6a]
    , flow right [spacer 10 5, updateBadGuy7]
    , flow right [spacer 10 5, updateBadGuy7a]
    , flow right [spacer 10 5, updateBadGuy8]
    ]

updateBadGuy3Msg = "If player1 has no more lives, then\n" ++
                   "the x- and y-values of badGuy are set\n" ++
                   "to 0. That is, badGuy moves to the\n" ++
                   "middle of the game area."
updateBadGuy3 : Element
updateBadGuy3 =
  codeText "  if | (player1.lives == 0) -> { badGuy | x <- 0,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

updateBadGuy3a : Element
updateBadGuy3a =
  codeText "      &uArr; y <- 0}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy3Msg) else (Signal.send hoveredOn ""))

updateBadGuy4Msg = "If badGuy is touching player1, then the\n" ++
                   "function physicsUpdate is called with t\n" ++
                   "(time)."
updateBadGuy4 : Element
updateBadGuy4 =
  codeText "     | (badGuy `within` player1) -> physicsUpdate t"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy4Msg) else (Signal.send hoveredOn ""))

updateBadGuy5Msg = "This bit of code is setting up the\n" ++
                   "attributes of badGuy that will be\n" ++
                   "modified."
updateBadGuy5 : Element
updateBadGuy5 =
  codeText "       { badGuy |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy5Msg) else (Signal.send hoveredOn ""))

updateBadGuy6Msg = "The vx-value of badGuy takes the\n" ++
                   "result of the stepV funtion which\n" ++
                   "takes the true or false value for\n" ++
                   "the conditional statements."
updateBadGuy6 : Element
updateBadGuy6 =
  codeText "        vx <- stepV vx (badGuy.vx < 0)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy6Msg) else (Signal.send hoveredOn ""))

updateBadGuy6a : Element
updateBadGuy6a =
  codeText "          &uArr; (badGuy.vx > 0),"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy6Msg) else (Signal.send hoveredOn ""))

updateBadGuy7Msg = "The vy-value of badGuy takes the\n" ++
                   "result of the stepV funtion which\n" ++
                   "takes the true or false value for\n" ++
                   "the conditional statements."
updateBadGuy7 : Element
updateBadGuy7 =
  codeText "        vy <- stepV vy (badGuy.vy < 0 ) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy7Msg) else (Signal.send hoveredOn ""))

updateBadGuy7a : Element
updateBadGuy7a =
  codeText "          &uArr; (badGuy.vy > 0)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy7Msg) else (Signal.send hoveredOn ""))

updateBadGuy8Msg = "The bracket ends the attributes of\n" ++
                   "badGuy which are modified."
updateBadGuy8 : Element
updateBadGuy8 =
  codeText "       }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy8Msg) else (Signal.send hoveredOn ""))

displayUpdate7 : Int -> String -> Element
displayUpdate7 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer7 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer7 : Int -> String -> Element
updateContainer7 sig hoveredOn=
  flow down
    [ flow right [spacer 10 5, updateBadGuy9]
    , flow right [spacer 10 5, updateBadGuy10]
    , flow right [spacer 10 5, updateBadGuy11]
    , flow right [spacer 10 5, updateBadGuy11a]
    , flow right [spacer 10 5, updateBadGuy12]
    , flow right [spacer 10 5, updateBadGuy12a]
    , flow right [spacer 10 5, updateBadGuy13]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updateBadGuy9Msg = "In all other cases, the function physicsUpdate\n" ++
                   "will be called with different arguments."
updateBadGuy9 : Element
updateBadGuy9 =
  codeText "     | otherwise -> physicsUpdate t"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy9Msg) else (Signal.send hoveredOn ""))

updateBadGuy10Msg = "Some of the attributes of the object badGuy\n" ++
                    "will be modified."
updateBadGuy10 : Element
updateBadGuy10 =
  codeText "       { badGuy |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy10Msg) else (Signal.send hoveredOn ""))

updateBadGuy11Msg = "The value vx takes the result of the function\n" ++
                    "stepV. This is checking to see if badGuy is\n" ++
                    "going outside the game area. The number 25 is\n" ++
                    "the radius of badGuy. This will keep it in the\n" ++
                    "game area."
updateBadGuy11 : Element
updateBadGuy11 =
  codeText "         vx <- stepV vx (x < 25-halfWidth) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy11Msg) else (Signal.send hoveredOn ""))

updateBadGuy11a : Element
updateBadGuy11a =
  codeText "           &uArr; (x > halfWidth-25),"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy11Msg) else (Signal.send hoveredOn ""))

updateBadGuy12Msg = "The value vy takes the result of the function\n" ++
                    "stepV. This is checking to see if badGuy is\n" ++
                    "going outside the game area. The number 25 is\n" ++
                    "the radius of badGuy. This will keep it in the\n" ++
                    "game area."
updateBadGuy12 : Element
updateBadGuy12 =
  codeText "         vy <- stepV vy (y < 25-halfHeight) "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy12Msg) else (Signal.send hoveredOn ""))

updateBadGuy12a : Element
updateBadGuy12a =
  codeText "           &uArr; (y > halfHeight-25)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy12Msg) else (Signal.send hoveredOn ""))

updateBadGuy13Msg = "The bracket ends the attributes of badGuy which\n" ++
                    "are modified."
updateBadGuy13 : Element
updateBadGuy13 =
  codeText "       }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateBadGuy13Msg) else (Signal.send hoveredOn ""))

-- Update Message 3
displayUpdate8 : Int -> String -> Element
displayUpdate8 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer8 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer8 : Int -> String -> Element
updateContainer8 sig hoveredOn=
  flow down
    [ flow right [spacer 10 5, updatePlayer1]
    , flow right [spacer 10 5, updatePlayer1a]
    , flow right [spacer 10 5, updatePlayer2]
    ]

updatePlayer1Msg = "This defines the function updatePlayer,\n" ++
                   "which takes a time, an integer, another\n" ++
                   "integer, another integer, a player, and\n" ++
                   "returns a player."
updatePlayer1 : Element
updatePlayer1 =
  codeText "updatePlayer : Time -> Int -> Int -> Int -> "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer1Msg) else (Signal.send hoveredOn ""))

updatePlayer1a : Element
updatePlayer1a =
  codeText "  &uArr; Player -> Player"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer1Msg) else (Signal.send hoveredOn ""))

updatePlayer2Msg = "The function updatePlayer is called with\n" ++
                   "t, dir1, dir2, lives, and player."
updatePlayer2 : Element
updatePlayer2 =
  codeText "updatePlayer t dir1 dir2 lives player ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer2Msg) else (Signal.send hoveredOn ""))

displayUpdate9 : Int -> String -> Element
displayUpdate9 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer9 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer9 : Int -> String -> Element
updateContainer9 sig hoveredOn=
  flow down
    [ flow right [spacer 10 5, updatePlayer3]
    , flow right [spacer 10 5, updatePlayer3a]
    , flow right [spacer 10 5, updatePlayer4]
    , codeText "\n"
    , flow right [spacer 10 5, updatePlayer5]
    , flow right [spacer 10 5, updatePlayer6]
    , flow right [spacer 10 5, updatePlayer7]
    , flow right [spacer 10 5, codeText extraLine]
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
  codeText "  let player1 = physicsUpdate  t { player | "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

updatePlayer3a : Element
updatePlayer3a =
  codeText "    &uArr; vx <- toFloat dir1 * 200"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer3Msg) else (Signal.send hoveredOn ""))

updatePlayer4Msg = "The updated vy attribute takes the value of dir2\n" ++
                   "multiplied by 200. However, dir2 multiplied by\n" ++
                   "200 is an integer. The value vy is a float. The\n" ++
                   "toFloat function converts an integer into a float."
updatePlayer4 : Element
updatePlayer4 =
  codeText "     vy <- toFloat dir2 * 200}"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer4Msg) else (Signal.send hoveredOn ""))

updatePlayer5Msg = "The value of alive depends upon the conditional\n" ++
                   "statement tha wants to know if player.lives minus\n" ++
                   "lives is greater than 0. Conditionals return either\n" ++
                   "true or false."
updatePlayer5 : Element
updatePlayer5 =
  codeText "    alive = if (player.lives - lives < 0)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer5Msg) else (Signal.send hoveredOn ""))

updatePlayer6Msg = "If the previous conditional statement is true,\n" ++
                   "then alives takes the value of 0. This keeps the\n" ++
                   "lives from becoming a negative number."
updatePlayer6 : Element
updatePlayer6 =
  codeText "      then 0"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer6Msg) else (Signal.send hoveredOn ""))

updatePlayer7Msg = "If the previous conditional statement is not\n" ++
                   "true, then alive will equal player.lives minus\n" ++
                   "the value of lives."
updatePlayer7 : Element
updatePlayer7 =
  codeText "      else (player.lives - lives)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer7Msg) else (Signal.send hoveredOn ""))

displayUpdate10 : Int -> String -> Element
displayUpdate10 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer10 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer10 : Int -> String -> Element
updateContainer10 sig hoveredOn=
  flow down
    [ flow right [spacer 10 5, updatePlayer8]
    , flow right [spacer 10 5, updatePlayer9]
    , flow right [spacer 10 5, updatePlayer10]
    , flow right [spacer 10 5, updatePlayer10a]
    , flow right [spacer 10 5, updatePlayer11]
    , flow right [spacer 10 5 , updatePlayer11a]
    , flow right [spacer 10 5, updatePlayer12]
    , flow right [spacer 10 5, updatePlayer13]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updatePlayer8Msg = "This is the second part of the let statement.\n" ++
                   "The newly introduced alive will be used below."
updatePlayer8 : Element
updatePlayer8 =
  codeText "  in"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer8Msg) else (Signal.send hoveredOn ""))

updatePlayer9Msg = "This says that within player1, the following\n" ++
                   "attributes will be updated."
updatePlayer9 : Element
updatePlayer9 =
  codeText "    { player1 |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer9Msg) else (Signal.send hoveredOn ""))

updatePlayer10Msg = "The updated attribute y takes the value of\n" ++
                    "player1.y. However, the value is limited (or\n" ++
                    "clamped) to any number between 35 -\n" ++
                    "halfHeight (-165) and halfHeight - 35 (165)."
updatePlayer10 : Element
updatePlayer10 =
  codeText "      y <- clamp (35-halfHeight) (halfHeight-35)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer10Msg) else (Signal.send hoveredOn ""))

updatePlayer10a : Element
updatePlayer10a =
  codeText "        &uArr; player1.y,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer10Msg) else (Signal.send hoveredOn ""))

updatePlayer11Msg = "The updated attribute x takes the value of\n" ++
                    "player1.x. However, the value is limited (or\n" ++
                    "clamped) to any number between 35 -\n" ++
                    "halfWidth (-265) and halfWidth - 35 (265)."
updatePlayer11 : Element
updatePlayer11 =
  codeText "      x <- clamp (35-halfWidth) (halfWidth-35)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer11Msg) else (Signal.send hoveredOn ""))

updatePlayer11a : Element
updatePlayer11a =
  codeText "        &uArr; player1.x,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer11Msg) else (Signal.send hoveredOn ""))

updatePlayer12Msg = "The updated attribute lives takes the\n" ++
                    "value of alive."
updatePlayer12 : Element
updatePlayer12 =
  codeText "      lives <- alive"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer12Msg) else (Signal.send hoveredOn ""))

updatePlayer13Msg = "This bracket ends the update for player1."
updatePlayer13 : Element
updatePlayer13 =
  codeText "    }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePlayer13Msg) else (Signal.send hoveredOn ""))

-- Update Message 4
displayUpdate11 : Int -> String -> Element
displayUpdate11 sig hoveredOn=
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer11 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer11 : Int -> String -> Element
updateContainer11 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, updatePhysics1]
    , flow right [spacer 10 5, updatePhysics2]
    , flow right [spacer 10 5, updatePhysics3]
    , flow right [spacer 10 5, updatePhysics4]
    , flow right [spacer 10 5, updatePhysics5]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updatePhysics1Msg = "The function updatePhysics takes t (time) and\n" ++
                    "the values of x, y, vx, and vy which are treated\n" ++
                    "as one object. This function determines the\n" ++
                    "location of badGuy and player1 in the game area.\n"
updatePhysics1 : Element
updatePhysics1 =
  codeText "physicsUpdate t ({x,y,vx,vy} as obj) ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics1Msg) else (Signal.send hoveredOn ""))

updatePhysics2Msg = "This code means that the object will have its\n" ++
                    "attribures modified."
updatePhysics2 : Element
updatePhysics2 =
  codeText "  { obj |"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics2Msg) else (Signal.send hoveredOn ""))

updatePhysics3Msg = "The x attribute takes the value of x plus vx\n" ++
                    "multiplied by t."
updatePhysics3 : Element
updatePhysics3 =
  codeText "    x <- x + vx * t,"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics3Msg) else (Signal.send hoveredOn ""))

updatePhysics4Msg = "The y attribute takes the value y plus vy\n" ++
                    "multiplied by t."
updatePhysics4 : Element
updatePhysics4 =
  codeText "    y <- y + vy * t"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics4Msg) else (Signal.send hoveredOn ""))

updatePhysics5Msg = "This brakcet closes the updatePhysics function."
updatePhysics5 : Element
updatePhysics5 =
  codeText "  }"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updatePhysics5Msg) else (Signal.send hoveredOn ""))

displayUpdate12 : Int -> String -> Element
displayUpdate12 sig hoveredOn=
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer12 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer12 : Int -> String -> Element
updateContainer12 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, updateNear1]
    , flow right [spacer 10 5, updateNear2]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updateNear1Msg = "The function near takes three arguments: k, c,\n" ++
                 "and n.It determines if two objects (k and n) are\n" ++
                 "near one another based upon a third number (c).\n" ++
                 "c represents the radius of badGuy. k and n are the\n" ++
                 "x- or y-values of badGuy and player1."
updateNear1 : Element
updateNear1 =
  codeText "near k c n ="
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
  codeText "  n >= k-c && n <= k+c"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateNear2Msg) else (Signal.send hoveredOn ""))

displayUpdate13 : Int -> String -> Element
displayUpdate13 sig hoveredOn=
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer13 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer13 : Int -> String -> Element
updateContainer13 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, updateWithin1]
    , flow right [spacer 10 5, updateWithin2]
    , flow right [spacer 10 5, updateWithin2a]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updateWithin1Msg = "The function within takes badGuy and player1\n" ++
                   "and determines if they are touching."
updateWithin1 : Element
updateWithin1 =
  codeText "within badGuy player1 ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin1Msg) else (Signal.send hoveredOn ""))

updateWithin2Msg = "The function within calls the function near,\n" ++
                   "and passes it the x positions of player1 and\n" ++
                   "badGuy, as well as the number 25. 25 is used\n" ++
                   "because that is the radius of badGuy. This also\n" ++
                   "checks to see if the y positions are touching."
updateWithin2 : Element
updateWithin2 =
  codeText "  near player1.x 25 badGuy.x && "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin2Msg) else (Signal.send hoveredOn ""))

updateWithin2a : Element
updateWithin2a =
  codeText "    &uArr; near player1.y 25 badGuy.y"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateWithin2Msg) else (Signal.send hoveredOn ""))

displayUpdate14 : Int -> String -> Element
displayUpdate14 sig hoveredOn=
  flow down
    [ wayfindingElement wayfindingUpdate
    , titleElement updateWelcomeMsg1
    , iconElement updateIcon
    , codeElement <| updateContainer14 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

updateContainer14 : Int -> String -> Element
updateContainer14 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, updateStepV1]
    , flow right [spacer 10 5, updateStepV2]
    , flow right [spacer 10 5, updateStepV3]
    , flow right [spacer 10 5, updateStepV4]
    , flow right [spacer 10 5, codeText extraLine]
    ]

updateStepV1Msg = "The function stepV takes two conditions (true\n" ++
                  "or false) and a thrid term v. stepV is used to\n" ++
                  "bounce badGuy off of the edges of the game area."
updateStepV1 : Element
updateStepV1 =
  codeText "stepV v condition1 condition2 ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV1Msg) else (Signal.send hoveredOn ""))

updateStepV2Msg = "If condition1 is true, then stepV returns the\n" ++
                  "absolute value of v. This bounces badGuy off\n" ++
                  "of the left and bottom edges of the game area."
updateStepV2 : Element
updateStepV2 =
  codeText "  if | condition1 -> abs v"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV2Msg) else (Signal.send hoveredOn ""))

updateStepV3Msg = "If condition2 is true, then stepV returns 0 -\n" ++
                  "absolute value of v. This bounces badGuy off\n" ++
                  "of the right and top edges of the game area."
updateStepV3 : Element
updateStepV3 =
  codeText "     | condition2 -> 0 - abs v"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV3Msg) else (Signal.send hoveredOn ""))

updateStepV4Msg = "In all other cases, stepV returns the value\n" ++
                  "of v. If badGuy is not touching any edges, then\n" ++
                  "do not change the direction; keep going in the\n" ++
                  "same direction."
updateStepV4 : Element
updateStepV4 =
  codeText"     | otherwise  -> v"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn updateStepV4Msg) else (Signal.send hoveredOn ""))

{--
*************************************************************
This section has all of the code for explaining the VIEW section of the game
*************************************************************
--}

-- View Welcome
viewWelcome : Int -> Element
viewWelcome sig =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , color containerColor <| container containerWidth 100 middle <| subTitle viewWelcomeMsg2
    , color containerColor <| collage containerWidth 275
      [ toForm(viewGIF)]
    , buttonsLRElement sig
    ]

wayfindingView : Element
wayfindingView =
  flow right
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
    ]

viewWelcomeMsg1 : String
viewWelcomeMsg1 =
  "View Section\n"

viewWelcomeMsg2 : String
viewWelcomeMsg2 =
  "This is our final section of the\n" ++
  "game. We're going to draw the models\n" ++
  "to the screen."

-- View Message 1
displayView1 : Int -> String -> Element
displayView1 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer1 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer1 : Int -> String -> Element
viewContainer1 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, viewFunc1]
    , flow right [spacer 10 5, viewFunc2]
    ]

viewFunc1Msg = "The view function is what outputs the game\n" ++
               "to the computer screen. The view function\n" ++
               "takes a pair of integers and a game, and it\n" ++
               "returns an element."
viewFunc1 : Element
viewFunc1 =
  codeText "view : (Int, Int) -> Game -> Element"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc1Msg) else (Signal.send hoveredOn ""))

viewFunc2Msg = "The function view is passed the width and\n" ++
               "height of the window, as well as state, badGuy\n" ++
               "and player1 which make up defaultGame."
viewFunc2 : Element
viewFunc2 =
  codeText "view (w, h) {state, badGuy, player1} ="
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc2Msg) else (Signal.send hoveredOn ""))

displayView2 : Int -> String -> Element
displayView2 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer2 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer2 : Int -> String -> Element
viewContainer2 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, viewFunc3]
    , flow right [spacer 10 5, viewFunc4]
    ]

viewFunc3Msg = "The let expression creates an object lives,\n" ++
               "which is of type element."
viewFunc3 : Element
viewFunc3 =
  codeText "  let lives : Element"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc3Msg) else (Signal.send hoveredOn ""))

viewFunc4Msg = "The objecct lives is assigned the value of\n" ++
               "player1.lives, which is the remaining lives\n" ++
               "of player1. The object lives is converted to\n" ++
               "a string, and has a size of 50."
viewFunc4 : Element
viewFunc4 =
  codeText "    lives = txt(Text.height 50) (toString player1.lives)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc4Msg) else (Signal.send hoveredOn ""))

displayView3 : Int -> String -> Element
displayView3 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer3 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer3 : Int -> String -> Element
viewContainer3 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, viewFunc5]
    , flow right [spacer 10 5, viewFunc6]
    , flow right [spacer 10 5, viewFunc7]
    ]

viewFunc5Msg = "In is part of the let expression, and indicates\n" ++
               "where the newly defined lives will be used."
viewFunc5 : Element
viewFunc5 =
  codeText "  in"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc5Msg) else (Signal.send hoveredOn ""))

viewFunc6Msg = "A container is an object that holds elements. It\n" ++
               "width and a height. Whatever it is holding will be\n" ++
               "placed in the middle of the element."
viewFunc6 : Element
viewFunc6 =
  codeText "    container w h middle <|"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc6Msg) else (Signal.send hoveredOn ""))

viewFunc7Msg = "The container holds a collage, which is a\n" ++
               "collection of 2D forms. The forms can be\n" ++
               "placed anywhere inside the collage. This\n" ++
               "collage has a width of gameWidth (600) and\n" ++
               "a height of gameHeight (400)."
viewFunc7 : Element
viewFunc7 =
  codeText "    collage gameWidth gameHeight"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc7Msg) else (Signal.send hoveredOn ""))

displayView4 : Int -> String -> Element
displayView4 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer4 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer4 : Int -> String -> Element
viewContainer4 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, viewFunc8]
    , flow right [spacer 10 5, viewFunc9]
    ]

viewFunc8Msg = "Inside of the collage is a rectangle with\n" ++
               "the same dimensions as the collage."
viewFunc8 : Element
viewFunc8 =
  codeText "      [ rect gameWidth gameHeight"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc8Msg) else (Signal.send hoveredOn ""))

viewFunc9Msg = "The rectangle is filled with the custom color\n" ++
               "elmGrey, which is defined below. The color comes\n" ++
               "from the Elm logo."
viewFunc9 : Element
viewFunc9 =
  codeText "        |> filled elmGrey"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc9Msg) else (Signal.send hoveredOn ""))

displayView5 : Int -> String -> Element
displayView5 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer5 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer5 : Int -> String -> Element
viewContainer5 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, viewFunc10]
    , flow right [spacer 10 5, viewFunc11]
    , flow right [spacer 10 5, viewFunc12]
    ]

viewFunc10Msg = "Also in the collage is a six-sided polygon\n" ++
                "with a radius of 25."
viewFunc10 : Element
viewFunc10 =
  codeText "      , ngon 6 25 "
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc10Msg) else (Signal.send hoveredOn ""))

viewFunc11Msg = "The hexagon is filled with the custom color\n" ++
                "elmOrange, which is defined below. The color\n" ++
                "comes from the Elm logo."
viewFunc11 : Element
viewFunc11 =
  codeText "        |> filled elmOrange"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc11Msg) else (Signal.send hoveredOn ""))

viewFunc12Msg = "The hexagon is moved to the x and y\n" ++
                "coordinates of badGuy. The hexagon\n" ++
                "represents the antagonist in the game."
viewFunc12 : Element
viewFunc12 =
  codeText "        |> move (badGuy.x, badGuy.y)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc12Msg) else (Signal.send hoveredOn ""))

displayView6 : Int -> String -> Element
displayView6 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer6 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer6 : Int -> String -> Element
viewContainer6 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, viewFunc13]
    , flow right [spacer 10 5, viewFunc14]
    , flow right [spacer 10 5, viewFunc15]
    ]

viewFunc13Msg = "A circle with a radius of 20 is also in the collage."
viewFunc13 : Element
viewFunc13 =
  codeText "      , circle 20"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc13Msg) else (Signal.send hoveredOn ""))

viewFunc14Msg = "The circle is filled with the custom color\n" ++
                "elmBue, which is defined below. The color\n" ++
                "comes from the Elm logo."
viewFunc14 : Element
viewFunc14 =
  codeText "        |> filled elmBlue"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc14Msg) else (Signal.send hoveredOn ""))

viewFunc15Msg = "The circle is moved to the x and y\n" ++
                "coordinates of player1. The circle\n" ++
                "represents the protagonist in the game."
viewFunc15 : Element
viewFunc15 =
  codeText "        |> move (player1.x, player1.y)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc15Msg) else (Signal.send hoveredOn ""))

-- View Message 2
displayView7 : Int -> String -> Element
displayView7 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer7 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer7 :  Int -> String -> Element
viewContainer7 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, viewFunc16]
    , flow right [spacer 10 5, viewFunc17]
    ]

viewFunc16Msg = "The object lives (created 5 pages ago)\n" ++
                "is also in the collage. Since only forms\n" ++
                "can exist in a collage, lives is transformed\n" ++
                "into a form."
viewFunc16 : Element
viewFunc16 =
  codeText "      , toForm lives"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc16Msg) else (Signal.send hoveredOn ""))

viewFunc17Msg = "The form lives is moved to the location 0\n" ++
                "(centered), gameHeight/2 - 40 (40 pixels\n" ++
                "from the top of the game area)."
viewFunc17 : Element
viewFunc17 =
  codeText "        |> move (0, gameHeight/2 - 40)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc17Msg) else (Signal.send hoveredOn ""))

displayView8 : Int -> String -> Element
displayView8 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer8 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer8 :  Int -> String -> Element
viewContainer8 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, viewFunc18]
    , flow right [spacer 10 5, viewFunc18a]
    , flow right [spacer 10 5, viewFunc19]
    , flow right [spacer 10 5, viewFunc20]
    , flow right [spacer 20 5, codeText extraLine]
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
  codeText "      , toForm (if state == Play then spacer 1 1"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc18Msg) else (Signal.send hoveredOn ""))

viewFunc18a : Element
viewFunc18a =
  codeText "          &uArr; else txt identity msg"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc18Msg) else (Signal.send hoveredOn ""))

viewFunc19Msg = "The form is moved to the location 0 (centered),\n" ++
                "gameHeight/2 - 40 (40 pixels from the bottom\n" ++
                "of the game area)."
viewFunc19 : Element
viewFunc19 =
  codeText "        |> move (0, 40 - gameHeight/2)"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc19Msg) else (Signal.send hoveredOn ""))

viewFunc20Msg = "This bracket closes the list of forms\n" ++
                "found in the collage."
viewFunc20 : Element
viewFunc20 =
  codeText "      ]"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn viewFunc20Msg) else (Signal.send hoveredOn ""))

displayView9 : Int -> String -> Element
displayView9 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer9 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer9 :  Int -> String -> Element
viewContainer9 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, elmGreyColor]
    , flow right [spacer 10 5, elmBlueColor]
    , flow right [spacer 10 5, elmGreenColor]
    , flow right [spacer 10 5, textColor]
    ]

elmGreyColorMsg = "elmGrey is a custom color with a red value\n" ++
                  "of 71, a green value of 80, and a blue value\n" ++
                  "of 102. This color was taken from the Elm logo."
elmGreyColor : Element
elmGreyColor =
  codeText "elmGrey = rgb 71 80 102"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmGreyColorMsg) else (Signal.send hoveredOn ""))

elmBlueColorMsg = "elmBlue is a custom color with a red value\n" ++
                  "of 76, a green value of 166, and a blue value\n" ++
                  "of 195. This color was taken from the Elm logo."
elmBlueColor =
  codeText "elmBlue = rgb 76 166 195"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmBlueColorMsg) else (Signal.send hoveredOn ""))

elmGreenColorMsg = "elmGreen is a custom color with a red value\n" ++
                   "of 127, a green value of 209, and a blue value\n" ++
                   "of 17. This color was taken from the Elm logo."
elmGreenColor : Element
elmGreenColor =
  codeText "elmGreen = rgb 127 209 17"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn elmGreenColorMsg) else (Signal.send hoveredOn ""))

textColorMsg = "textColor is set to white. This is the color\n" ++
               "used for any text prefaced with txt."
textColor : Element
textColor =
  codeText "textColor = white"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn textColorMsg) else (Signal.send hoveredOn ""))

displayView10 : Int -> String -> Element
displayView10 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer10 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer10 :  Int -> String -> Element
viewContainer10 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, txtFunc1]
    , flow right [spacer 25 5, txtFunc2]
    ]

txtFunc1Msg = "The txt function sets up the characteristics for\n" ++
              "the text used in the game. The text is converted\n" ++
              "from a string, has the color textColor (white)."
txtFunc1 : Element
txtFunc1 =
  codeText "txt f = Text.fromString >> Text.color textColor >>"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc1Msg) else (Signal.send hoveredOn ""))

txtFunc2Msg = "The text function also sets the font to monospace."
txtFunc2 : Element
txtFunc2 =
  codeText "&uArr; Text.monospace >> f >> leftAligned"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn txtFunc2Msg) else (Signal.send hoveredOn ""))

displayView11 : Int -> String -> Element
displayView11 sig hoveredOn =
  flow down
    [ wayfindingElement wayfindingView
    , titleElement viewWelcomeMsg1
    , iconElement viewIcon
    , codeElement <| viewContainer11 sig hoveredOn
    , helpElement hoveredOn
    , buttonsLRElement sig
    ]

viewContainer11 :  Int -> String -> Element
viewContainer11 sig hoveredOn =
  flow down
    [ flow right [spacer 10 5, msgFunc1]
    , flow right [spacer 25 5, msgFunc2]
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
  codeText "msg = 'SPACE to start, &larr ;&uarr ;&darr ;"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn msgFuncMsg) else (Signal.send hoveredOn ""))

msgFunc2 : Element
msgFunc2 =
  codeText "&uArr; &rarr ; to move'"
    |> hoverable (\ r -> if r then (Signal.send hoveredOn msgFuncMsg) else (Signal.send hoveredOn ""))

{--
*************************************************************
This section encourages the user to expand the game and make it better
*************************************************************
--}

-- Congrats
congrats : Int -> Element
congrats sig =
  flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewCongratsMsg1
    , iconElement elmLogoGIF1
    , subtitleElement viewCongratsMsg2
    , buttonsLRElement sig
    ]

wayfindingCongrats : Element
wayfindingCongrats =
  flow right
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
    ]

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
  "&bull; Adding additional levels.\n" ++
  "&bull; Adding another enemy.\n" ++
  "&bull; Changing the layout.\n\n" ++
  "This tutorial ends with some links to\n" ++
  "more resources for learning Elm."

-- Idea 1
idea1 : Int -> Element
idea1 sig =
  flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewIdea1Msg1
    , iconElement elmLogoGIF2
    , subtitleElement viewIdea1Msg2
    , buttonsLRElement sig
    ]

viewIdea1Msg1 : String
viewIdea1Msg1 =
  "Next Level"

viewIdea1Msg2 : String
viewIdea1Msg2 =
  "Good video games hold the attention\n" ++
  "of the player. To do this, you will need\n" ++
  "to add some more levels. Some\n" ++
  "suggestions include:\n\n" ++
  " &bull; Stay alive for a certain amount of\n" ++
  "     time. The amount of time required\n" ++
  "     to stay alive will increase with each\n" ++
  "     level.\n" ++
  " &bull; Collect a certain number of objects\n" ++
  "     before advancing. Each object will\n" ++
  "     randomly appears one at a time."

-- Idea 2
idea2 : Int -> Element
idea2 sig =
  flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewIdea2Msg1
    , iconElement elmLogoGIF3
    , subtitleElement viewIdea2Msg2
    , buttonsLRElement sig
    ]

viewIdea2Msg1 : String
viewIdea2Msg1 =
  "Another Enemy"

viewIdea2Msg2 : String
viewIdea2Msg2 =
  "To differentiate the levels and increase\n" ++
  "the difficulty, add another enemy to the\n" ++
  "game.\n\n" ++
  "&bull; Have them move at different speeds.\n" ++
  "&bull; Use a different size and shape.\n" ++
  "&bull; Use a different color. Try the orange\n" ++
  "    from the Elm logo - rgb 237 149 0.\n" ++
  "&bull; Increase the number of enemies on a\n" ++
  "    set interval, i.e. every five levels adds\n" ++
  "    another enemy."

-- Idea 3
idea3 : Int -> Element
idea3 sig =
  flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement viewIdea3Msg1
    , iconElement elmLogoGIF4
    , subtitleElement viewIdea3Msg2
    , buttonsLRElement sig
    ]

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
  "&bull; Have obstacles through which\n" ++
  "    the player cannot pass.\n" ++
  "&bull; Change the color of certain parts\n" ++
  "    of the layout. The colored regions\n" ++
  "    take a life of the player when\n" ++
  "    touched."

-- Elm Resources
elmResources : Int -> Element
elmResources sig =
  flow down
    [ wayfindingElement wayfindingCongrats
    , titleElement resourcesTitle
    , iconElement elmLogoGIF5
    , resourcesElement resourcesMsg
    , color containerColor <| container containerWidth 285 middle (flow down
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
    ]

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
