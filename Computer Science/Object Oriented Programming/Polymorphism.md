
### Polymorphism
 - While inheritance is the most unique trait of OOP, polymorphism is probably the most powerful.
 - It is the ability of a variable, function or object to take multiple form
 - Poly - many
 - Morph - form

 ```python
 class Creature():
    def move(self):
        print("the creature moves")

class Dragon(Creature):
    def move(self):
        print("the dragon flies")

class Kraken(Creature):
    def move(self):
        print("the kraken swims")

for creature in [Creature(), Dragon(), Kraken()]:
    creature.move()
# prints:
# the creature moves
# the dragon flies
# the kraken swims

```