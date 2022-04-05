module Animation.CLI (cli) where

import Animation.Types (AnimationState (..), Config (..), Vector (..))
import System.Environment (getArgs)

-- - How do you animate on the terminal?
-- > Have a small enough time gap between
--   two drawings/renderings
-- > We'll write on the terminal, wait for some time,
--   clear the terminal, then repeat.
--
-- - What is the coordinate system?
-- > refer picture

--------------------------------
-- CLI
--------------------------------
-- frame width
-- frame height
-- initial position x
-- initial position y
-- initial velocity x
-- initial velocity y
cli :: IO (Config, AnimationState)
cli = do parseArgs <$> getArgs

parseArgs :: [String] -> (Config, AnimationState)
parseArgs [width, height, posX, posY, velX, velY] = (config, state)
  where
    config = Config (read width) (read height)
    state =
      AnimationState
        (Vector (read posX) (read posY))
        (Vector (read velX) (read velY))
parseArgs _ = error "Bad arguments"