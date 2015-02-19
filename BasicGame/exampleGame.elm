-- See this document for more information on making Pong:
-- http://elm-lang.org/blog/Pong.elm
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


player : Float -> Player
player x =
  { x = x, y = 0, vx = 0, vy = 0, lives = 3 }

defaultGame : Game
defaultGame =
  { state   = Pause
  , badGuy  = { x=0, y=0, vx=300, vy=300 }
  , player1 = player (15-halfWidth)
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
  let newState =
        if  | space            -> Play
            | otherwise        -> state

      newBadGuy =
        if state == Pause
            then badGuy
            else updateBadGuy delta badGuy

  in
      { game |
          state   <- newState,
          badGuy  <- newBadGuy,
          player1 <- updatePlayer delta dir1 dir2 player1
      }


updateBadGuy : Time -> BadGuy -> BadGuy
updateBadGuy t ({x,y,vx,vy} as badGuy) =
  physicsUpdate t
    { badGuy |
        vx <- stepV vx (x < 7-halfWidth) (x > halfWidth-7),
        vy <- stepV vy (y < 7-halfHeight) (y > halfHeight-7)
    }


updatePlayer : Time -> Int -> Int -> Player -> Player
updatePlayer t dir1 dir2 player =
  let player1 = physicsUpdate  t { player | vx <- toFloat dir1 * 200,
                                            vy <- toFloat dir2 * 200}
  in
      { player1 |
          y <- clamp (15-halfHeight) (halfHeight-15) player1.y,
          x <- clamp (15-halfWidth) (halfWidth-15) player1.x
      }


physicsUpdate t ({x,y,vx,vy} as obj) =
  { obj |
      x <- x + vx * t,
      y <- y + vy * t
  }


near k c n =
    n >= k-c && n <= k+c

within badGuy player1 =
    near player1.x 8 badGuy.x && near player1.y 20 badGuy.y


stepV v lowerCollision upperCollision =
  if | lowerCollision -> abs v
     | upperCollision -> 0 - abs v
     | otherwise      -> v


-- VIEW

view : (Int,Int) -> Game -> Element
view (w,h) {state,badGuy,player1} =
  let lives : Element
      lives = txt(Text.height 50) (toString player1.lives)
  in
      container w h middle <|
      collage gameWidth gameHeight
        [ rect gameWidth gameHeight
            |> filled pongGreen
        , ngon 3 15
            |> make badGuy
        , ngon 5 15
            |> make player1
        , toForm lives
            |> move (0, gameHeight/2 - 40)
        , toForm (if state == Play then spacer 1 1 else txt identity msg)
            |> move (0, 40 - gameHeight/2)
        ]

pongGreen = rgb 60 100 60
textGreen = rgb 160 200 160
txt f = Text.fromString >> Text.color textGreen >> Text.monospace >> f >> Text.leftAligned
msg = "SPACE to start, &uarr;&darr;&larr;&rarr; to move"
make obj shape =
    shape
      |> filled white
      |> move (obj.x,obj.y)
