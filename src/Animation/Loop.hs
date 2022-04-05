module Animation.Loop (animate) where

import Animation.Render (render)
import Animation.Transition (transition)
import Animation.Types (AnimationState, Config)
import Control.Concurrent (threadDelay)

--------------------------------
-- Animation loop
--------------------------------
clearScreen :: IO ()
clearScreen = putStr "\ESC[3J\ESC[1;1H"

animate :: Config -> AnimationState -> IO ()
animate config state = do
  clearScreen
  putStr (render config state)
  threadDelay (7 * 100000)
  animate config (transition config state)