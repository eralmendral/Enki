# Makefile for WALL-E Module 1, Lesson 1
# Binary and Number Systems

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -pedantic -O2
TARGET = binary_operations

# Source files
SRCS = binary_operations.cpp
OBJS = $(SRCS:.cpp=.o)

# Default target
all: $(TARGET)
	@echo "Build complete! Run with: ./$(TARGET)"

# Build the executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Compile source files to object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	rm -f $(TARGET) $(OBJS)
	@echo "Clean complete"

# Run the program
run: $(TARGET)
	./$(TARGET)

# Rebuild from scratch
rebuild: clean all

# Help message
help:
	@echo "WALL-E Lesson 1 - Binary Operations Makefile"
	@echo "Available targets:"
	@echo "  make        - Build the binary_operations program"
	@echo "  make run    - Build and run the program"
	@echo "  make clean  - Remove build artifacts"
	@echo "  make rebuild- Clean and rebuild"
	@echo "  make help   - Show this help message"

.PHONY: all clean run rebuild help
