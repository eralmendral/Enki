### Why?
 - because almost everything is an **Object** in Programming.

<hr />

### What?
 - OOP 
 - Object-oriented programming 
 - concept of wrapping pieces of data
 - behavior related to that data, into special bundles called **objects**, which are constructed from a set of *blueprints* called **classes**'


<hr />

### Objects & Classes
 - Say you have cat named 'Luna'.
 - Luna is an **object**, an instance of the **Cat** class. 
 - Every cat has a lot of standard attributes like name, color, breed.
    - These are class **fields** or **properties**.
 - Every cat also behave similarly: they eat, sleep, breathe, etc.
    - These are class **methods**.
 - Collectively , **fields** and **methods** can be referenced as the members of their class.


<hr />

### Class Hierarchies
 - Naturally a real program contains more than a single class.
 - Now we have a **Dog** class but it also eat,sleep, breathe, etc.
 - To void duplication we will have a parent class named 'Animal'.
 - The parent class we define is called a **super class** and it's children are **subclasses**.

 - **Subclasses** - inherit state and behavior from their parent, defining only attributes or behaviors that differ.
    - Thus the Cat class will have a 'meow' method and the Dog class will have a 'bark' method.


<hr />


### 4 Pillars of OOP
 - Abstraction
    - model of real-world object or phenomenon limited to a specific context, which represents all details relevant to this context with high accuracy and omits all the rest.
    - Example:
      - Creating a program about an airplane will have 'speed, altitude, rollAngle, pitchAngle, etc', but we only care about the 'reservation' or 'flight' method. 
      - Though we only does the 'flight' method. The flight method has a lot of calculation behind it as said above, and we no longer need to think about it because it is already done behind the scenes.


 - Encapsulation
    - 
 - Polymorphism
 - Inheritance


