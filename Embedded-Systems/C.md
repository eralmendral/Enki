# C Basics

- In Python you'd do something like this:
```python
python my_program.py
```

- The python interpreter then executes that file top-to-bottom. If you have a **print()** at the top level, then it will print something.
- The entire file is interpreted *line by line*, but that's not how C works.


<br>

- Simplest C Progra
```c
 int main() {
   return 0;
 }
```

But a lot is happening hre...
 - A function named *main* is always the entry point to a C program(unlike Python, which enters at the top of the file).
- *int* is the return type of the function and is short for "integer". Because this is the main function, the return values is the **exit code** of rhe program. **0** means success, anything else means failure.
- We'll find a lot of abbreviations in C because 1) programmers are lazy, and 2) it used to matter how many bytes your source code was.

- The opening bracket, *{* is te start of the function's body (C ignores whitespae, so indentation is just for style, not for syntax)
- *return 0* returns the *0* value (an integer) from the function. Again, this is the exit code because it's the main function.
- *0* represents "nothing bad happened* as a return value.
- The *;* at the end of *return 0*; is required in C to terminate statements.
- The closing bracket, *}* denotes the end of the function's body.

<br>

## Print
 - It feels very different coming from Python, but printing in C is done with a function called *printf* from the **stdio.h** (standard input/output) library with a lot of weird formatting rules. To use it, you need an *#include* at the top of your file:
```c
 #include <stdio.h>
```

- Then you can use **printf** from inside a function:
```c
printf("Hello, world!\n");
```

- Notice the *\n*: it's required to print a **newline character** (and flush the buffer in the browser), which *print()* in Python does automatically.


```c
#include <stdio.h>

int main() {
  printf("Hello World!\n");
}

```
