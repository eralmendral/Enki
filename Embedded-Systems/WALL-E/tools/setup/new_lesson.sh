#!/bin/bash

# WALL-E New Lesson Generator
# Creates a new lesson directory with standard template structure

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to display usage
usage() {
    echo "Usage: $0 <module_number> <lesson_number> \"<lesson_name>\""
    echo
    echo "Examples:"
    echo "  $0 1 5 \"Flip-Flops and Registers\""
    echo "  $0 2 10 \"Memory Hierarchy\""
    echo "  $0 4 15 \"DMA Direct Memory Access\""
    echo
    echo "Module numbers:"
    echo "  1 - Digital Foundations"
    echo "  2 - Computer Architecture"
    echo "  3 - Electronics Basics"
    echo "  4 - Embedded Systems"
    echo "  5 - Hardware Projects (use different format)"
    echo "  6 - Simulations (use different format)"
    exit 1
}

# Check arguments
if [ $# -ne 3 ]; then
    usage
fi

MODULE_NUM=$1
LESSON_NUM=$2
LESSON_NAME=$3

# Validate module number
if [ "$MODULE_NUM" -lt 1 ] || [ "$MODULE_NUM" -gt 6 ]; then
    echo -e "${RED}Error: Module number must be between 1 and 6${NC}"
    exit 1
fi

# Get project root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/../.." && pwd )"

# Module name mapping
declare -A MODULE_NAMES
MODULE_NAMES[1]="01-Digital-Foundations"
MODULE_NAMES[2]="02-Computer-Architecture"
MODULE_NAMES[3]="03-Electronics-Basics"
MODULE_NAMES[4]="04-Embedded-Systems"
MODULE_NAMES[5]="05-Hardware-Projects"
MODULE_NAMES[6]="06-Simulations"

MODULE_DIR="${MODULE_NAMES[$MODULE_NUM]}"
LESSON_DIR_NAME="Lesson${LESSON_NUM}-$(echo "$LESSON_NAME" | tr ' ' '-')"
FULL_PATH="$PROJECT_ROOT/$MODULE_DIR/$LESSON_DIR_NAME"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  WALL-E New Lesson Generator${NC}"
echo -e "${BLUE}========================================${NC}"
echo
echo -e "Module:  ${YELLOW}$MODULE_DIR${NC}"
echo -e "Lesson:  ${YELLOW}$LESSON_DIR_NAME${NC}"
echo -e "Path:    ${YELLOW}$FULL_PATH${NC}"
echo

# Check if lesson already exists
if [ -d "$FULL_PATH" ]; then
    echo -e "${RED}Error: Lesson directory already exists!${NC}"
    echo -e "Path: $FULL_PATH"
    exit 1
fi

# Create directory structure
echo -e "${GREEN}Creating lesson directory structure...${NC}"
mkdir -p "$FULL_PATH"/{code,exercises/solutions,simulation,resources}

# Add hardware directory for modules 3 and 4
if [ "$MODULE_NUM" -eq 3 ] || [ "$MODULE_NUM" -eq 4 ]; then
    mkdir -p "$FULL_PATH/hardware"
fi

# Create README template
echo -e "${GREEN}Creating README.md template...${NC}"
cat > "$FULL_PATH/README.md" << EOL
# Lesson ${LESSON_NUM}: ${LESSON_NAME}

## Learning Objectives

By the end of this lesson, you will be able to:
- [Objective 1]
- [Objective 2]
- [Objective 3]

## Prerequisites

- [Prerequisite lesson or concept]
- [Another prerequisite]

## Estimated Time

- **Theory**: X hours
- **Code examples**: Y hours
- **Exercises**: Z hours
- **Total**: ~N hours

---

## Theory

### Introduction

[Engaging introduction to the topic]

### Core Concepts

#### Concept 1

[Detailed explanation]

#### Concept 2

[Detailed explanation]

### Real-World Applications

[Examples of where this is used]

---

## Code Walkthrough

### Example 1: [Description]

See \`code/example.cpp\` for implementation.

\`\`\`cpp
// Code snippet
\`\`\`

**Key Points**:
- Point 1
- Point 2

---

## Hands-On Lab

[Instructions for simulation or hardware lab]

---

## Exercises

See \`exercises/problems.md\` for practice problems.

---

## Key Takeaways

- Takeaway 1
- Takeaway 2
- Takeaway 3

---

## Next Steps

Continue to: [Lesson $((LESSON_NUM + 1)): Next Topic](../Lesson$((LESSON_NUM + 1))/)

---

## Additional Resources

See \`resources/references.md\` for further reading.
EOL

# Create Makefile template
echo -e "${GREEN}Creating Makefile template...${NC}"
cat > "$FULL_PATH/code/Makefile" << 'EOL'
# Makefile for WALL-E Lesson
# Modify as needed for your code

CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -pedantic -O2
TARGET = program

SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o)

all: $(TARGET)
	@echo "Build complete! Run with: ./$(TARGET)"

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJS)

run: $(TARGET)
	./$(TARGET)

rebuild: clean all

.PHONY: all clean run rebuild
EOL

# Create example code file
echo -e "${GREEN}Creating example code file...${NC}"
cat > "$FULL_PATH/code/main.cpp" << 'EOL'
/*
 * WALL-E Lesson Code Example
 *
 * TODO: Add description
 *
 * Compile: make
 * Run: ./program
 */

#include <iostream>
using namespace std;

int main() {
    cout << "WALL-E Lesson Code" << endl;

    // TODO: Add your code here

    return 0;
}
EOL

# Create exercises template
echo -e "${GREEN}Creating exercises template...${NC}"
cat > "$FULL_PATH/exercises/problems.md" << EOL
# Lesson ${LESSON_NUM} Exercises: ${LESSON_NAME}

Complete these exercises to reinforce your understanding.

## Instructions

- Attempt all problems before checking solutions
- Show your work
- Solutions are in the \`solutions/\` folder

---

## Problem 1: [Title]

[Problem description]

---

## Problem 2: [Title]

[Problem description]

---

## Self-Check Questions

1. [Conceptual question]
2. [Conceptual question]

---

**Verify your answers using the code examples or external resources.**
EOL

# Create resources template
echo -e "${GREEN}Creating resources template...${NC}"
cat > "$FULL_PATH/resources/references.md" << EOL
# Lesson ${LESSON_NUM} Additional Resources

## Video Tutorials

- [Link to relevant video]

## Reading Materials

- [Link to article or documentation]

## Interactive Tools

- [Link to online tool or simulator]

## Reference Tables

[Any useful reference tables or charts]

## Books

[Relevant book chapters]

## Tips for Mastery

1. [Tip 1]
2. [Tip 2]
EOL

# Create simulation README
echo -e "${GREEN}Creating simulation README...${NC}"
cat > "$FULL_PATH/simulation/README.md" << EOL
# Simulation Files for Lesson ${LESSON_NUM}

## What to Build

[Description of the simulation circuit or program]

## Instructions

[Step-by-step instructions for building the simulation]

## Testing

[How to verify the simulation works correctly]

## Resources

- [Link to relevant tutorial]
EOL

# Create hardware README if applicable
if [ "$MODULE_NUM" -eq 3 ] || [ "$MODULE_NUM" -eq 4 ]; then
    echo -e "${GREEN}Creating hardware README...${NC}"
    cat > "$FULL_PATH/hardware/README.md" << EOL
# Hardware Setup for Lesson ${LESSON_NUM}

## Bill of Materials (BOM)

| Component | Quantity | Notes |
|-----------|----------|-------|
| [Component 1] | 1 | [Notes] |

## Wiring Diagram

[Description or link to wiring diagram]

## Assembly Instructions

1. [Step 1]
2. [Step 2]

## Testing

[How to verify the hardware setup]

## Troubleshooting

[Common issues and solutions]
EOL
fi

# Summary
echo
echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}✓ Lesson created successfully!${NC}"
echo -e "${BLUE}========================================${NC}"
echo
echo -e "Lesson location: ${YELLOW}$FULL_PATH${NC}"
echo
echo "Created files:"
echo "  - README.md (lesson overview)"
echo "  - code/Makefile"
echo "  - code/main.cpp"
echo "  - exercises/problems.md"
echo "  - resources/references.md"
echo "  - simulation/README.md"
if [ "$MODULE_NUM" -eq 3 ] || [ "$MODULE_NUM" -eq 4 ]; then
    echo "  - hardware/README.md"
fi
echo
echo "Next steps:"
echo "  1. cd $LESSON_DIR_NAME"
echo "  2. Edit README.md with lesson content"
echo "  3. Write code examples in code/"
echo "  4. Create exercises in exercises/problems.md"
echo
echo -e "${GREEN}Happy lesson building!${NC}"
