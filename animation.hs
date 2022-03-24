{- ***************************************
                TYPES
****************************************-}

-- vectorX and vectorY are 'getter' functions
data Vector = Vector { 
    vectorX :: Int, 
    vectorY :: Int 
} deriving (Show)

data Config = Config {
    configFrameHeight :: Int,
    configFrameWidth :: Int
} deriving (Show)

data AnimationState = AnimationState {
    statePosition :: Vector, 
    stateVelocity :: Vector
} deriving (Show)

data Wall = U | D | L | R deriving (Show)

{- ***************************************
                TRANSITION
****************************************-}
