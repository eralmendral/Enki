# Lesson 1: Binary and Number Systems

Welcome to your first lesson in digital foundations! In this lesson, you'll learn how computers represent and manipulate numbers at the most fundamental level.

## Learning Objectives

By the end of this lesson, you will be able to:
- Convert numbers between binary, decimal, and hexadecimal representations
- Understand and use two's complement notation for negative numbers
- Perform basic binary arithmetic (addition and subtraction)
- Explain why computers use binary internally
- Implement number system conversions in C++

## Prerequisites

- Basic arithmetic (addition, subtraction, multiplication, division)
- Understanding of powers and exponents
- No programming experience required (but helpful)

## Estimated Time

- **Theory**: 45 minutes
- **Code examples**: 30 minutes
- **Exercises**: 45 minutes
- **Simulation**: 30 minutes
- **Total**: ~2.5 hours

---

## Theory

### Introduction

Why do computers use binary? At the hardware level, digital circuits can easily distinguish between two states: ON (high voltage) and OFF (low voltage). This makes binary (base-2) the natural choice for digital systems. However, humans prefer decimal (base-10), and programmers often use hexadecimal (base-16) as a compact representation. Understanding how to work with these number systems is fundamental to all of computing.

### Core Concepts

#### 1. Number Systems Fundamentals

A **number system** is a way of representing quantities using digits. Each system has a **base** (also called radix) that determines:
- How many unique digits are available
- The place value of each position

**Decimal (Base-10)**:
- Digits: 0-9
- Example: 245₁₀ = 2×10² + 4×10¹ + 5×10⁰ = 200 + 40 + 5

**Binary (Base-2)**:
- Digits: 0, 1 (called **bits**)
- Example: 1101₂ = 1×2³ + 1×2² + 0×2¹ + 1×2⁰ = 8 + 4 + 0 + 1 = 13₁₀

**Hexadecimal (Base-16)**:
- Digits: 0-9, A-F (where A=10, B=11, C=12, D=13, E=14, F=15)
- Example: 2F₁₆ = 2×16¹ + 15×16⁰ = 32 + 15 = 47₁₀
- Commonly written with "0x" prefix: 0x2F

#### 2. Binary to Decimal Conversion

To convert binary to decimal, multiply each bit by its corresponding power of 2 and sum the results.

**Example**: Convert 10110₂ to decimal

```
Position:  4    3    2    1    0
Bit:       1    0    1    1    0
Value:    2⁴   2³   2²   2¹   2⁰
          16 +  0 +  4 +  2 +  0 = 22₁₀
```

**Practice**: Try converting 11010110₂ to decimal.
<details>
<summary>Answer</summary>
128 + 64 + 0 + 16 + 0 + 4 + 2 + 0 = 214₁₀
</details>

#### 3. Decimal to Binary Conversion

Two methods: **Division Method** and **Subtraction Method**

**Division Method** (easier for hand calculation):
1. Divide the decimal number by 2
2. Record the remainder (0 or 1)
3. Use the quotient for the next division
4. Repeat until quotient is 0
5. Read remainders from bottom to top

**Example**: Convert 13₁₀ to binary

```
13 ÷ 2 = 6 remainder 1  ← LSB (Least Significant Bit)
 6 ÷ 2 = 3 remainder 0
 3 ÷ 2 = 1 remainder 1
 1 ÷ 2 = 0 remainder 1  ← MSB (Most Significant Bit)

Result: 1101₂
```

#### 4. Hexadecimal

Hexadecimal is useful because:
- Each hex digit represents exactly 4 bits (one **nibble**)
- Compact representation of binary values
- Easy conversion to/from binary

**Binary ↔ Hex Conversion**:

| Hex | Binary | Decimal |
|-----|--------|---------|
| 0   | 0000   | 0       |
| 1   | 0001   | 1       |
| 2   | 0010   | 2       |
| 3   | 0011   | 3       |
| 4   | 0100   | 4       |
| 5   | 0101   | 5       |
| 6   | 0110   | 6       |
| 7   | 0111   | 7       |
| 8   | 1000   | 8       |
| 9   | 1001   | 9       |
| A   | 1010   | 10      |
| B   | 1011   | 11      |
| C   | 1100   | 12      |
| D   | 1101   | 13      |
| E   | 1110   | 14      |
| F   | 1111   | 15      |

**Example**: Convert 11010110₂ to hexadecimal

```
Group into nibbles (4 bits): 1101 0110
Convert each nibble:          D    6
Result: 0xD6
```

#### 5. Two's Complement (Negative Numbers)

Computers represent negative numbers using **two's complement** notation. This clever system allows the same addition circuit to work for both positive and negative numbers.

**Two's Complement Process**:
1. Write the positive number in binary
2. Invert all bits (0→1, 1→0) - this is called **one's complement**
3. Add 1 to the result

**Example**: Represent -5 in 8-bit two's complement

```
1. Start with +5:           00000101
2. Invert all bits:         11111010  (one's complement)
3. Add 1:                   11111011  (two's complement of -5)
```

**Properties of Two's Complement**:
- MSB (leftmost bit) indicates sign: 0=positive, 1=negative
- For n-bit numbers: range is -2^(n-1) to 2^(n-1)-1
- Example: 8-bit range is -128 to +127
- Zero has only one representation: 00000000
- Negating a number: apply two's complement again

**Identifying Negative Numbers**:
If MSB is 1, the number is negative. To find its magnitude:
1. Subtract 1
2. Invert all bits
3. Convert to decimal and add minus sign

**Example**: What is 11111011₂ in decimal (8-bit two's complement)?

```
MSB is 1, so it's negative.
1. Subtract 1:        11111010
2. Invert bits:       00000101
3. Convert to decimal:    5
4. Add minus sign:       -5
```

#### 6. Binary Arithmetic

**Binary Addition**:
Just like decimal addition, but carry occurs at 2 instead of 10.

```
Rules:
0 + 0 = 0
0 + 1 = 1
1 + 0 = 1
1 + 1 = 10  (0 with carry 1)

Example:  1101  (13)
        + 1011  (11)
        ------
         11000  (24)
```

**Binary Subtraction**:
Either use traditional borrowing, or add the two's complement (easier for computers).

```
Method 1: Direct subtraction with borrowing
Method 2: A - B = A + (-B) = A + two's_complement(B)

Example: 13 - 5
  1101  (13)
+ 1011  (two's complement of 5)
-------
 (1)1000  (8, discard carry for fixed-width)
```

### Real-World Applications

- **IP Addresses**: 192.168.1.1 = 0xC0A80101
- **RGB Colors**: #FF5733 = Red:255, Green:87, Blue:51
- **Memory Addresses**: Often displayed in hex (0x00400000)
- **File Permissions**: Unix permissions are octal/binary (chmod 755 = 111 101 101)
- **Bit Flags**: Efficiently store multiple boolean values in one number

---

## Code Walkthrough

Let's implement number system conversions in C++.

### Example 1: Decimal to Binary Converter

This program converts a decimal number to its binary representation.

```cpp
#include <iostream>
#include <string>
using namespace std;

string decimalToBinary(int decimal) {
    if (decimal == 0) return "0";

    string binary = "";
    int num = decimal;

    // Handle negative numbers (two's complement for demo)
    bool isNegative = (num < 0);
    if (isNegative) {
        num = -num; // Work with positive, will convert to two's complement later
    }

    // Convert to binary using division method
    while (num > 0) {
        binary = to_string(num % 2) + binary; // Prepend remainder
        num = num / 2;
    }

    return (isNegative ? "-" : "") + binary;
}

int main() {
    int number;
    cout << "Enter a decimal number: ";
    cin >> number;

    string binary = decimalToBinary(number);
    cout << number << " in binary is: " << binary << endl;

    return 0;
}
```

**Key Points**:
- Uses modulo (%) to get remainder
- Builds string from right to left
- See `code/binary_operations.cpp` for full implementation with two's complement

### Example 2: Binary to Decimal Converter

```cpp
int binaryToDecimal(string binary) {
    int decimal = 0;
    int power = 0;

    // Process from right to left
    for (int i = binary.length() - 1; i >= 0; i--) {
        if (binary[i] == '1') {
            decimal += (1 << power); // Equivalent to 2^power
        }
        power++;
    }

    return decimal;
}
```

**Key Points**:
- Uses bit shift (<<) for powers of 2: `1 << 3` equals 2³ = 8
- More efficient than using pow() function

### Example 3: Hexadecimal Conversions

See `code/number_systems.cpp` for complete implementations of:
- Decimal ↔ Hexadecimal
- Binary ↔ Hexadecimal
- Two's complement calculator
- Binary arithmetic (addition/subtraction)

---

## Hands-On Lab

### Building the Code Examples

```bash
cd code/
make
./binary_operations

# Or compile manually:
g++ binary_operations.cpp -o binary_operations
./binary_operations
```

### Using the Simulation

Open `simulation/binary_adder.circ` in Logisim-evolution to see a 4-bit binary adder in action:

1. Launch Logisim: `java -jar logisim-evolution.jar`
2. File → Open → `binary_adder.circ`
3. Use input pins to set binary numbers
4. Observe the sum output and carry bit
5. Try different combinations and verify manually

**Experiments to try**:
- Add 1111 + 0001 (what happens to carry?)
- Add 0101 + 0011
- Can you modify it to be an 8-bit adder?

---

## Exercises

See `exercises/problems.md` for 15 practice problems covering:
- Number system conversions (binary, decimal, hex)
- Two's complement representation
- Binary arithmetic
- Bit manipulation challenges

**Self-Assessment Questions**:
1. Why does hexadecimal use letters A-F?
2. What is the range of an 8-bit two's complement number?
3. How would you quickly check if a binary number is even or odd?
4. What happens when you add two n-bit numbers and get an (n+1)-bit result?

Solutions are available in `exercises/solutions/` after you attempt the problems.

---

## Key Takeaways

- **Binary is fundamental**: All digital data is ultimately binary at the hardware level
- **Hexadecimal is practical**: A compact, human-readable way to represent binary
- **Two's complement is clever**: Enables a single circuit for addition and subtraction
- **Practice makes perfect**: Conversions become intuitive with repetition
- **Bit manipulation is powerful**: Many algorithms rely on bit-level operations

### Quick Reference

| Operation | Formula/Method |
|-----------|----------------|
| Binary → Decimal | Sum of (bit × 2^position) |
| Decimal → Binary | Divide by 2, record remainders |
| Binary → Hex | Group 4 bits, convert each to hex digit |
| Hex → Binary | Convert each hex digit to 4 bits |
| Two's Complement | Invert bits, add 1 |
| Reverse Two's Comp | Subtract 1, invert bits |

---

## Next Steps

Congratulations on completing Lesson 1! You now understand the fundamental number systems used in computing.

**Continue to**: [Lesson 2: Boolean Algebra](../Lesson2-Boolean-Algebra/)

In Lesson 2, you'll learn about Boolean operations (AND, OR, NOT, XOR) and how they form the basis of all digital logic.

---

## Additional Resources

For deeper exploration, see:
- `resources/references.md` - Links to external tutorials and videos
- [Binary Addition Tutorial](https://www.electronics-tutorials.ws/binary/bin_2.html)
- [Two's Complement Explained](https://www.cs.cornell.edu/~tomf/notes/cps104/twoscomp.html)
- Video: [Ben Eater - Binary and Hexadecimal](https://www.youtube.com/watch?v=KVPaGvH9q48)

### Recommended Practice
- Use the code examples with different numbers
- Complete all exercises before moving on
- Build the simulation circuit yourself in Logisim
- Try implementing an 8-bit adder simulation

---

**Questions or feedback?** Open an issue or discussion in the WALL-E repository!
