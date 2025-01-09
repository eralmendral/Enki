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
    - To start a car, you only need to turn a key or press a button. You don't need to connect wires under the hood, rotate the crankshaft or cylinders , and initiate power cycle of the engine.
    - These details are hidden under the hood of the car.
    - You have only a simple interface: "a start switch, a steering wheel, and pedals"
    - Ths illustrates how each object has a **interface** - a public part of an object, open to interactions with other objects.
    - To encapsulate something means to make it private.




 - Inheritance
   - is the ability to build new class on top of existing ones.
   - Benefit is code reuse.
   - Consequence you also implement all abstract methods of the superclass even if they don't make sense to you.
   - If a superclass implements an interface, all of the subclass must also implement it.

 

 - Polymorphism
   - ability of the program to detect the real class of an object and call its implementation even when its real type is unknown in the current context.
   - ability of an object to **pretend** to be something else, usually a class it extends or an interface it implements.


### Relationships Between Objects
   - Dependency, Association, Aggregation, Composition
   - **Dependency** - weakest type of relations between classes. Occurs when you use concrete class names in your code.
   - **Association** -  one object uses or interacts with another.
   - **Aggregation** - specialize type of 'association' that represents **one to many**, **many to many** , or **whole part** relations between multiple objects.
   - **Composition** - is a specific kind of aggregation where one object is composed of one or more instances of the other.
      - The component can only exist as part of the container.
      
### Summary
   - Dependency - Class A can be affected by changes in class B.
   - Association - Object A knows about object B. Class A depends on B.
   - Aggregation - Object A knows about object B, and consists of B. Class A depends on B.
   - Composition - Object A knows about object B, consists of B, and manages B's Life Cycle. Class A depends on B.
   - Implementation - Class A defines methods declared in interface B. Objects A can be treated as B. Class A depends on B.
   - Inheritance - Class A inherits interface and implementation of class B but can extend it. Objects A can be treated as B. Class A depends on B.


