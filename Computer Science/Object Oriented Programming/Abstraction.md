
### Abstraction vs. Encapsulation
- Abstraction is about creating a simple interface for complex behavior. It focuses on what's exposed.
- Encapsulation is about hiding internal state. It focuses on tucking implementation details away so no one depends on them.
- Abstraction is more about reducing complexity.
- Encapsulation is more about maintaining the integrity of system internals.
- abstraction and encapsulation are basically the same thing.
- Abstraction - making usage easy.
- Encapsulation - hiding implementation details.

### Example
> Generating random numbers is a really hard problem. The operating system uses the physical hardware of the computer to create a seed for the randomness. However, the developers of the random library have abstracted that complexity away and encapsulated it within the simple randrange function. We just say "I want a random number from 0 to 4" and the library does it.