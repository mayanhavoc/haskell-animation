module Animation.Types where

--------------------------------
-- TYPES
--------------------------------
-- !!Old way of writing ADT!!
-- data Vector = Vector Int Int
--   deriving (Show)
--
-- vectorX :: Vector -> Int
-- vectorX (Vector x _) = x
--
-- vectorY :: Vector -> Int
-- vectorY (Vector _ y) = y

-- !!New way of writing ADT!!
data Vector = Vector
  { vectorX :: Int,
    vectorY :: Int
  }
  deriving (Show)

instance Semigroup Vector where
  (Vector x1 y1) <> (Vector x2 y2) = Vector (x1 + x2) (y1 + y2)

multiplyVector :: Vector -> Vector -> Vector
multiplyVector (Vector x1 y1) (Vector x2 y2) = Vector (x1 * x2) (y1 * y2)

-- This is equivalent to Config Int Int Vector Vector
-- but we would have to define frameHeight, frameWidth, etc. functions by hand.
data Config = Config
  { configFrameHeight :: Int,
    configFrameWidth :: Int
    -- configInitialPosition :: Vector,
    -- configInitialVelocity :: Vector
  }
  deriving (Show)

data AnimationState = AnimationState
  { statePosition :: Vector,
    stateVelocity :: Vector
  }
  deriving (Show)

data Wall = U | D | L | R
  deriving (Show)