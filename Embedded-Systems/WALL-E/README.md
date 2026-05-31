# WALL-E: Workshop for Advanced Learning in Logic and Electronics

<img width="480px" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/50f9d7d2-7d1b-4b61-b959-5d02102ba501/dbz5el3-0f738887-71cc-4566-8455-38d5332ea875.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzUwZjlkN2QyLTdkMWItNGI2MS1iOTU5LTVkMDIxMDJiYTUwMVwvZGJ6NWVsMy0wZjczODg4Ny03MWNjLTQ1NjYtODQ1NS0zOGQ1MzMyZWE4NzUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.C-OA5kX5Vk0Zwn3_TjCECzsJsmzTQVMbhgWxAjqcdOE"></img>

Welcome to **WALL-E**, a comprehensive, hands-on learning platform for hardware engineering, computer architecture, electronics, and embedded systems. Whether you're a curious beginner or transitioning into embedded development, this curriculum will guide you from digital foundations to building real IoT devices.

## What is WALL-E?

WALL-E combines:
- **Theory**: Deep conceptual understanding of how hardware works
- **Code**: Working C/C++ and Assembly examples for every concept
- **Hardware**: Real projects with Arduino, ESP32, and Raspberry Pi
- **Simulation**: Virtual labs using Logisim, Tinkercad, and QEMU

## Learning Modules

### Module 1: Digital Foundations
Learn binary, Boolean algebra, logic gates, sequential circuits, and build a simple ALU.

### Module 2: Computer Architecture
Understand CPU design, instruction sets, assembly language, memory hierarchy, and pipelining.

### Module 3: Electronics Basics
Master circuit theory, components, transistors, op-amps, and design your own power supply.

### Module 4: Embedded Systems
Program microcontrollers, work with GPIO, timers, ADC, and communication protocols (UART, I2C, SPI).

### Module 5: Hardware Projects
Build 15+ progressive projects from blinking LEDs to a complete weather station.

### Module 6: Simulations and Virtual Labs
Practice with 20+ virtual labs in Logisim, Tinkercad, QEMU, and Proteus.

## Quick Start

1. **Set up your environment**: Follow [docs/guides/SETUP_GUIDE.md](docs/guides/SETUP_GUIDE.md)
2. **Review the learning path**: Check [docs/curriculum/LEARNING_PATH.md](docs/curriculum/LEARNING_PATH.md)
3. **Start with Module 1**: Begin at [01-Digital-Foundations/](01-Digital-Foundations/)
4. **Join the community**: Share your progress and ask questions

## Prerequisites

- Basic programming knowledge (any language)
- Curiosity about how computers work at the hardware level
- No electronics experience required (we start from scratch)

## Project Structure

```
WALL-E/
├── 01-Digital-Foundations/    # Binary, logic gates, sequential circuits
├── 02-Computer-Architecture/  # CPU design, assembly, memory systems
├── 03-Electronics-Basics/     # Circuit theory, components, PCB design
├── 04-Embedded-Systems/       # Microcontroller programming, protocols
├── 05-Hardware-Projects/      # 15+ hands-on build projects
├── 06-Simulations/            # Virtual labs and simulations
├── docs/                      # Curriculum maps, guides, resources
└── tools/                     # Setup scripts and templates
```

## Hardware Shopping List (Optional)

For hands-on projects, we recommend:
- Arduino Uno or Nano ($10-25)
- ESP32 Dev Board ($8-15)
- Breadboard and jumper wires ($10)
- Basic component kit (resistors, LEDs, sensors) ($20-30)

See [docs/guides/HARDWARE_GUIDE.md](docs/guides/HARDWARE_GUIDE.md) for detailed recommendations.

## Learning Philosophy

WALL-E follows a **spiral learning** approach:
- Concepts are introduced simply, then revisited with increasing depth
- Every theory lesson includes practical code and/or hardware demonstrations
- Build progressively complex projects that combine multiple concepts
- Safe experimentation through simulations before working with real hardware

## Documentation

- **[Technical Prompt](TECHNICAL_PROMPT.md)**: Complete specification for regenerating this project
- **[Learning Path](docs/curriculum/LEARNING_PATH.md)**: Visual curriculum map with prerequisites
- **[Setup Guide](docs/guides/SETUP_GUIDE.md)**: Environment setup for all platforms
- **[Resources](docs/references/RESOURCES.md)**: Curated external learning materials

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Proposing new lessons
- Improving existing content
- Reporting issues
- Sharing your projects

## License

This project is open-source under the [MIT License](LICENSE). Feel free to use, modify, and share.

## Acknowledgments

Inspired by WALL-E's curiosity, persistence, and ability to create something meaningful from individual components.

---

## Quick Reference: Microprocessors and Microcontrollers

### Microprocessors
- Came before microcontrollers
- Performs sets of instructions and mathematical operations
- **Core components**:
  - Control Unit (ALU, registers, program counter, flags)
  - External Interface (ROM, RAM, I/O)
  - Buses (Data, Control, Address)
- Traditional microprocessors need external RAM/ROM/IO
- Modern processors include caches (built-in RAM)

### How Systems Boot Up
1. Processor powers on and executes startup routine
2. Goes to specific memory address via address bus
3. Fetches initial instructions (boot code) from non-volatile memory (ROM/Flash)
4. Boot code loads more code and begins execution
5. This boot code is created via:
   - Assembly language programming, OR
   - High-level language compiled to machine code
   - Binary file flashed to ROM/Flash memory

*For a deeper dive into microprocessor architecture, see [02-Computer-Architecture/](02-Computer-Architecture/).*

---

**Ready to start learning? Head to [01-Digital-Foundations/Lesson1-Binary-and-Logic/](01-Digital-Foundations/Lesson1-Binary-and-Logic/) and begin your journey!**

