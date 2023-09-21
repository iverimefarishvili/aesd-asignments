# Compiler and compiler flags
CC = gcc
CFLAGS = -Wall

# Target name
TARGET = writer

# Source files
SRCS = $(TARGET).c

# Object files
OBJS = $(SRCS:.c=.o)

# Default target: Build the "writer" application
all: $(TARGET)

# Build the "writer" application
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)

# Clean target: Remove the "writer" application and all .o files
clean:
	rm -f $(TARGET) $(OBJS)

# Support for cross-compilation
ifdef CROSS_COMPILE
	CC := $(CROSS_COMPILE)$(CC)
endif
