module Animation.Transition where

import Animation.Types (AnimationState (..), Config (..), Vector (..), Wall (..), multiplyVector)

--------------------------------
-- Transition
--------------------------------
transition :: Config -> AnimationState -> AnimationState
transition (Config frameHeight frameWidth) (AnimationState position velocity) = AnimationState newPos newVelocity
  where
    -- This is the position if there were no walls.
    apparentNewPosition :: Vector
    apparentNewPosition = position <> velocity

    willBounceWall :: Wall -> Bool
    willBounceWall U = vectorY apparentNewPosition >= frameHeight
    willBounceWall D = vectorY apparentNewPosition < 0
    willBounceWall R = vectorX apparentNewPosition >= frameWidth
    willBounceWall L = vectorX apparentNewPosition < 0

    -- This gives the change in position caused by the bounce against a certain wall.
    bounceEffectPosition :: Wall -> Vector
    bounceEffectPosition U = Vector 0 (-2 * (vectorY apparentNewPosition - frameHeight))
    bounceEffectPosition D = Vector 0 (-2 * vectorY apparentNewPosition)
    bounceEffectPosition R = Vector (-2 * (vectorX apparentNewPosition - frameWidth)) 0
    bounceEffectPosition L = Vector (-2 * vectorX apparentNewPosition) 0

    bounceEffectVelocity :: Wall -> Vector
    bounceEffectVelocity U = Vector 1 (-1)
    bounceEffectVelocity D = Vector 1 (-1)
    bounceEffectVelocity R = Vector (-1) 1
    bounceEffectVelocity L = Vector (-1) 1

    walls :: [Wall]
    walls = [U, D, L, R]

    hitWalls :: [Wall]
    hitWalls = filter willBounceWall walls

    newPos :: Vector
    newPos = foldr ((<>) . bounceEffectPosition) apparentNewPosition hitWalls

    newVelocity :: Vector
    newVelocity =
      foldr
        ( multiplyVector
            . bounceEffectVelocity
        )
        velocity
        hitWalls