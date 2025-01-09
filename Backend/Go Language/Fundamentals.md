
### Variables, Zero Values, Blank Identifier

- Go is a static typed language, not dynamic
- A variable hold a value with specific type
  - var num int = 10
- Declare   ->   var num
- Assign a value  -> var num int = 10
- Short declaration -> Declare and Assign a value ->   num := 10  // declare var num, auto type to 'int' with value 10
- Multiple assignments -> a,b,c := 0, 1, 'test'
- Blank identifer ->  _   // no return 
  _ := 3 

### Printf for Decimals & Hexadecimals
 

### Scope
 - package block scope
 - block scope



### Working at the terminal
 - GUI = Graphical User Interface
 - CLI = Command Line Interface
 - Two Flavors of Computers
  - Unix/Linux/Mac
    - shell , bash , terminal
  - Windows
    - command prompt, windows command, cmd , dos prompt


### Permission Group
 - d = directory
 - r = read 
 - w = write 
 - x = execute
 - rwxrwxrwx = owner, group, world
  - Example : "drwxr-xr-x+" -> directory | owner can [read, write, exec] | group can [read, exec] | world can [read, write, exec]
 - Giving Permissions
  - r - 4
  - w - 2
  - x - 1
  - chmod 777 notes.txt  -> owner (7) | group(4) | world (4)
  - owner can "rwx" -> 4 + 2 + 1 -> 7
  - group can "r--" -> read only  -> 4 
  - world can "r--" -> read only -> 4
