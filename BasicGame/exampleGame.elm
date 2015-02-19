import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Keyboard
import Signal
import Text
import Time (..)
import Window

-- Inputs for the game

type alias Input = { space:Bool, player:Int, delta:Time}
delta : Signal Time
delta = inSeconds <~ fps 35

input : Signal Input
input = sampleOn delta <| Input <~ Keyboard.space
                                 ~ Signal.map2 .x .y Keyboard.arrows
                                 ~ delta

-- Model for the game

(gameWidth,gameHeight) = (600,400)
(halfWidth,halfHeight) = (300,200)

type alias Player a = { a | x:Float, y:Float, vx:Float, vy:Float }
type alias GoodGuy = Player { score:Int }
type alias BadGuy = Player {}
type State = Play | Pause
type alias Game = { state:State, goodGuy:GoodGuy, badGuy:BadGuy }

player : Float -> Player
player x y = { x=x, y=y, vx=0, vy=0 }

defaultGame : Game
defaultGame =
    { state = Pause
    , goodGuy = player -300 -150
    , badGuy = player 0 0
     }

-- Update the game

near : Float -> Float -> Float -> Bool
near n c m = m >= n-c && m <= n+c

within : Player -> Player -> Bool
within goodGuy badGuy =
    (goodGuy.x |> near badGuy.x 8) && (goodGuy.y |> near badGuy.y 20)

-- change the direction of a velocity based on collisions
stepV : Float -> Bool -> Float
stepV v lowerCollision upperCollision =
  if | lowerCollision  -> abs v
     | upperCollision -> 0 - abs v
     | otherwise       -> v

-- step the position of an object based on its velocity and a timestep
stepObj : Time -> Object a -> Object a
stepObj t ({x,y,vx,vy} as obj) =
    { obj | x <- x + vx * t
          , y <- y + vy * t }

{--
-- move a bad guy forward, detecting collisions with either paddle
stepBadGuy : Time -> BadGuy -> Player -> BadGuy
stepBadGuy t ({x,y,vx,vy} as badGuy) goodGuy =
  if not (badGuy.x |> near 0 halfWidth)
  then { badGuy | x <- 0, y <- 0 }
  else
    let vx' = stepV vx (badGuy `within` goodGuy)
        vy' = stepV vy (y < 7-halfHeight)
    in
        stepObj t { badGuy | vx <- vx', vy <- vy' }

--}

-- step a player forward, making sure it does not fly off the court
stepPlyr : Time -> Int -> Int -> Player -> Player
stepPlyr t dir points player =
  let player' = stepObj t { player | vy <- toFloat dir * 200 }
      y'      = clamp (22-halfHeight) (halfHeight-22) player'.y
      score'  = player.score + points
  in
      { player' | y <- y', score <- score' }

stepGame : Input -> Game -> Game
stepGame {space,player,delta}
         ({state,badGuy,goodGuy} as game) =
  let score1 = if badGuy.x >  halfWidth then 1 else 0
      score2 = if ball.x < -halfWidth then 1 else 0

      state' = state

      badGuy' = if state == Pause then badGuy else
                  stepBadGuy delta badGuy goodGuy

      goodGuy' = stepPlyr delta paddle1 score1 player1
  in
      { game | state   <- state'
             , badGuy  <- badGuy'
             , goodGuy <- goodGuy' }


gameState : Signal Game
gameState = foldp stepGame defaultGame input

-- helper values
pongGreen = rgb 60 100 60
textGreen = rgb 160 200 160
txt f = leftAligned << f << monospace << Text.color textGreen << fromString
msg = "SPACE to start, WS and &uarr;&darr; to move"

-- shared function for rendering objects
displayObj : Object a -> Shape -> Form
displayObj obj shape =
    move (obj.x,obj.y) (filled white shape)

-- display a game state
display : (Int,Int) -> Game -> Element
display (w,h) {state,badGuy,goodGuy} =
  let scores : Element
      scores = txt (Text.height 50) <|
               toString goodGuy.score
  in
      container w h middle <|
      collage gameWidth gameHeight
       [ filled pongGreen   (rect gameWidth gameHeight)
       , displayObj badGuy    (oval 15 15)
       , displayObj goodGuy (rect 10 40)
       , toForm scores
           |> move (0, gameHeight/2 - 40)
       , toForm (if state == Play then spacer 1 1 else txt id msg)
           |> move (0, 40 - gameHeight/2)
       ]

main = Signal.map2 display Window.dimensions gameState
