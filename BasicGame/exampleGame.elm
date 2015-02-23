import Color (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Keyboard
import Signal
import Text
import Time (..)
import Window

-- SIGNALS

main =
  Signal.map2 view Window.dimensions gameState

gameState : Signal Game
gameState =
  Signal.foldp update defaultGame input

delta =
  Signal.map inSeconds (fps 35)

input : Signal Input
input =
  Signal.sampleOn delta <|
    Signal.map4 Input
      Keyboard.space
      (Signal.map .x Keyboard.arrows)
      (Signal.map .y Keyboard.arrows)
      delta


-- MODEL

(gameWidth,gameHeight) = (600,400)
(halfWidth,halfHeight) = (300,200)

type State = Play | Pause

type alias BadGuy =
  { x:Float, y:Float, vx:Float, vy:Float }

type alias Player =
  { x:Float, y:Float, vx:Float, vy:Float, lives:Int }

type alias Game =
  { state:State, badGuy:BadGuy, player1:Player }


defaultGame : Game
defaultGame =
  { state   = Pause
  , badGuy  = { x=0, y=0, vx=300, vy=300 }
  , player1 = { x = 15-halfWidth, y = 0, vx = 0, vy = 0, lives = 3 }
  }


type alias Input =
    { space : Bool
    , dir1 : Int
    , dir2 : Int
    , delta : Time
    }


-- UPDATE

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


updateBadGuy : Time -> BadGuy -> Player -> BadGuy
updateBadGuy t ({x,y,vx,vy} as badGuy) ({x,y,vx,vy,lives} as player1) =
  if | (player1.lives == 0) -> { badGuy | x <- 0, y <- 0}
     | (badGuy `within` player1) -> physicsUpdate t
          { badGuy |
            vx <- stepV vx (badGuy.vx < 0) (badGuy.vx > 0),
            vy <- stepV vy (badGuy.vy < 0 ) (badGuy.vy > 0)
          }
     | otherwise -> physicsUpdate t
          { badGuy |
              vx <- stepV vx (x < 25-halfWidth) (x > halfWidth-25),
              vy <- stepV vy (y < 25-halfHeight) (y > halfHeight-25)
          }


updatePlayer : Time -> Int -> Int -> Int -> Player -> Player
updatePlayer t dir1 dir2 lives player =
  let player1 = physicsUpdate  t { player | vx <- toFloat dir1 * 200,
                                            vy <- toFloat dir2 * 200}

      alive = if (player.lives - lives < 0)
        then 0
        else (player.lives - lives)

  in
      { player1 |
          y <- clamp (35-halfHeight) (halfHeight-35) player1.y,
          x <- clamp (35-halfWidth) (halfWidth-35) player1.x,
          lives <- alive
      }


physicsUpdate t ({x,y,vx,vy} as obj) =
  { obj |
      x <- x + vx * t,
      y <- y + vy * t
  }


near k c n =
    n >= k-c && n <= k+c

within badGuy player1 =
    near player1.x 25 badGuy.x && near player1.y 25 badGuy.y


stepV v condition1 condition2 =
  if | condition1 -> abs v
     | condition2 -> 0 - abs v
     | otherwise  -> v


-- VIEW

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

backgroundColor = rgb 178 8 1
textColor = white
txt f = Text.fromString >> Text.color textColor >> Text.monospace >> f >> Text.leftAligned
msg = "SPACE to start, &larr;&uarr;&darr;&rarr; to move"
