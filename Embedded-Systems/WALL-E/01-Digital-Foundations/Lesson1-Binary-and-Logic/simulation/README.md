# Simulation Files for Lesson 1

This directory contains simulation files for visualizing binary operations.

## Logisim Binary Adder Circuit

**File**: `binary_adder.circ` (to be created)

### What You'll Build

A 4-bit ripple-carry adder that demonstrates binary addition in hardware.

### Building the Circuit in Logisim

1. **Launch Logisim-evolution**
   ```bash
   java -jar logisim-evolution.jar
   ```

2. **Create Input Pins**
   - Add 4 input pins for first number (A3, A2, A1, A0)
   - Add 4 input pins for second number (B3, B2, B1, B0)
   - Label each pin clearly

3. **Build Full Adders**
   For each bit position, you need:
   - 2 XOR gates
   - 2 AND gates
   - 1 OR gate

   Full Adder Logic:
   ```
   Sum = A ⊕ B ⊕ Carry_in
   Carry_out = (A ∧ B) ∨ (Carry_in ∧ (A ⊕ B))
   ```

4. **Connect the Adders**
   - Connect Carry_out of bit 0 to Carry_in of bit 1
   - Continue chaining for all 4 bits
   - Bit 0 Carry_in is connected to ground (0)

5. **Add Outputs**
   - Add 4 output pins for sum (S3, S2, S1, S0)
   - Add 1 output pin for final carry (overflow)
   - Optional: Add LED indicators for visual feedback

6. **Save the Circuit**
   - File → Save As → `binary_adder.circ`

### Testing Your Circuit

Try these test cases:

| A (binary) | B (binary) | Expected Sum | Carry |
|------------|------------|--------------|-------|
| 0001       | 0001       | 0010 (2)     | 0     |
| 0101       | 0011       | 1000 (8)     | 0     |
| 1111       | 0001       | 0000 (0)     | 1     |
| 1010       | 0101       | 1111 (15)    | 0     |
| 1111       | 1111       | 1110 (14)    | 1     |

### Enhancements

Once your basic adder works, try:

1. **8-bit Adder**: Extend to 8 bits
2. **Subtractor**: Use two's complement for subtraction
3. **Adder/Subtractor**: Add a control signal to switch modes
4. **Overflow Detection**: Add logic to detect signed overflow
5. **Seven-Segment Display**: Show result on hex display

### Alternative: Half Adder

If full adder is too complex, start with a simpler **half adder**:

```
Sum = A ⊕ B
Carry = A ∧ B
```

Build 4 half adders without carry chaining, then progress to full adders.

## Online Alternative: Tinkercad

If you don't want to install Logisim, use Tinkercad Circuits:

1. Go to https://www.tinkercad.com/circuits
2. Create new circuit
3. Use "Logic Gates" components
4. Build the same adder circuit
5. Save and share your link

## Circuit Diagrams

### Full Adder Logic Diagram

```
        A ──┬──────────XOR───┬──── Sum
            │          │     │
        B ──┼────┬─────┘     │
            │    │           │
      Cin ──┼────┼───────XOR─┘
            │    │       │
            │    AND──┐  │
            │         │  │
            └────AND──┤  │
                 │    OR─┴──── Cout
                 └────┘
```

### 4-bit Ripple Carry Adder

```
A3 B3        A2 B2        A1 B1        A0 B0
 │ │          │ │          │ │          │ │
 FA ←── Cout─ FA ←── Cout─ FA ←── Cout─ FA ← 0
 │             │            │            │
S3            S2           S1           S0
```

## Learning Objectives

By building this simulation, you will:
- Understand how binary addition works at the gate level
- See the relationship between truth tables and physical circuits
- Appreciate the cascade of carries through an adder
- Recognize why addition takes time (propagation delay)
- Prepare for Module 2 (Computer Architecture) where you'll build an ALU

## Resources

- **Logisim Tutorial**: https://www.youtube.com/watch?v=IzkJ8Oi7b8k
- **Full Adder Explanation**: https://www.electronics-tutorials.ws/combination/comb_7.html
- **Ben Eater's Adder Video**: https://www.youtube.com/watch?v=wvJc9CZcvBc

## Troubleshooting

**Q: My sum is always wrong**
- A: Check XOR gate connections carefully
- Double-check input pin labels

**Q: Carry doesn't propagate**
- A: Verify Carry_out connects to next Carry_in
- Check that first Carry_in is grounded (0)

**Q: Logisim won't start**
- A: Ensure Java is installed: `java -version`
- Try: `java -jar path/to/logisim.jar`

---

**Note to Contributors**: If you've built the `binary_adder.circ` file, please submit a pull request to include it in this directory!
