#!/bin/bash

# WALL-E Project Initialization Script
# This script creates the complete directory structure for the WALL-E learning platform

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  WALL-E Project Initialization${NC}"
echo -e "${BLUE}========================================${NC}"
echo

# Get project root directory (should be run from tools/setup/)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/../.." && pwd )"

echo -e "${YELLOW}Project root: ${PROJECT_ROOT}${NC}"
echo

# Ask for confirmation
read -p "This will create the complete WALL-E directory structure. Continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Aborted."
    exit 1
fi

cd "$PROJECT_ROOT"

echo -e "${GREEN}Creating documentation directories...${NC}"
mkdir -p docs/curriculum
mkdir -p docs/guides
mkdir -p docs/references

echo -e "${GREEN}Creating Module 1: Digital Foundations...${NC}"
for i in {1..10}; do
    mkdir -p "01-Digital-Foundations/Lesson${i}"/{code,exercises/solutions,simulation,resources}
done

echo -e "${GREEN}Creating Module 2: Computer Architecture...${NC}"
for i in {1..18}; do
    mkdir -p "02-Computer-Architecture/Lesson${i}"/{code,exercises/solutions,simulation,resources}
done

echo -e "${GREEN}Creating Module 3: Electronics Basics...${NC}"
for i in {1..14}; do
    mkdir -p "03-Electronics-Basics/Lesson${i}"/{code,exercises/solutions,simulation,resources,hardware}
done

echo -e "${GREEN}Creating Module 4: Embedded Systems...${NC}"
for i in {1..20}; do
    mkdir -p "04-Embedded-Systems/Lesson${i}"/{code,exercises/solutions,simulation,resources,hardware}
done

echo -e "${GREEN}Creating Module 5: Hardware Projects...${NC}"
for i in {1..15}; do
    mkdir -p "05-Hardware-Projects/Project$(printf "%02d" $i)"/{code,schematic,bom,photos}
done

echo -e "${GREEN}Creating Module 6: Simulations...${NC}"
mkdir -p 06-Simulations/Logisim-Labs
mkdir -p 06-Simulations/Tinkercad-Circuits
mkdir -p 06-Simulations/QEMU-Experiments
mkdir -p 06-Simulations/Proteus-Simulations

for i in {1..10}; do
    mkdir -p "06-Simulations/Logisim-Labs/Lab$(printf "%02d" $i)"
done

for i in {1..6}; do
    mkdir -p "06-Simulations/Tinkercad-Circuits/Lab$(printf "%02d" $i)"
done

for i in {1..4}; do
    mkdir -p "06-Simulations/QEMU-Experiments/Lab$(printf "%02d" $i)"
    mkdir -p "06-Simulations/Proteus-Simulations/Lab$(printf "%02d" $i)"
done

echo -e "${GREEN}Creating tools directories...${NC}"
mkdir -p tools/setup/templates/lesson_template
mkdir -p tools/setup/templates/project_template
mkdir -p tools/setup/docker
mkdir -p tools/scripts

echo -e "${GREEN}Creating .gitignore if not exists...${NC}"
if [ ! -f .gitignore ]; then
    cat > .gitignore << 'EOL'
# Build artifacts
*.o
*.exe
*.out
a.out
build/
build-Debug/
build-Release/
bin/
obj/

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store
Thumbs.db

# CodeLite
.codelite/
*.workspace.layout
*.project.layout
*.mk
compile_commands.json

# Compiled binaries
binary_operations
number_systems
*.elf
*.hex

# Simulation temporary files
*.log
*.tmp

# OS files
.DS_Store
Thumbs.db
desktop.ini

# Python
__pycache__/
*.pyc
*.pyo
.venv/
venv/

# Backup files
*.bak
*.backup
*~

# Docker
.dockerignore
EOL
fi

echo -e "${GREEN}Creating LICENSE file if not exists...${NC}"
if [ ! -f LICENSE ]; then
    cat > LICENSE << 'EOL'
MIT License

Copyright (c) 2026 WALL-E Project Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOL
fi

echo -e "${GREEN}Initializing git repository if not already initialized...${NC}"
if [ ! -d .git ]; then
    git init
    echo -e "${GREEN}Git repository initialized.${NC}"
else
    echo -e "${YELLOW}Git repository already exists.${NC}"
fi

echo
echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}✓ Project initialization complete!${NC}"
echo -e "${BLUE}========================================${NC}"
echo
echo -e "Next steps:"
echo -e "1. Review the structure: ${YELLOW}tree -L 2${NC} (if tree is installed)"
echo -e "2. Start with Lesson 1: ${YELLOW}cd 01-Digital-Foundations/Lesson1-Binary-and-Logic${NC}"
echo -e "3. Use ${YELLOW}./tools/setup/new_lesson.sh${NC} to create new lessons"
echo
echo -e "${GREEN}Happy learning with WALL-E!${NC}"
