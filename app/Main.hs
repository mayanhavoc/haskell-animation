module Main where

import Animation.CLI (cli)
import Animation.Loop (animate)

main :: IO ()
main = do
  (config, initialState) <- cli
  print (config, initialState)
  animate config initialState