# WALL-E Development Environment Setup Guide

This guide will help you set up all the tools needed for the WALL-E learning platform on Windows, macOS, or Linux.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Core Tools](#core-tools)
3. [Development Environment](#development-environment)
4. [Embedded Toolchains](#embedded-toolchains)
5. [Simulation Software](#simulation-software)
6. [Hardware Setup (Optional)](#hardware-setup-optional)
7. [Verification](#verification)
8. [Troubleshooting](#troubleshooting)

## Prerequisites

### System Requirements

- **Operating System**: Windows 10/11, macOS 11+, or Linux (Ubuntu 20.04+ recommended)
- **RAM**: 4GB minimum, 8GB+ recommended
- **Disk Space**: 10GB free space minimum
- **Internet**: Required for downloads and updates
- **Admin Access**: Needed for software installation

### Skills Required

- Basic command line usage
- File system navigation
- Software installation

## Core Tools

### 1. Git Version Control

Git is essential for cloning the repository and version control.

#### Windows
```bash
# Download and install Git for Windows
# Visit: https://git-scm.com/download/win
# Run the installer with default settings
# Verify installation:
git --version
```

#### macOS
```bash
# Install via Homebrew (recommended)
brew install git

# Or install Xcode Command Line Tools
xcode-select --install

# Verify installation:
git --version
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install git -y
git --version
```

### 2. C/C++ Compiler

#### Windows
**Option A: MSYS2 (Recommended)**
```bash
# Download MSYS2 from: https://www.msys2.org/
# After installation, open MSYS2 terminal and run:
pacman -Syu
pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-gdb make
```

**Option B: Visual Studio Build Tools**
- Download from: https://visualstudio.microsoft.com/downloads/
- Install "Desktop development with C++" workload

#### macOS
```bash
# Install Xcode Command Line Tools (includes clang)
xcode-select --install

# Verify:
clang --version
gcc --version  # Actually points to clang on macOS
```

#### Linux
```bash
sudo apt update
sudo apt install build-essential gdb -y
gcc --version
g++ --version
```

### 3. Make Build System

#### Windows (MSYS2)
```bash
# Already included in MSYS2 gcc package
make --version
```

#### macOS
```bash
# Included with Xcode Command Line Tools
make --version
```

#### Linux
```bash
# Included in build-essential
make --version
```

### 4. Python 3

Used for scripts and tools throughout the curriculum.

#### Windows
```bash
# Download from: https://www.python.org/downloads/
# Check "Add Python to PATH" during installation
python --version
pip --version
```

#### macOS
```bash
# Python 3 comes pre-installed on modern macOS
# Or install via Homebrew:
brew install python3
python3 --version
pip3 --version
```

#### Linux
```bash
sudo apt install python3 python3-pip -y
python3 --version
pip3 --version
```

## Development Environment

Choose one or more IDEs/editors based on your preference.

### Option 1: Visual Studio Code (Recommended)

VS Code is lightweight, cross-platform, and has excellent C/C++ support.

#### All Platforms
1. Download from: https://code.visualstudio.com/
2. Install for your platform
3. Install extensions:
   ```
   - C/C++ (Microsoft)
   - C/C++ Extension Pack (Microsoft)
   - Makefile Tools (Microsoft)
   - Arduino (Microsoft) - for Arduino projects
   - Platform.IO IDE (PlatformIO) - for advanced embedded
   ```

4. Open VS Code, press `Ctrl+Shift+X` (or `Cmd+Shift+X` on Mac), search and install each extension.

### Option 2: CodeLite

CodeLite is the default IDE used in WALL-E examples.

#### Windows
- Download from: https://downloads.codelite.org/
- Run installer for Windows

#### macOS
```bash
brew install --cask codelite
```

#### Linux
```bash
sudo apt install codelite -y
```

### Option 3: Arduino IDE (For Arduino Projects)

#### All Platforms
1. Download from: https://www.arduino.cc/en/software
2. Install for your platform
3. Open Arduino IDE
4. Go to File → Preferences
5. Set sketchbook location (optional)

## Embedded Toolchains

### ARM GCC (For Bare-Metal ARM)

Used in Module 2 (Computer Architecture) and advanced Module 4 lessons.

#### Windows
```bash
# Download ARM GCC from:
# https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads

# Add bin directory to PATH
# Verify:
arm-none-eabi-gcc --version
```

#### macOS
```bash
brew install --cask gcc-arm-embedded
arm-none-eabi-gcc --version
```

#### Linux
```bash
sudo apt install gcc-arm-none-eabi gdb-arm-none-eabi -y
arm-none-eabi-gcc --version
```

### AVR GCC (For Arduino)

Usually installed automatically with Arduino IDE, but can be installed separately.

#### Windows
- Included with Arduino IDE

#### macOS
```bash
brew tap osx-cross/avr
brew install avr-gcc
```

#### Linux
```bash
sudo apt install gcc-avr avr-libc avrdude -y
```

### ESP-IDF (For ESP32 Projects)

#### All Platforms
```bash
# Clone ESP-IDF repository
mkdir -p ~/esp
cd ~/esp
git clone --recursive https://github.com/espressif/esp-idf.git

# Install ESP-IDF
cd esp-idf
./install.sh  # Linux/Mac
# Or: install.bat  # Windows

# Set up environment (run this in each terminal session)
. ./export.sh  # Linux/Mac
# Or: export.bat  # Windows
```

For detailed ESP32 setup, see Module 4 documentation.

### Platform.IO (Optional, Advanced)

Platform.IO provides unified development for multiple embedded platforms.

#### All Platforms (VS Code Extension)
1. Open VS Code
2. Install "PlatformIO IDE" extension
3. Restart VS Code
4. PlatformIO will automatically download toolchains as needed

## Simulation Software

### 1. Logisim-evolution

Digital logic circuit simulator for Module 1 and 2.

#### All Platforms
1. Download from: https://github.com/logisim-evolution/logisim-evolution/releases
2. Requires Java Runtime Environment (JRE)
   ```bash
   # Windows/macOS: Download Java from https://www.java.com/
   # Linux:
   sudo apt install default-jre -y
   ```
3. Download latest `.jar` file
4. Run: `java -jar logisim-evolution.jar`

**Tip**: Create a shortcut or alias for easy launching.

### 2. Tinkercad Circuits (Online)

Web-based electronics and Arduino simulator.

#### All Platforms
1. Create free account at: https://www.tinkercad.com/
2. Navigate to "Circuits" section
3. No installation required!

### 3. QEMU

CPU and system emulator for Module 2 (ARM assembly).

#### Windows
```bash
# Download from: https://www.qemu.org/download/#windows
# Or via MSYS2:
pacman -S mingw-w64-x86_64-qemu
```

#### macOS
```bash
brew install qemu
qemu-system-arm --version
```

#### Linux
```bash
sudo apt install qemu-system-arm qemu-system-x86 -y
qemu-system-arm --version
```

### 4. KiCad (PCB Design)

For Module 3 PCB design lessons.

#### All Platforms
1. Download from: https://www.kicad.org/download/
2. Install for your platform
3. Launch KiCad to verify installation

### 5. Fritzing (Optional, Beginner-Friendly)

Simpler alternative for circuit diagrams.

#### All Platforms
1. Download from: https://fritzing.org/download/
2. Fritzing is now donation-ware (or compile from source for free)

### 6. Proteus (Optional, Commercial)

Advanced microcontroller simulation. Commercial software with student licenses available.

- Visit: https://www.labcenter.com/
- Free trial available
- Not required for WALL-E curriculum

## Hardware Setup (Optional)

Hardware is optional but highly recommended for Module 4 and 5.

### Recommended Starter Kit

**Option A: Arduino Kit**
- Arduino Uno or Nano
- Breadboard (830 points)
- Jumper wires (male-to-male, male-to-female)
- LEDs (various colors)
- Resistors (220Ω, 1kΩ, 10kΩ)
- Push buttons
- USB cable

**Option B: ESP32 Kit**
- ESP32 DevKit
- Breadboard and wires
- Basic components (LEDs, resistors, buttons)
- Sensors (DHT22, ultrasonic, LDR)

**Option C: Raspberry Pi Pico**
- Raspberry Pi Pico or Pico W
- Similar components to Arduino kit

### USB Drivers

#### Windows
- **Arduino**: Install Arduino IDE (includes drivers)
- **ESP32**: Install CP210x drivers from Silicon Labs or CH340 drivers
- **STM32**: Install ST-Link drivers from STMicroelectronics

#### macOS
- Usually no additional drivers needed
- For CH340-based boards: https://github.com/adrianmihalko/ch340g-ch34g-ch34x-mac-os-x-driver

#### Linux
- Add user to dialout group for serial access:
  ```bash
  sudo usermod -a -G dialout $USER
  # Log out and log back in for changes to take effect
  ```

### Serial Terminal Software

#### All Platforms
**Option 1: Arduino IDE Serial Monitor** (easiest)

**Option 2: PuTTY** (Windows)
- Download from: https://www.putty.org/

**Option 3: screen** (macOS/Linux)
```bash
# macOS/Linux built-in
screen /dev/ttyUSB0 115200  # Linux
screen /dev/cu.usbserial-* 115200  # macOS
```

**Option 4: minicom** (Linux)
```bash
sudo apt install minicom -y
minicom -D /dev/ttyUSB0 -b 115200
```

## Verification

After installation, verify your setup:

### 1. Test C++ Compilation

Create a test file `test.cpp`:
```cpp
#include <iostream>

int main() {
    std::cout << "WALL-E setup successful!" << std::endl;
    return 0;
}
```

Compile and run:
```bash
g++ test.cpp -o test
./test  # Linux/Mac
# Or: test.exe  # Windows
```

Expected output: `WALL-E setup successful!`

### 2. Test Makefile Build

Create `Makefile`:
```makefile
all:
	@echo "Makefile working!"
```

Run:
```bash
make
```

Expected output: `Makefile working!`

### 3. Test Arduino (If Hardware Available)

1. Open Arduino IDE
2. File → Examples → 01.Basics → Blink
3. Tools → Board → Select your board
4. Tools → Port → Select your port
5. Click Upload
6. LED on board should blink

### 4. Test Logisim

1. Launch Logisim-evolution
2. Add a few gates
3. Run simulation
4. If it works, you're ready!

### 5. Test QEMU

```bash
qemu-system-arm --version
```

Should display version information.

## Docker Environment (Optional)

For a consistent, isolated environment across all platforms:

### Install Docker
- **Windows/Mac**: Docker Desktop from https://www.docker.com/products/docker-desktop
- **Linux**:
  ```bash
  sudo apt install docker.io docker-compose -y
  sudo usermod -aG docker $USER
  ```

### Use WALL-E Docker Image (Coming Soon)
```bash
# Pull WALL-E development environment
docker pull walle/dev-env:latest

# Run container
docker run -it -v $(pwd):/workspace walle/dev-env:latest
```

## Troubleshooting

### Common Issues

#### "Command not found" Errors
- **Solution**: Ensure tool is installed and added to system PATH
- **Windows**: Check Environment Variables
- **macOS/Linux**: Check `~/.bashrc`, `~/.zshrc`, or `~/.profile`

#### Serial Port Access Denied (Linux)
```bash
# Add user to dialout group
sudo usermod -a -G dialout $USER
# Log out and log back in
```

#### Logisim Won't Launch
- **Issue**: Missing or wrong Java version
- **Solution**: Install Java JRE 8 or newer
  ```bash
  # Check Java version
  java -version
  ```

#### Arduino Upload Fails
- **Check**: Correct board selected in Tools → Board
- **Check**: Correct port selected in Tools → Port
- **Check**: USB cable is data cable (not charge-only)
- **Try**: Press reset button on Arduino right before upload

#### ESP32 Not Detected
- **Install drivers**: CP210x or CH340 depending on your board
- **Check**: USB cable quality
- **Try**: Different USB port

#### QEMU: "Could not initialize SDL"
- **Linux**: Install SDL libraries
  ```bash
  sudo apt install libsdl2-dev -y
  ```

#### VS Code C/C++ Extension Issues
- Open VS Code
- Press `Ctrl+Shift+P` (or `Cmd+Shift+P`)
- Type "C/C++: Edit Configurations (UI)"
- Set compiler path manually

### Getting Help

If you encounter issues not covered here:

1. **Check module-specific documentation**: Each module may have additional setup steps
2. **Search WALL-E Issues**: https://github.com/your-repo/WALL-E/issues
3. **Community Forum**: Post in the WALL-E discussion board
4. **Stack Overflow**: Use tags `arduino`, `embedded`, `esp32`, etc.

## Next Steps

Once your environment is set up:

1. **Review the Learning Path**: [docs/curriculum/LEARNING_PATH.md](../curriculum/LEARNING_PATH.md)
2. **Start Module 1**: [01-Digital-Foundations/](../../01-Digital-Foundations/)
3. **Join the Community**: Share your progress!

## Optional: Customize Your Environment

### Shell Aliases

Add to `~/.bashrc` or `~/.zshrc`:
```bash
# Quick navigation
alias walle="cd ~/Projects/WALL-E"

# Common builds
alias build-arm="arm-none-eabi-gcc"
alias qemu-arm="qemu-system-arm"

# ESP32
alias esp-init=". ~/esp/esp-idf/export.sh"
```

### VS Code Workspace

Create `.vscode/settings.json` in WALL-E root:
```json
{
    "files.associations": {
        "*.h": "c",
        "*.c": "c",
        "*.cpp": "cpp"
    },
    "C_Cpp.default.compilerPath": "/usr/bin/g++",
    "C_Cpp.default.cStandard": "c11",
    "C_Cpp.default.cppStandard": "c++14"
}
```

### Git Configuration

```bash
# Set your identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Useful aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
```

---

**Congratulations!** Your WALL-E development environment is ready. Time to start learning!

For hardware-specific setup, see [HARDWARE_GUIDE.md](HARDWARE_GUIDE.md).
