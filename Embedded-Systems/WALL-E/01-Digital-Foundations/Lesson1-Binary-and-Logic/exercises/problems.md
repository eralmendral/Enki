# Lesson 1 Exercises: Binary and Number Systems

Complete these exercises to reinforce your understanding of binary, decimal, and hexadecimal number systems.

## Instructions

- Attempt all problems before checking solutions
- Show your work for conversion problems
- Verify your answers using the `binary_operations` program
- Solutions are in the `solutions/` folder

---

## Part 1: Number System Conversions (Basic)

### Problem 1: Binary to Decimal
Convert the following binary numbers to decimal:

a) 1010₂
b) 11001₂
c) 101010₂
d) 11111111₂
e) 10000001₂

### Problem 2: Decimal to Binary
Convert the following decimal numbers to 8-bit binary:

a) 25₁₀
b) 64₁₀
c) 127₁₀
d) 200₁₀
e) 7₁₀

### Problem 3: Hexadecimal to Decimal
Convert the following hexadecimal numbers to decimal:

a) 0x1F
b) 0x A0
c) 0xFF
d) 0x2B
e) 0x100

### Problem 4: Decimal to Hexadecimal
Convert the following decimal numbers to hexadecimal:

a) 255₁₀
b) 128₁₀
c) 16₁₀
d) 4095₁₀
e) 1000₁₀

---

## Part 2: Binary ↔ Hexadecimal (Intermediate)

### Problem 5: Binary to Hexadecimal
Convert the following binary numbers to hexadecimal:

a) 11010110₂
b) 10101010₂
c) 11110000₂
d) 00011011₂
e) 11111111₂

### Problem 6: Hexadecimal to Binary
Convert the following hexadecimal numbers to binary (show all 8 bits):

a) 0x4A
b) 0xC3
c) 0x0F
d) 0xB6
e) 0x7E

---

## Part 3: Two's Complement (Intermediate)

### Problem 7: Positive to Two's Complement
Express the following positive numbers in 8-bit two's complement:

a) +12₁₀
b) +127₁₀
c) +1₁₀
d) +64₁₀
e) +100₁₀

### Problem 8: Negative to Two's Complement
Express the following negative numbers in 8-bit two's complement:

a) -1₁₀
b) -128₁₀
c) -5₁₀
d) -64₁₀
e) -100₁₀

### Problem 9: Two's Complement to Decimal
Convert the following 8-bit two's complement numbers to decimal:

a) 11111111₂
b) 10000000₂
c) 11110110₂
d) 10101010₂
e) 01111111₂

---

## Part 4: Binary Arithmetic (Advanced)

### Problem 10: Binary Addition
Perform the following binary additions (show your work with carries):

a) 1010₂ + 0101₂
b) 1111₂ + 0001₂
c) 11001₂ + 10110₂
d) 101010₂ + 010101₂
e) 11111111₂ + 00000001₂

### Problem 11: Binary Subtraction
Perform the following subtractions using two's complement addition (8-bit):

a) 15₁₀ - 7₁₀
b) 20₁₀ - 12₁₀
c) 100₁₀ - 50₁₀
d) 127₁₀ - 1₁₀
e) 50₁₀ - 75₁₀ (result will be negative)

---

## Part 5: Bit Manipulation (Advanced)

### Problem 12: Bit Counting
How many bits are set to 1 in each of these binary numbers?

a) 11010110₂
b) 10101010₂
c) 11111111₂
d) 00000000₂
e) 10000001₂

### Problem 13: Even or Odd?
Determine if each binary number represents an even or odd decimal value:

a) 10101010₂
b) 10101011₂
c) 11110000₂
d) 11110001₂
e) 00000001₂

**Hint**: There's a very quick way to determine this!

### Problem 14: Powers of Two
Which of the following decimal numbers are powers of 2? For those that are, express them as 2^n.

a) 16
b) 32
c) 48
d) 64
e) 128
f) 256
g) 300

---

## Part 6: Applied Problems (Challenge)

### Problem 15: RGB Color Conversion
An RGB color is represented as three 8-bit values (Red, Green, Blue) combined into a 24-bit number. Hexadecimal is commonly used.

Convert these hex color codes to decimal RGB values:

a) #FF0000 (Red)
b) #00FF00 (Green)
c) #0000FF (Blue)
d) #FFFFFF (White)
e) #FF5733 (Coral)

### Problem 16: IP Address Conversion
IPv4 addresses are 4 bytes (32 bits) written in dotted-decimal notation.

Convert these IP addresses to:
- Binary (show all 32 bits)
- Hexadecimal

a) 192.168.1.1
b) 255.255.255.0
c) 10.0.0.1

### Problem 17: File Size Calculation
Given that 1 KB = 1024 bytes, and each byte = 8 bits:

a) How many bits in 1 KB?
b) How many bits in 1 MB (1024 KB)?
c) A file is 16,384 bits. How many KB is this?
d) Express 1 KB in hexadecimal (as number of bytes)

### Problem 18: Overflow Detection
When adding two 8-bit unsigned numbers, overflow occurs if the result exceeds 255.

Determine if overflow occurs for:

a) 200 + 50
b) 127 + 127
c) 255 + 1
d) 128 + 64
e) 100 + 100

### Problem 19: Sign Extension
When converting a smaller signed binary number to a larger width, we must sign-extend.

Convert these 4-bit signed numbers to 8-bit signed (two's complement):

a) 0101₂ (+5)
b) 1101₂ (-3)
c) 1111₂ (-1)
d) 0111₂ (+7)
e) 1000₂ (-8)

### Problem 20: Bit Masking
Bit masks are used to extract specific bits from a number.

Given the binary number: 11010110₂

Extract:
a) The lower 4 bits (rightmost)
b) The upper 4 bits (leftmost)
c) Bits 2-5 (counting from 0 on the right)

**Hint**: Use AND operation with appropriate mask.

---

## Bonus Challenges

### Challenge 1: Perfect Binary
Find a decimal number between 1 and 100 that:
- Has exactly 5 bits set to 1 in its binary representation
- Is divisible by 3
- Is a palindrome in binary (reads same forwards and backwards)

### Challenge 2: Gray Code
Gray code is a binary numeral system where two successive values differ in only one bit.

Generate the 4-bit Gray code sequence (0-15).

**Hint**: Research the algorithm or pattern.

### Challenge 3: BCD (Binary-Coded Decimal)
BCD represents each decimal digit as 4 bits.

Encode the decimal number 1234 in BCD.

---

## Self-Check Questions

Answer these conceptual questions:

1. Why do programmers prefer hexadecimal over binary for representing values?

2. What is the advantage of two's complement over sign-magnitude representation?

3. How can you quickly determine if a binary number is divisible by 2? By 4? By 8?

4. What is the largest unsigned value that can be represented in 16 bits?

5. In an 8-bit two's complement system, why is there one more negative number than positive numbers?

6. What happens when you try to represent -129 in 8-bit two's complement?

---

## Verification

After solving, verify your answers using:

1. **Code**: Run `../code/binary_operations` to check conversions
2. **Calculator**: Use a programmer's calculator (Windows Calculator in Programmer mode, macOS Calculator in Programmer mode)
3. **Solutions**: Check `solutions/` folder for detailed solutions with explanations

Good luck! Remember, practice is key to mastering number systems.
