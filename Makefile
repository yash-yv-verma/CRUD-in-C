CC = gcc
CFLAGS = -Wall -Wextra

# The target executable
TARGET = assign3

# Source files
SRCS = assign3.c

# Header files
HDRS = assign3.h

# Rule to build the executable
$(TARGET): $(SRCS) $(HDRS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET)

# Clean rule
clean:
	rm -f $(TARGET)
