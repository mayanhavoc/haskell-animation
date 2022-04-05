module Animation.Render where

import Animation.Types (AnimationState (..), Config (..), Vector (..))

--------------------------------
-- Render
--------------------------------
render :: Config -> AnimationState -> String
render (Config frameHeight frameWidth) (AnimationState (Vector posX posY) _) =
  unlines (reverse (map drawRow [-1 .. frameHeight]))
  where
    charAt :: Int -> Int -> Char
    charAt x y
      | x == posX && y == posY = 'o'
      | y < 0 || y >= frameHeight = '#'
      | x < 0 || x >= frameWidth = '|'
      | otherwise = ' '
    drawRow :: Int -> String
    drawRow row = map (`charAt` row) [-1 .. frameWidth]
