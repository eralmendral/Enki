# WALL-E: Technical Prompt for Learning Platform Generation

## Project Overview

### Vision
Create **WALL-E** (Workshop for Advanced Learning in Logic and Electronics) - a comprehensive, self-paced learning platform that guides students from digital fundamentals through advanced embedded systems design. The project combines theoretical knowledge with practical implementation through code examples, hands-on hardware projects, and virtual simulations.

### Mission Statement
Democratize hardware engineering and computer architecture education by providing:
- Free, open-source curriculum accessible to anyone
- Progressive learning path from beginner to intermediate levels
- Practical, hands-on experience alongside theoretical foundations
- Multiple learning modalities to accommodate different learning styles

### Target Audience
- **Self-learners** exploring hardware and electronics
- **Computer science students** wanting to understand the hardware layer
- **Hobbyists** building IoT and embedded projects
- **Career changers** entering embedded systems development
- **Educators** seeking structured curriculum materials

### Learning Philosophy
The WALL-E project follows these pedagogical principles:

1. **Spiral Learning**: Concepts are introduced simply, then revisited with increasing depth
2. **Theory + Practice**: Every concept is paired with working code and/or hardware demonstrations
3. **Build to Learn**: Students construct progressively complex projects
4. **Fail-Safe Environment**: Simulations allow experimentation without hardware damage or cost
5. **Open Exploration**: Encourage curiosity-driven learning beyond the core curriculum

### Project Name Rationale
WALL-E (the Pixar character) represents:
- **Curiosity**: Exploring and understanding how things work
- **Persistence**: Continuing to learn despite complexity
- **Building**: Creating useful things from components
- **Recycling knowledge**: Building on foundational concepts to create something greater

---

## Complete Directory Structure

Generate the following hierarchical project structure:

```
WALL-E/
├── README.md                          # Project welcome and navigation
├── TECHNICAL_PROMPT.md                # This document
├── LICENSE                            # MIT or appropriate open-source license
├── .gitignore                         # Build artifacts, IDE files, OS files
│
├── docs/
│   ├── curriculum/
│   │   ├── LEARNING_PATH.md          # Visual curriculum map with prerequisites
│   │   ├── MODULE_01_OVERVIEW.md     # Digital Foundations overview
│   │   ├── MODULE_02_OVERVIEW.md     # Computer Architecture overview
│   │   ├── MODULE_03_OVERVIEW.md     # Electronics overview
│   │   ├── MODULE_04_OVERVIEW.md     # Embedded Systems overview
│   │   ├── MODULE_05_OVERVIEW.md     # Hardware Projects overview
│   │   └── MODULE_06_OVERVIEW.md     # Simulations overview
│   │
│   ├── guides/
│   │   ├── SETUP_GUIDE.md            # Complete environment setup
│   │   ├── IDE_SETUP.md              # IDE configurations (CodeLite, VSCode, etc.)
│   │   ├── HARDWARE_GUIDE.md         # Recommended kits and suppliers
│   │   ├── SIMULATION_TOOLS.md       # Installing and using simulation software
│   │   └── TROUBLESHOOTING.md        # Common issues and solutions
│   │
│   └── references/
│       ├── RESOURCES.md              # Curated external resources
│       ├── GLOSSARY.md               # Technical terms and definitions
│       ├── DATASHEETS.md             # Links to component datasheets
│       └── BIBLIOGRAPHY.md           # Recommended textbooks and papers
│
├── 01-Digital-Foundations/
│   ├── README.md                      # Module overview and objectives
│   ├── Lesson1-Binary-and-Logic/
│   │   ├── README.md                 # Theory: Binary, hex, two's complement
│   │   ├── code/
│   │   │   ├── Makefile
│   │   │   ├── binary_operations.cpp # Bit manipulation examples
│   │   │   └── number_systems.cpp    # Base conversions
│   │   ├── exercises/
│   │   │   ├── problems.md           # Practice problems
│   │   │   └── solutions/            # Worked solutions
│   │   ├── simulation/
│   │   │   └── binary_adder.circ     # Logisim circuit
│   │   └── resources/
│   │       └── references.md         # Additional reading
│   ├── Lesson2-Boolean-Algebra/
│   ├── Lesson3-Logic-Gates/
│   ├── Lesson4-Combinational-Circuits/
│   ├── Lesson5-Sequential-Circuits/
│   ├── Lesson6-Flip-Flops-and-Registers/
│   ├── Lesson7-Counters-and-Shift-Registers/
│   ├── Lesson8-Finite-State-Machines/
│   ├── Lesson9-Timing-and-Clocking/
│   └── Lesson10-Module-Capstone/      # Design a simple ALU
│
├── 02-Computer-Architecture/
│   ├── README.md
│   ├── Lesson1-CPU-Fundamentals/
│   ├── Lesson2-Von-Neumann-vs-Harvard/
│   ├── Lesson3-ALU-Design/
│   ├── Lesson4-Control-Unit/
│   ├── Lesson5-Registers-and-Register-Files/
│   ├── Lesson6-Instruction-Set-Architecture/
│   ├── Lesson7-RISC-vs-CISC/
│   ├── Lesson8-Assembly-Language-Basics/
│   ├── Lesson9-Assembly-Programming-ARM/
│   ├── Lesson10-Memory-Hierarchy/
│   ├── Lesson11-Cache-Design/
│   ├── Lesson12-Virtual-Memory/
│   ├── Lesson13-Pipelining/
│   ├── Lesson14-Hazards-and-Forwarding/
│   ├── Lesson15-Parallel-Processing/
│   ├── Lesson16-IO-Systems/
│   ├── Lesson17-Interrupts-and-Exceptions/
│   └── Lesson18-Module-Capstone/      # Implement a simple CPU in simulation
│
├── 03-Electronics-Basics/
│   ├── README.md
│   ├── Lesson1-Circuit-Theory-Fundamentals/
│   ├── Lesson2-Ohms-Law-and-Kirchhoffs-Laws/
│   ├── Lesson3-Resistors-and-Resistor-Networks/
│   ├── Lesson4-Capacitors-and-RC-Circuits/
│   ├── Lesson5-Inductors-and-RL-Circuits/
│   ├── Lesson6-Diodes-and-Rectifiers/
│   ├── Lesson7-Transistors-BJT/
│   ├── Lesson8-MOSFETs-and-Digital-Switching/
│   ├── Lesson9-Operational-Amplifiers/
│   ├── Lesson10-Power-Supply-Design/
│   ├── Lesson11-Signal-Processing-Basics/
│   ├── Lesson12-PCB-Design-Principles/
│   ├── Lesson13-Sensors-and-Transducers/
│   └── Lesson14-Module-Capstone/      # Design a regulated power supply
│
├── 04-Embedded-Systems/
│   ├── README.md
│   ├── Lesson1-Microcontroller-vs-Microprocessor/
│   ├── Lesson2-Microcontroller-Architecture/
│   ├── Lesson3-GPIO-Basics/
│   ├── Lesson4-GPIO-Programming/
│   ├── Lesson5-Pull-up-Pull-down-Resistors/
│   ├── Lesson6-Timers-and-Counters/
│   ├── Lesson7-PWM-Generation/
│   ├── Lesson8-ADC-Basics/
│   ├── Lesson9-DAC-and-Analog-Output/
│   ├── Lesson10-UART-Communication/
│   ├── Lesson11-I2C-Protocol/
│   ├── Lesson12-SPI-Protocol/
│   ├── Lesson13-Interrupts-in-Microcontrollers/
│   ├── Lesson14-Interrupt-Service-Routines/
│   ├── Lesson15-DMA-Direct-Memory-Access/
│   ├── Lesson16-Watchdog-Timers/
│   ├── Lesson17-Low-Power-Design/
│   ├── Lesson18-RTOS-Basics/
│   ├── Lesson19-Embedded-C-Best-Practices/
│   └── Lesson20-Module-Capstone/      # Multi-peripheral integrated project
│
├── 05-Hardware-Projects/
│   ├── README.md                      # How to approach hardware projects
│   ├── Project01-Blinking-LED/
│   │   ├── README.md                 # Step-by-step build guide
│   │   ├── code/                     # Arduino/ESP32/Pi code
│   │   ├── schematic/                # Wiring diagram
│   │   ├── bom.md                    # Bill of materials with links
│   │   └── photos/                   # Reference images
│   ├── Project02-Push-Button-Input/
│   ├── Project03-Seven-Segment-Display/
│   ├── Project04-LCD-Display/
│   ├── Project05-Temperature-Sensor/
│   ├── Project06-Servo-Motor-Control/
│   ├── Project07-Ultrasonic-Distance-Sensor/
│   ├── Project08-Light-Sensor-Night-Light/
│   ├── Project09-UART-Serial-Communication/
│   ├── Project10-I2C-Multi-Device-Bus/
│   ├── Project11-SPI-SD-Card-Logger/
│   ├── Project12-WiFi-IoT-Device/
│   ├── Project13-Bluetooth-Remote-Control/
│   ├── Project14-Real-Time-Clock/
│   └── Project15-Capstone-Weather-Station/
│
├── 06-Simulations/
│   ├── README.md                      # Overview of simulation tools
│   ├── Logisim-Labs/
│   │   ├── Lab01-Basic-Gates/
│   │   ├── Lab02-Adders-and-Subtractors/
│   │   ├── Lab03-Multiplexers/
│   │   ├── Lab04-Decoders-and-Encoders/
│   │   ├── Lab05-Flip-Flops/
│   │   ├── Lab06-Registers/
│   │   ├── Lab07-Counters/
│   │   ├── Lab08-ALU-Design/
│   │   ├── Lab09-Control-Unit/
│   │   └── Lab10-Simple-CPU/
│   ├── Tinkercad-Circuits/
│   │   ├── Lab01-Basic-LED-Circuit/
│   │   ├── Lab02-Series-Parallel-Circuits/
│   │   ├── Lab03-Voltage-Divider/
│   │   ├── Lab04-Transistor-Switch/
│   │   ├── Lab05-Arduino-Basics/
│   │   └── Lab06-Sensor-Integration/
│   ├── QEMU-Experiments/
│   │   ├── Lab01-ARM-Assembly-Hello-World/
│   │   ├── Lab02-Bare-Metal-Boot/
│   │   ├── Lab03-Interrupt-Handling/
│   │   └── Lab04-Memory-Mapped-IO/
│   └── Proteus-Simulations/
│       ├── Lab01-Microcontroller-Basics/
│       ├── Lab02-GPIO-LED-Control/
│       ├── Lab03-ADC-Simulation/
│       └── Lab04-Serial-Communication/
│
└── tools/
    ├── setup/
    │   ├── init_project.sh           # Initialize project structure
    │   ├── new_lesson.sh             # Generate new lesson template
    │   ├── docker/
    │   │   ├── Dockerfile            # Development environment
    │   │   └── docker-compose.yml
    │   └── templates/
    │       ├── lesson_template/      # Standard lesson structure
    │       └── project_template/     # Standard project structure
    │
    └── scripts/
        ├── build_all.sh              # Build all code examples
        ├── test_simulations.sh       # Verify simulation files
        └── generate_toc.py           # Auto-generate table of contents
```

---

## Lesson Template Specification

Every lesson follows this standardized structure:

### Directory Structure
```
LessonN-Topic-Name/
├── README.md
├── code/
│   ├── Makefile (or CMakeLists.txt)
│   ├── main.cpp (or .c, .s for assembly)
│   ├── additional_files.cpp
│   └── .clang-format
├── exercises/
│   ├── problems.md
│   └── solutions/
│       ├── solution1.cpp
│       └── solution2.cpp
├── hardware/ (if applicable)
│   ├── schematic.png
│   ├── wiring_diagram.png
│   └── bom.md
├── simulation/
│   ├── circuit.circ (Logisim)
│   ├── tinkercad_link.md
│   └── instructions.md
└── resources/
    ├── references.md
    ├── datasheets/ (links or PDFs)
    └── additional_reading.md
```

### README.md Structure
Each lesson README should contain:

```markdown
# Lesson N: [Topic Name]

## Learning Objectives
- Objective 1
- Objective 2
- Objective 3

## Prerequisites
- Lesson X: Topic
- Basic understanding of Y

## Estimated Time
- Theory: X minutes
- Code examples: Y minutes
- Exercises: Z minutes
- Total: ~N hours

## Theory

### Introduction
[Engaging introduction to the topic]

### Core Concepts

#### Concept 1
[Detailed explanation with diagrams]

#### Concept 2
[Detailed explanation with diagrams]

### Examples
[Real-world applications or examples]

## Code Walkthrough

### Example 1: [Description]
[Explanation of what the code demonstrates]

```cpp
// Code snippet with inline comments
```

[Explanation of key sections]

### Example 2: [Description]
...

## Hands-On Lab

### Using the Simulation
[Instructions for running the simulation]

### Building the Hardware (if applicable)
[Step-by-step instructions]

## Exercises

See `exercises/problems.md` for practice problems. Solutions are available in `exercises/solutions/`.

## Key Takeaways
- Takeaway 1
- Takeaway 2
- Takeaway 3

## Next Steps
Continue to [Lesson N+1: Next Topic](../LessonN+1-Topic/)

## Additional Resources
See `resources/references.md` for further reading.
```

---

## Detailed Curriculum Outline

### Module 1: Digital Foundations (8-10 lessons)

**Learning Outcomes**: Understand digital logic from transistors to complex sequential circuits

**Lesson Breakdown**:

1. **Binary and Number Systems** (2-3 hours)
   - Binary, octal, hexadecimal representation
   - Conversion between bases
   - Two's complement for negative numbers
   - Binary arithmetic (addition, subtraction)
   - Code: Implement base converters and binary calculators
   - Simulation: Visualize binary addition circuits

2. **Boolean Algebra** (2-3 hours)
   - Boolean operations (AND, OR, NOT, XOR, NAND, NOR)
   - Truth tables
   - Boolean laws (De Morgan's, distributive, etc.)
   - Simplification using Karnaugh maps
   - Code: Boolean expression evaluator
   - Simulation: Build truth table generators

3. **Logic Gates** (3-4 hours)
   - Physical implementation using transistors
   - Gate symbols and representations
   - Universal gates (NAND, NOR)
   - Propagation delay and timing
   - Code: Simulate gate behavior
   - Simulation: Build basic gates in Logisim

4. **Combinational Circuits** (4-5 hours)
   - Half adder and full adder
   - Ripple-carry adder
   - Multiplexers and demultiplexers
   - Encoders and decoders
   - Comparators
   - Code: Implement arithmetic circuits
   - Simulation: Build 4-bit ALU for addition/subtraction

5. **Sequential Circuits** (4-5 hours)
   - Difference from combinational logic
   - Latches (SR, D, JK)
   - Clocks and timing diagrams
   - Setup and hold times
   - Code: Simulate latch behavior
   - Simulation: Build SR and D latches

6. **Flip-Flops and Registers** (3-4 hours)
   - Edge-triggered flip-flops
   - D, T, JK flip-flops
   - Parallel and serial registers
   - Shift registers
   - Code: Implement register file
   - Simulation: Build 8-bit register

7. **Counters and State Machines** (4-5 hours)
   - Binary counters (up, down, up/down)
   - Ring counters and Johnson counters
   - Finite state machines (FSM)
   - Moore vs Mealy machines
   - Code: FSM implementation in C++
   - Simulation: Build traffic light controller FSM

8. **Timing and Clocking** (3-4 hours)
   - Clock distribution
   - Synchronous vs asynchronous design
   - Metastability
   - Clock domain crossing
   - Code: Timing analysis tools
   - Simulation: Demonstrate metastability

9. **Memory Elements** (3-4 hours)
   - SRAM structure and operation
   - DRAM structure and operation
   - ROM, EPROM, EEPROM, Flash
   - Memory addressing and decoding
   - Code: Simple memory simulator
   - Simulation: Build small RAM array

10. **Module Capstone: Simple ALU Design** (6-8 hours)
    - Integrate adder, logic gates, multiplexer
    - Control signals for operation selection
    - Status flags (zero, carry, overflow, negative)
    - Code: Complete ALU implementation
    - Simulation: Build and test 8-bit ALU

### Module 2: Computer Architecture (12-15 lessons)

**Learning Outcomes**: Understand how CPUs work from instruction execution to memory systems

**Lesson Breakdown**:

1. **CPU Fundamentals** (3-4 hours)
   - Fetch-decode-execute cycle
   - Major CPU components
   - Data path and control path
   - Code: Simple instruction simulator

2. **Von Neumann vs Harvard Architecture** (2-3 hours)
   - Architectural differences
   - Trade-offs and use cases
   - Modified Harvard architecture
   - Code: Compare execution models

3. **ALU Design and Implementation** (4-5 hours)
   - Arithmetic operations
   - Logical operations
   - Shift and rotate operations
   - Status flags
   - Code: Complete ALU in C++
   - Simulation: Build multi-operation ALU

4. **Control Unit Design** (4-5 hours)
   - Hardwired control
   - Microprogrammed control
   - Instruction decoding
   - Control signal generation
   - Code: Control unit simulator

5. **Registers and Register Files** (3-4 hours)
   - General-purpose registers
   - Special-purpose registers (PC, SP, FLAGS)
   - Register file organization
   - Multi-port register files
   - Code: Implement register file with read/write ports

6. **Instruction Set Architecture** (4-5 hours)
   - Instruction formats
   - Addressing modes
   - Instruction types (data transfer, arithmetic, control flow)
   - RISC principles
   - Code: ISA simulator

7. **RISC vs CISC** (2-3 hours)
   - Design philosophies
   - Performance considerations
   - Examples: ARM (RISC) vs x86 (CISC)
   - Code: Compare instruction execution

8. **Assembly Language Basics** (4-5 hours)
   - Assembly syntax
   - Registers and memory
   - Basic instructions (mov, add, sub, etc.)
   - Labels and branches
   - Code: Write first assembly programs

9. **Assembly Programming - ARM** (5-6 hours)
   - ARM register conventions
   - Load/store architecture
   - Function calls and stack frames
   - Code: Implement algorithms in ARM assembly

10. **Memory Hierarchy** (4-5 hours)
    - Registers, cache, RAM, storage hierarchy
    - Locality (temporal and spatial)
    - Memory performance metrics
    - Code: Demonstrate locality effects

11. **Cache Design** (5-6 hours)
    - Direct-mapped, set-associative, fully-associative
    - Cache replacement policies (LRU, FIFO, random)
    - Write policies (write-through, write-back)
    - Cache coherence basics
    - Code: Cache simulator

12. **Virtual Memory** (4-5 hours)
    - Paging and page tables
    - Translation lookaside buffer (TLB)
    - Page replacement algorithms
    - Code: Virtual memory simulator

13. **Pipelining** (5-6 hours)
    - Instruction pipeline stages
    - Speedup and throughput
    - Pipeline hazards overview
    - Code: Pipelined CPU simulator

14. **Hazards and Forwarding** (4-5 hours)
    - Data hazards and forwarding
    - Control hazards and branch prediction
    - Structural hazards
    - Code: Implement forwarding logic

15. **Parallel Processing Intro** (3-4 hours)
    - Instruction-level parallelism
    - Superscalar processors
    - Multi-core basics
    - Code: Parallel algorithm examples

16. **I/O Systems** (4-5 hours)
    - I/O devices and controllers
    - Memory-mapped I/O vs port-mapped I/O
    - DMA (Direct Memory Access)
    - Code: I/O driver simulation

17. **Interrupts and Exceptions** (4-5 hours)
    - Interrupt handling mechanism
    - Interrupt vectors and priority
    - Exception types
    - Code: Interrupt service routine examples

18. **Module Capstone: Simple CPU Implementation** (10-12 hours)
    - Design complete CPU with basic ISA
    - Implement in Logisim or SystemVerilog
    - Write programs for the CPU
    - Simulation: Test with assembly programs

### Module 3: Electronics and Circuit Design (10-12 lessons)

**Learning Outcomes**: Understand circuit theory and design analog/digital electronics

**Lesson Breakdown**:

1. **Circuit Theory Fundamentals** (3-4 hours)
   - Voltage, current, resistance, power
   - Circuit elements and conventions
   - Kirchhoff's laws introduction
   - Code: Circuit equation solver

2. **Ohm's Law and Kirchhoff's Laws** (4-5 hours)
   - Ohm's law applications
   - Kirchhoff's current law (KCL)
   - Kirchhoff's voltage law (KVL)
   - Series and parallel circuits
   - Code: Automated circuit analysis
   - Simulation: Build circuits in Tinkercad

3. **Resistors and Resistor Networks** (3-4 hours)
   - Resistor types and ratings
   - Color codes
   - Voltage dividers
   - Current dividers
   - Thevenin and Norton equivalents
   - Hardware: Build voltage divider circuit

4. **Capacitors and RC Circuits** (4-5 hours)
   - Capacitor behavior
   - Charging and discharging
   - Time constants
   - RC filters (low-pass, high-pass)
   - Code: RC circuit simulator
   - Hardware: Build RC filter

5. **Inductors and RL Circuits** (3-4 hours)
   - Inductor behavior
   - RL time constants
   - Inductive kickback
   - Code: RL circuit analysis

6. **Diodes and Rectifiers** (4-5 hours)
   - Diode operation and I-V characteristics
   - Rectification (half-wave, full-wave)
   - Zener diodes for voltage regulation
   - LEDs
   - Hardware: Build LED circuit with current limiting
   - Simulation: Full-wave rectifier

7. **Transistors - BJT** (5-6 hours)
   - NPN and PNP transistors
   - Transistor as switch
   - Transistor as amplifier
   - Biasing circuits
   - Hardware: Transistor switch controlling LED
   - Code: Calculate biasing resistors

8. **MOSFETs and Digital Switching** (4-5 hours)
   - MOSFET operation
   - N-channel and P-channel
   - CMOS logic
   - Switching applications
   - Hardware: MOSFET as switch for higher power loads

9. **Operational Amplifiers** (5-6 hours)
   - Op-amp characteristics
   - Inverting and non-inverting amplifiers
   - Comparators
   - Filters using op-amps
   - Simulation: Build op-amp circuits

10. **Power Supply Design** (5-6 hours)
    - Transformer basics
    - Rectification and filtering
    - Voltage regulation (linear and switching)
    - LDO regulators
    - Hardware: Build 5V regulated power supply
    - Code: Power supply calculator

11. **Signal Processing Basics** (4-5 hours)
    - Analog vs digital signals
    - Sampling and quantization
    - Nyquist theorem
    - Filters (passive and active)
    - Code: Simple DSP examples

12. **PCB Design Principles** (5-6 hours)
    - Schematic capture
    - PCB layout guidelines
    - Trace width and spacing
    - Ground planes
    - Through-hole vs SMD
    - Tools: KiCad tutorial

13. **Sensors and Transducers** (4-5 hours)
    - Temperature sensors (thermistor, LM35, DHT)
    - Light sensors (LDR, photodiode)
    - Pressure, proximity, motion sensors
    - Hardware: Interface multiple sensors

14. **Module Capstone: Regulated Power Supply** (8-10 hours)
    - Design complete 5V/3.3V power supply
    - Include transformer, rectifier, filtering, regulation
    - PCB design in KiCad
    - Build and test physical circuit

### Module 4: Embedded Systems (15-18 lessons)

**Learning Outcomes**: Program microcontrollers and build embedded applications

**Lesson Breakdown**:

1. **Microcontroller vs Microprocessor** (2-3 hours)
   - Architectural differences
   - When to use each
   - Popular families (AVR, ARM Cortex-M, ESP32, PIC)
   - Code: Compare programming models

2. **Microcontroller Architecture** (3-4 hours)
   - CPU core
   - Memory map
   - Peripherals
   - Clock system
   - Code: Explore memory map

3. **GPIO Basics** (3-4 hours)
   - Digital I/O pins
   - Input vs output modes
   - High impedance state
   - GPIO registers
   - Code: Read GPIO documentation

4. **GPIO Programming** (4-5 hours)
   - Configure pin direction
   - Read input state
   - Write output state
   - Bit manipulation techniques
   - Code: Blink LED (bare-metal)
   - Hardware: LED blink on Arduino/ESP32

5. **Pull-up and Pull-down Resistors** (3-4 hours)
   - Why they're needed
   - Internal vs external
   - Button debouncing
   - Code: Read button with internal pull-up
   - Hardware: Button input circuit

6. **Timers and Counters** (4-5 hours)
   - Timer basics and modes
   - Prescalers
   - Timer interrupts
   - Measuring time intervals
   - Code: Implement delay using timer
   - Hardware: Accurate timing with timer

7. **PWM Generation** (4-5 hours)
   - PWM principles
   - Duty cycle and frequency
   - PWM hardware in MCU
   - Applications (LED dimming, motor control)
   - Code: Generate PWM signal
   - Hardware: Dim LED with PWM

8. **ADC - Analog to Digital Conversion** (5-6 hours)
   - ADC operation
   - Resolution and reference voltage
   - Sampling rate
   - Reading analog sensors
   - Code: Read potentiometer value
   - Hardware: Display analog value

9. **DAC and Analog Output** (3-4 hours)
   - DAC operation
   - PWM as pseudo-DAC
   - External DAC chips
   - Code: Generate analog waveform

10. **UART Communication** (5-6 hours)
    - Serial communication basics
    - Baud rate, start/stop bits, parity
    - UART hardware
    - Sending and receiving data
    - Code: UART echo program
    - Hardware: Serial communication with PC

11. **I2C Protocol** (5-6 hours)
    - I2C bus topology
    - Master-slave communication
    - Addressing
    - Reading/writing I2C devices
    - Code: Interface I2C sensor (e.g., BME280)
    - Hardware: Connect I2C devices

12. **SPI Protocol** (5-6 hours)
    - SPI bus signals (MOSI, MISO, SCK, CS)
    - Full-duplex communication
    - SPI modes and timing
    - Code: Interface SPI device (e.g., SD card)
    - Hardware: SPI communication demo

13. **Interrupts in Microcontrollers** (4-5 hours)
    - Interrupt concept and benefits
    - Interrupt vectors
    - Priority and nesting
    - Code: Simple interrupt example

14. **Interrupt Service Routines** (4-5 hours)
    - ISR best practices
    - Volatile variables
    - Interrupt flags
    - Code: Button press with interrupt
    - Hardware: Respond to events with interrupts

15. **DMA - Direct Memory Access** (4-5 hours)
    - DMA concept and benefits
    - DMA channels and configuration
    - Use cases (ADC, UART, SPI)
    - Code: DMA-based data transfer

16. **Watchdog Timers** (3-4 hours)
    - Purpose of watchdog
    - Configuration
    - Preventing resets
    - Code: Implement watchdog

17. **Low-Power Design** (4-5 hours)
    - Sleep modes
    - Power consumption optimization
    - Wake-up sources
    - Code: Battery-powered sensor with sleep

18. **RTOS Basics** (5-6 hours)
    - Why use RTOS
    - Tasks and scheduling
    - Semaphores and mutexes
    - Code: FreeRTOS introduction

19. **Embedded C/C++ Best Practices** (4-5 hours)
    - Bit manipulation
    - Volatile keyword
    - Memory management
    - Code optimization
    - Code: Efficient embedded patterns

20. **Module Capstone: Multi-Peripheral System** (10-12 hours)
    - Integrate UART, I2C, ADC, PWM
    - Build sensor data logger with display
    - Implement with interrupts and timers
    - Hardware: Complete integrated project

### Module 5: Hardware Projects (10+ projects)

**Learning Outcomes**: Apply knowledge to build real hardware systems

Progressive project sequence:

1. **Blinking LED** - GPIO output basics
2. **Push Button Input** - GPIO input with debouncing
3. **Seven-Segment Display** - Multiplexing and patterns
4. **LCD Character Display** - Parallel communication
5. **Temperature Sensor** - ADC and analog sensors
6. **Servo Motor Control** - PWM applications
7. **Ultrasonic Distance Sensor** - Pulse timing measurements
8. **Light-Activated Night Light** - Sensors with control logic
9. **UART Serial Communication** - PC interfacing
10. **I2C Multi-Device Bus** - Sensor networks
11. **SPI SD Card Logger** - Data storage systems
12. **WiFi IoT Device** - Wireless connectivity (ESP32)
13. **Bluetooth Remote Control** - BLE communication
14. **Real-Time Clock** - I2C RTC module, timekeeping
15. **Capstone: Weather Station** - Integrate temp, humidity, pressure, display, logging

Each project includes:
- Detailed wiring diagrams
- Complete code with comments
- Bill of materials with supplier links
- Step-by-step build instructions
- Troubleshooting guide
- Extension ideas

### Module 6: Simulations and Virtual Labs (20+ labs)

**Learning Outcomes**: Master simulation tools for safe, cost-effective experimentation

**Logisim Labs** (Digital logic):
1. Basic logic gates
2. Adders and subtractors
3. Multiplexers and demultiplexers
4. Flip-flops and latches
5. Registers and counters
6. ALU design
7. Simple CPU datapath
8. Memory systems
9. Control unit
10. Complete CPU simulation

**Tinkercad Circuits Labs** (Electronics):
1. LED circuits
2. Series and parallel configurations
3. Voltage and current dividers
4. Transistor switches
5. Arduino basics
6. Sensor interfacing
7. Motor control
8. LCD displays

**QEMU Labs** (CPU emulation):
1. ARM assembly hello world
2. Bare-metal boot process
3. Memory-mapped I/O
4. Interrupt handling
5. Timer programming

**Proteus Labs** (Microcontroller):
1. Microcontroller programming
2. GPIO simulation
3. ADC and sensors
4. Communication protocols

---

## Technology Stack Specification

### Programming Languages
- **C**: Embedded programming, bare-metal development
- **C++**: Higher-level examples, simulators (C++11/14 standard minimum)
- **Assembly**: ARM and x86 for architecture lessons
- **Python**: Build scripts, tools, automation
- **Shell**: Setup and utility scripts (bash-compatible)

### Development Tools

**IDEs and Editors**:
- CodeLite (primary, configured for embedded)
- Visual Studio Code (with C/C++ extensions)
- Arduino IDE (for Arduino projects)
- Platform.IO (for advanced embedded development)

**Build Systems**:
- Make (traditional Makefiles)
- CMake (for larger projects)
- Arduino build system
- Platform.IO build system

**Compilers and Toolchains**:
- GCC/G++ (general C/C++)
- LLVM/Clang (alternative compiler)
- ARM GCC (arm-none-eabi-gcc for bare-metal ARM)
- AVR GCC (for Arduino/AVR)
- ESP-IDF (for ESP32)

**Simulation and Design Tools**:
- **Logisim-evolution**: Digital logic simulation (free)
- **Tinkercad Circuits**: Online circuit simulation (free)
- **QEMU**: CPU and system emulation (free)
- **Proteus**: Microcontroller simulation (commercial, optional)
- **KiCad**: PCB design (free)
- **Fritzing**: Beginner-friendly circuit diagrams (free)

**Hardware Platforms**:
- Arduino (Uno, Nano, Mega - AVR-based)
- ESP32 (WiFi/Bluetooth capable)
- Raspberry Pi Pico (ARM Cortex-M0+)
- STM32 (ARM Cortex-M series)

**Version Control**:
- Git (with meaningful commit messages)
- GitHub/GitLab for hosting

**Documentation**:
- Markdown for all documentation
- Mermaid for diagrams
- Graphviz for flowcharts
- LaTeX for mathematical expressions (optional)

**Code Quality**:
- clang-format (C/C++ formatting)
- clangd (language server)
- cppcheck (static analysis, optional)

### Platform Support
All tools and instructions should support:
- **Windows 10/11**
- **macOS** (11+)
- **Linux** (Ubuntu/Debian preferred)

Provide platform-specific setup instructions where needed.

---

## Development Environment Setup

### Initial Setup Guide Structure

Create comprehensive `SETUP_GUIDE.md` covering:

1. **Prerequisites**
   - Operating system requirements
   - Administrative/sudo access
   - Internet connection
   - Disk space requirements

2. **Core Tools Installation**
   - Git
   - GCC/Clang compiler
   - Make
   - Python 3
   - IDE (CodeLite and/or VS Code)

3. **Embedded Toolchains**
   - ARM GCC for bare-metal
   - AVR GCC for Arduino
   - ESP-IDF for ESP32
   - Platform.IO

4. **Simulation Software**
   - Logisim-evolution installation
   - Tinkercad account setup
   - QEMU installation
   - KiCad installation

5. **Hardware Setup** (optional)
   - USB drivers for Arduino/ESP32
   - Serial terminal software
   - Hardware programmer configuration

6. **Verification**
   - Test compilation
   - Run hello world programs
   - Verify simulator functionality

### Docker Environment (Optional)
Provide Dockerfile with all tools pre-installed:
- Base image: Ubuntu LTS
- All compilers and toolchains
- Simulation tools (where feasible)
- Volume mounts for code

Benefits: Consistent environment across platforms

---

## Code Quality Standards

### C/C++ Coding Style

Use `.clang-format` configuration:
```yaml
BasedOnStyle: Google
IndentWidth: 4
ColumnLimit: 100
PointerAlignment: Left
UseTab: Never
```

### Documentation Standards

**Code Comments**:
- File header with purpose, author (optional), date
- Function-level comments explaining purpose, parameters, return values
- Inline comments for complex logic only
- Avoid obvious comments

**README Structure**:
- Clear headings and hierarchy
- Code blocks with language syntax highlighting
- Images/diagrams where helpful
- Links to resources
- Clear learning objectives

### Build Conventions

**Makefile Standards**:
- Targets: all, clean, upload (for embedded)
- Variables for compiler flags, source files
- Commented sections
- Platform detection where needed

**Directory Organization**:
- Source code in `code/` or `src/`
- Headers in `include/` (if separate)
- Build artifacts in `build/` or `bin/`
- Add `build/` to `.gitignore`

---

## Learning Resources Integration

### External Resources Strategy

Curate high-quality, freely accessible resources:

**Textbooks and Online Books**:
- Suggest specific chapters for each lesson
- Prefer open-access or Creative Commons resources
- Include library recommendations

**Video Tutorials**:
- YouTube channels (e.g., Ben Eater, GreatScott!, Andreas Spiess)
- Specific video recommendations per topic
- Playlist creation

**Documentation**:
- Datasheets for common components
- Microcontroller reference manuals
- ARM architecture reference
- IEEE standards (where relevant)

**Online Communities**:
- Arduino Forum
- r/embedded
- r/electronics
- Stack Overflow tags
- Discord servers

**Tools and Utilities**:
- Online calculators (resistor color code, Ohm's law, etc.)
- Reference charts (ASCII table, pin diagrams)
- Simulator libraries

---

## Project Progression Philosophy

### Learning Approach

**Spiral Curriculum**:
- Introduce concepts simply
- Revisit with greater depth in later modules
- Example: GPIO introduced in Module 4, used throughout Module 5, optimized in RTOS lesson

**Prerequisites**:
- Clearly mark prerequisite lessons
- Allow some flexibility in path
- Core path vs optional deep-dives

**Time Estimates**:
- Provide realistic time estimates per lesson
- Theory time + hands-on time + exercise time
- Mark difficulty levels: Beginner | Intermediate | Advanced

**Self-Assessment**:
- Include quiz questions in exercises
- Provide immediate feedback with solutions
- Suggest review if struggling

**Capstone Projects**:
- End each module with integrative project
- Should combine multiple lessons
- Open-ended extensions for further learning

---

## Future Expansion Guidelines

### Adding New Lessons

Use `tools/setup/new_lesson.sh`:
```bash
./tools/setup/new_lesson.sh <module_number> <lesson_number> "<lesson_name>"
```

This should:
- Create directory structure
- Generate template README
- Set up code skeleton with Makefile
- Create exercises and resources folders

### Contribution Guidelines

Create `CONTRIBUTING.md`:
- Code of conduct
- How to propose new lessons
- Code style requirements
- Pull request process
- Review criteria

### Versioning Strategy

Use semantic versioning for curriculum:
- Major: Complete module additions
- Minor: New lessons or significant updates
- Patch: Fixes and small improvements

Tag releases in git:
- v1.0.0: Initial release with Modules 1-2
- v1.1.0: Module 3 added
- etc.

### Community Involvement

Encourage contributions:
- Issue templates for lesson ideas
- Discussion forum for Q&A
- Show-and-tell for student projects
- Guest lesson contributions

---

## Implementation Checklist

When generating this project, complete the following in order:

### Phase 1: Project Foundation
- [ ] Create root directory structure
- [ ] Initialize git repository
- [ ] Create .gitignore (build artifacts, IDE files, OS files)
- [ ] Create LICENSE file (MIT recommended)
- [ ] Create initial README.md

### Phase 2: Documentation
- [ ] Create docs/ directory structure
- [ ] Write SETUP_GUIDE.md
- [ ] Write LEARNING_PATH.md with curriculum map
- [ ] Write RESOURCES.md with curated links
- [ ] Create module overview files
- [ ] Create GLOSSARY.md

### Phase 3: Tools and Templates
- [ ] Create tools/setup/init_project.sh
- [ ] Create tools/setup/new_lesson.sh
- [ ] Create lesson template directory
- [ ] Create project template directory
- [ ] Create .clang-format configuration
- [ ] Create Makefile templates

### Phase 4: Module 1 - Digital Foundations
- [ ] Create module directory
- [ ] Create Lesson 1: Binary and Logic (complete example)
- [ ] Create Lesson 2-10 stubs with README outlines
- [ ] Add simulation files for Lesson 1

### Phase 5: Remaining Module Stubs
- [ ] Create Module 2 directory with lesson stubs
- [ ] Create Module 3 directory with lesson stubs
- [ ] Create Module 4 directory with lesson stubs
- [ ] Create Module 5 directory with project stubs
- [ ] Create Module 6 directory with simulation lab stubs

### Phase 6: Docker Environment (Optional)
- [ ] Create Dockerfile
- [ ] Create docker-compose.yml
- [ ] Test container build
- [ ] Document Docker usage

### Phase 7: Initial Content
- [ ] Complete Lesson 1 as gold standard example
- [ ] Create at least one project (Blinking LED) fully
- [ ] Create at least one simulation lab (Basic Gates) fully
- [ ] Write one complete module overview

### Phase 8: Verification
- [ ] Test all scripts on Linux
- [ ] Test all scripts on macOS
- [ ] Test all scripts on Windows
- [ ] Verify builds work
- [ ] Verify simulations open
- [ ] Review documentation for clarity

### Phase 9: Final Polish
- [ ] Create CONTRIBUTING.md
- [ ] Add badges to README (build status, license, etc.)
- [ ] Create issue templates
- [ ] Set up GitHub Pages for documentation (optional)
- [ ] Create project logo/icon (WALL-E theme)

---

## Success Metrics

The generated project should meet these criteria:

1. **Completeness**: All directory structures created, all template files in place
2. **Clarity**: Documentation is clear and actionable for beginners
3. **Buildability**: All code examples compile and run
4. **Simulation**: All simulation files open in specified tools
5. **Consistency**: All lessons follow same template structure
6. **Accessibility**: Setup instructions work on all three major platforms
7. **Engagement**: Content is interesting and progressively challenging
8. **Extensibility**: Easy to add new lessons using provided tools

---

## AI Assistant Execution Notes

When using this prompt with an AI assistant (like Claude Code, ChatGPT, etc.):

1. **Start with structure**: Create all directories first
2. **Templates before content**: Set up templates, then generate content
3. **One complete example**: Fully implement Lesson 1 as reference
4. **Incremental approach**: Build module by module, not all at once
5. **Test as you go**: Verify builds and scripts work before proceeding
6. **Platform awareness**: Adjust paths and commands for target OS
7. **Consistency checks**: Ensure naming conventions are uniform
8. **Documentation first**: Write README files before code
9. **Progressive disclosure**: Start simple, add complexity gradually
10. **Ask for clarification**: If requirements are unclear, ask the user

---

## License Recommendation

Use **MIT License** for maximum openness and educational use:
- Allows commercial and private use
- Permits modification and distribution
- Requires license and copyright notice
- No liability or warranty

Alternative: **Creative Commons BY-SA** for documentation-heavy educational content

---

## Closing Notes

This technical prompt is designed to be comprehensive enough for an AI assistant to generate a complete, production-ready educational platform. The generated WALL-E project should inspire curiosity, enable hands-on learning, and provide a solid foundation in hardware engineering and computer architecture.

The project name WALL-E reminds us: stay curious, keep building, and transform fundamental components into something amazing.

**Last Updated**: 2026-01-12
**Version**: 1.0.0
**Maintained by**: Open Source Community
