## Configuration and animation issues

- What is the grid/frame size?
  - User configurable
- How do we draw on the terminal?
  - ASCII characters
    - Character 'o' for the ball
    - Character '|' for vertical wall
    - Character '\_' for the horizontal wall
- What is the initial position of the ball?
  - User configurable
- What is the ball velocity (magnitude + direction)?
  - User configurable
  - Bounce only changes direction.
- How often do we update the animation (fps)?
- How do you animate on the terminal?
  - We'll write on the terminal, then wait some time, then clear the screen and then write again.
- What is the coordinate system?
  - Cartesian plane width, height = x, y
  - from the right bottom corner to counter clockwise (0,0), (w,0), (w,h), (0,h)
  - around this coordinates is a 1 cell perimeter where we draw our '\_' and '|' symbols to represent the walls.

## Implementation issues

- How do we represent the configuration and animation state using Haskell types?

```Haskell
data Config = ...
data AnimationState = ...
```

- How do we track time/pause between two renderings?

  - Put the current thread to sleep for required duration.

- The transition function
  - Logic that deals with the 'next' state
  - Rendering a state
    - Converts `State` to a `String` that can be printed
  - Animation loop
  - Binary file with command arguments
  - Use build system and implement modules
