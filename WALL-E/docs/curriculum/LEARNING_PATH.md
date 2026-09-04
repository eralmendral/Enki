# WALL-E Learning Path

This document provides a visual curriculum map with suggested learning sequences, prerequisites, time estimates, and difficulty ratings.

## Overview

The WALL-E curriculum is organized into 6 modules with progressive difficulty. You can follow the linear path or customize based on your interests and background.

## Learning Path Visualization

```
START HERE
    │
    ▼
┌─────────────────────────────────────────┐
│  Module 1: Digital Foundations          │
│  ⏱ 35-45 hours │ 🎯 Beginner            │
│  📚 10 Lessons │ ✅ No prerequisites    │
└─────────────────────────────────────────┘
    │
    ├──────────────────────────┐
    │                          │
    ▼                          ▼
┌───────────────────────┐  ┌───────────────────────┐
│  Module 2:            │  │  Module 3:            │
│  Computer             │  │  Electronics          │
│  Architecture         │  │  Basics               │
│  ⏱ 60-75 hours        │  │  ⏱ 45-55 hours        │
│  🎯 Intermediate      │  │  🎯 Beginner          │
│  📚 18 Lessons        │  │  📚 14 Lessons        │
│  ✅ Requires: Mod 1   │  │  ✅ Requires: Mod 1   │
└───────────────────────┘  └───────────────────────┘
    │                          │
    │      ┌──────────────────┘
    │      │
    ▼      ▼
┌─────────────────────────────────────────┐
│  Module 4: Embedded Systems             │
│  ⏱ 70-90 hours │ 🎯 Intermediate        │
│  📚 20 Lessons │ ✅ Requires: Mod 1,3   │
│                │    (Mod 2 recommended)  │
└─────────────────────────────────────────┘
    │
    ├──────────────────────────┐
    │                          │
    ▼                          ▼
┌───────────────────────┐  ┌───────────────────────┐
│  Module 5:            │  │  Module 6:            │
│  Hardware             │  │  Simulations &        │
│  Projects             │  │  Virtual Labs         │
│  ⏱ 40-60 hours        │  │  ⏱ 30-40 hours        │
│  🎯 Intermediate      │  │  🎯 Beginner-Inter    │
│  📚 15 Projects       │  │  📚 20+ Labs          │
│  ✅ Requires: Mod 4   │  │  ✅ Can run parallel  │
└───────────────────────┘  └───────────────────────┘
```

## Module Details

### Module 1: Digital Foundations
**Path**: `01-Digital-Foundations/`

| Lesson | Topic | Time | Difficulty | Prerequisites |
|--------|-------|------|------------|---------------|
| L1 | Binary and Number Systems | 2-3h | ⭐ | None |
| L2 | Boolean Algebra | 2-3h | ⭐ | L1 |
| L3 | Logic Gates | 3-4h | ⭐ | L2 |
| L4 | Combinational Circuits | 4-5h | ⭐⭐ | L3 |
| L5 | Sequential Circuits | 4-5h | ⭐⭐ | L4 |
| L6 | Flip-Flops and Registers | 3-4h | ⭐⭐ | L5 |
| L7 | Counters and State Machines | 4-5h | ⭐⭐ | L6 |
| L8 | Timing and Clocking | 3-4h | ⭐⭐ | L7 |
| L9 | Memory Elements | 3-4h | ⭐⭐ | L6 |
| L10 | Capstone: Simple ALU Design | 6-8h | ⭐⭐⭐ | All previous |

**Total**: 35-45 hours | **Difficulty**: Beginner ⭐

### Module 2: Computer Architecture
**Path**: `02-Computer-Architecture/`

| Lesson | Topic | Time | Difficulty | Prerequisites |
|--------|-------|------|------------|---------------|
| L1 | CPU Fundamentals | 3-4h | ⭐⭐ | M1-L10 |
| L2 | Von Neumann vs Harvard | 2-3h | ⭐⭐ | L1 |
| L3 | ALU Design | 4-5h | ⭐⭐ | M1-L10 |
| L4 | Control Unit | 4-5h | ⭐⭐⭐ | L3 |
| L5 | Registers and Register Files | 3-4h | ⭐⭐ | L1 |
| L6 | Instruction Set Architecture | 4-5h | ⭐⭐⭐ | L4 |
| L7 | RISC vs CISC | 2-3h | ⭐⭐ | L6 |
| L8 | Assembly Language Basics | 4-5h | ⭐⭐ | L6 |
| L9 | Assembly Programming - ARM | 5-6h | ⭐⭐⭐ | L8 |
| L10 | Memory Hierarchy | 4-5h | ⭐⭐ | L1 |
| L11 | Cache Design | 5-6h | ⭐⭐⭐ | L10 |
| L12 | Virtual Memory | 4-5h | ⭐⭐⭐ | L11 |
| L13 | Pipelining | 5-6h | ⭐⭐⭐ | L6 |
| L14 | Hazards and Forwarding | 4-5h | ⭐⭐⭐ | L13 |
| L15 | Parallel Processing Intro | 3-4h | ⭐⭐ | L13 |
| L16 | I/O Systems | 4-5h | ⭐⭐ | L1 |
| L17 | Interrupts and Exceptions | 4-5h | ⭐⭐⭐ | L16 |
| L18 | Capstone: Simple CPU | 10-12h | ⭐⭐⭐⭐ | All previous |

**Total**: 60-75 hours | **Difficulty**: Intermediate ⭐⭐

### Module 3: Electronics Basics
**Path**: `03-Electronics-Basics/`

| Lesson | Topic | Time | Difficulty | Prerequisites |
|--------|-------|------|------------|---------------|
| L1 | Circuit Theory Fundamentals | 3-4h | ⭐ | Basic math |
| L2 | Ohm's Law & Kirchhoff's Laws | 4-5h | ⭐ | L1 |
| L3 | Resistors and Networks | 3-4h | ⭐ | L2 |
| L4 | Capacitors and RC Circuits | 4-5h | ⭐⭐ | L2 |
| L5 | Inductors and RL Circuits | 3-4h | ⭐⭐ | L4 |
| L6 | Diodes and Rectifiers | 4-5h | ⭐⭐ | L2 |
| L7 | Transistors - BJT | 5-6h | ⭐⭐ | L6 |
| L8 | MOSFETs and Digital Switching | 4-5h | ⭐⭐ | L7, M1-L3 |
| L9 | Operational Amplifiers | 5-6h | ⭐⭐⭐ | L2 |
| L10 | Power Supply Design | 5-6h | ⭐⭐⭐ | L6, L9 |
| L11 | Signal Processing Basics | 4-5h | ⭐⭐⭐ | L4, L9 |
| L12 | PCB Design Principles | 5-6h | ⭐⭐ | All previous |
| L13 | Sensors and Transducers | 4-5h | ⭐⭐ | L2, L9 |
| L14 | Capstone: Regulated PSU | 8-10h | ⭐⭐⭐ | L1-L10 |

**Total**: 45-55 hours | **Difficulty**: Beginner to Intermediate ⭐-⭐⭐

### Module 4: Embedded Systems
**Path**: `04-Embedded-Systems/`

| Lesson | Topic | Time | Difficulty | Prerequisites |
|--------|-------|------|------------|---------------|
| L1 | Microcontroller vs Microprocessor | 2-3h | ⭐ | M1, M2-L1 |
| L2 | Microcontroller Architecture | 3-4h | ⭐⭐ | M2-L1 |
| L3 | GPIO Basics | 3-4h | ⭐ | M1-L3 |
| L4 | GPIO Programming | 4-5h | ⭐⭐ | L3 |
| L5 | Pull-up/Pull-down Resistors | 3-4h | ⭐⭐ | L4, M3-L3 |
| L6 | Timers and Counters | 4-5h | ⭐⭐ | M1-L7 |
| L7 | PWM Generation | 4-5h | ⭐⭐ | L6 |
| L8 | ADC Basics | 5-6h | ⭐⭐ | M3-L11 |
| L9 | DAC and Analog Output | 3-4h | ⭐⭐ | L8 |
| L10 | UART Communication | 5-6h | ⭐⭐ | L4 |
| L11 | I2C Protocol | 5-6h | ⭐⭐⭐ | L10 |
| L12 | SPI Protocol | 5-6h | ⭐⭐⭐ | L10 |
| L13 | Interrupts in MCUs | 4-5h | ⭐⭐⭐ | M2-L17 |
| L14 | Interrupt Service Routines | 4-5h | ⭐⭐⭐ | L13 |
| L15 | DMA - Direct Memory Access | 4-5h | ⭐⭐⭐ | M2-L10 |
| L16 | Watchdog Timers | 3-4h | ⭐⭐ | L6 |
| L17 | Low-Power Design | 4-5h | ⭐⭐⭐ | L2 |
| L18 | RTOS Basics | 5-6h | ⭐⭐⭐⭐ | L13, L14 |
| L19 | Embedded C/C++ Best Practices | 4-5h | ⭐⭐ | All previous |
| L20 | Capstone: Multi-Peripheral | 10-12h | ⭐⭐⭐⭐ | All previous |

**Total**: 70-90 hours | **Difficulty**: Intermediate ⭐⭐-⭐⭐⭐

### Module 5: Hardware Projects
**Path**: `05-Hardware-Projects/`

| Project | Topic | Time | Difficulty | Prerequisites |
|---------|-------|------|------------|---------------|
| P1 | Blinking LED | 1-2h | ⭐ | M4-L4 |
| P2 | Push Button Input | 2-3h | ⭐ | M4-L5 |
| P3 | Seven-Segment Display | 3-4h | ⭐⭐ | M4-L4 |
| P4 | LCD Character Display | 3-4h | ⭐⭐ | M4-L10 |
| P5 | Temperature Sensor | 2-3h | ⭐⭐ | M4-L8 |
| P6 | Servo Motor Control | 2-3h | ⭐⭐ | M4-L7 |
| P7 | Ultrasonic Distance Sensor | 3-4h | ⭐⭐ | M4-L6, L8 |
| P8 | Light-Activated Night Light | 3-4h | ⭐⭐ | M4-L8, P7 |
| P9 | UART Serial Communication | 3-4h | ⭐⭐ | M4-L10 |
| P10 | I2C Multi-Device Bus | 4-5h | ⭐⭐⭐ | M4-L11 |
| P11 | SPI SD Card Logger | 4-5h | ⭐⭐⭐ | M4-L12 |
| P12 | WiFi IoT Device | 4-5h | ⭐⭐⭐ | M4-L10 |
| P13 | Bluetooth Remote Control | 4-5h | ⭐⭐⭐ | M4-L10 |
| P14 | Real-Time Clock | 3-4h | ⭐⭐ | M4-L11 |
| P15 | Capstone: Weather Station | 8-12h | ⭐⭐⭐⭐ | All M4 |

**Total**: 40-60 hours | **Difficulty**: Beginner to Advanced ⭐-⭐⭐⭐

### Module 6: Simulations and Virtual Labs
**Path**: `06-Simulations/`

Can be studied in parallel with other modules. Maps directly to theory lessons.

| Lab Category | Labs | Time | Difficulty | Prerequisites |
|--------------|------|------|------------|---------------|
| Logisim Labs | 10 labs | 15-20h | ⭐-⭐⭐ | Module 1, 2 |
| Tinkercad Circuits | 8 labs | 8-12h | ⭐-⭐⭐ | Module 3, 4 |
| QEMU Experiments | 4 labs | 6-8h | ⭐⭐⭐ | Module 2 |
| Proteus Simulations | 4 labs | 6-8h | ⭐⭐ | Module 4 |

**Total**: 30-40 hours | **Difficulty**: Mixed ⭐-⭐⭐

## Suggested Learning Sequences

### Path 1: Complete Beginner (Linear)
Recommended for those with no hardware/electronics background.

```
M1 → M3 → M4 → M5
     ↓
     M2 (parallel with M4)
     ↓
     M6 (throughout all modules)
```

**Total Time**: 180-250 hours (4-6 months at 10 hours/week)

### Path 2: CS Background (Focus on Hardware)
For those with programming experience wanting embedded systems skills.

```
M1 (skim) → M4 → M5 → M2 (deep dive)
            ↓
            M3 (as needed)
            ↓
            M6 (throughout)
```

**Total Time**: 120-180 hours (3-4 months at 10 hours/week)

### Path 3: Electronics Background (Focus on Programming)
For those with electronics knowledge wanting microcontroller programming.

```
M1 → M2 (focus assembly) → M4 → M5
M3 (skim as reference)
M6 (QEMU and Proteus focus)
```

**Total Time**: 140-200 hours (3-5 months at 10 hours/week)

### Path 4: Fast Track (Core Concepts Only)
Minimum path to build basic embedded projects.

```
M1 (L1-L4, L6, L10) → M3 (L1-L8) → M4 (L1-L14) → M5 (P1-P10)
```

**Total Time**: 80-120 hours (2-3 months at 10 hours/week)

## Difficulty Legend

- ⭐ **Beginner**: No prior knowledge required, fundamental concepts
- ⭐⭐ **Intermediate**: Builds on previous lessons, moderate complexity
- ⭐⭐⭐ **Advanced**: Complex concepts, integration of multiple topics
- ⭐⭐⭐⭐ **Expert**: Capstone projects, comprehensive integration

## Time Estimates

Time estimates include:
- Reading theory and documentation
- Running and understanding code examples
- Completing hands-on labs or simulations
- Solving practice exercises
- Building hardware (where applicable)

Adjust based on your pace and depth of exploration.

## Prerequisites Summary

### Module 1: Digital Foundations
- Basic arithmetic and algebra
- Comfort with abstract thinking
- No programming required (but helpful)

### Module 2: Computer Architecture
- **Required**: Module 1 complete
- Basic programming in any language
- Understanding of binary/hex

### Module 3: Electronics Basics
- **Required**: Module 1 (L1-L3 minimum)
- Basic algebra
- No electronics background needed

### Module 4: Embedded Systems
- **Required**: Module 1, Module 3 (L1-L8)
- **Recommended**: Module 2 (for deeper understanding)
- C/C++ programming basics
- Access to Arduino/ESP32/Pi (recommended)

### Module 5: Hardware Projects
- **Required**: Module 4 (L1-L14 minimum)
- Hardware kit (Arduino/ESP32 + components)
- Breadboard and basic tools

### Module 6: Simulations and Virtual Labs
- Prerequisites vary by lab category
- No hardware required
- Software installation required

## Self-Assessment Checkpoints

Before moving to the next module, ensure you can:

**After Module 1**:
- [ ] Convert between binary, decimal, and hexadecimal
- [ ] Simplify Boolean expressions
- [ ] Design basic combinational circuits (adders, multiplexers)
- [ ] Understand sequential circuit timing
- [ ] Build a simple ALU in simulation

**After Module 2**:
- [ ] Explain the fetch-decode-execute cycle
- [ ] Write simple assembly programs
- [ ] Understand cache operation
- [ ] Explain pipelining and hazards
- [ ] Simulate a basic CPU

**After Module 3**:
- [ ] Apply Ohm's Law and Kirchhoff's Laws
- [ ] Design basic RC/RL circuits
- [ ] Use transistors as switches
- [ ] Build a regulated power supply
- [ ] Read component datasheets

**After Module 4**:
- [ ] Configure and use GPIO pins
- [ ] Set up timers and generate PWM
- [ ] Read analog sensors with ADC
- [ ] Implement UART/I2C/SPI communication
- [ ] Write interrupt service routines

**After Module 5**:
- [ ] Build circuits on breadboard
- [ ] Debug hardware issues
- [ ] Interface multiple sensors
- [ ] Create complete embedded systems
- [ ] Document and share your projects

## Additional Resources

- **Curriculum FAQs**: See each module's README for specific questions
- **Study Groups**: Join the WALL-E community forum
- **Office Hours**: Weekly Q&A sessions (see community calendar)
- **Project Showcase**: Share your builds and get feedback

## Customization

Feel free to:
- Skip lessons you already know
- Deep-dive into topics of interest
- Combine lessons from different modules
- Repeat challenging lessons
- Create your own projects

The learning path is a guide, not a rigid requirement. Learn at your own pace and follow your curiosity!

---

**Need help choosing your path?** See [docs/guides/GETTING_STARTED.md](../guides/GETTING_STARTED.md) for personalized recommendations.
