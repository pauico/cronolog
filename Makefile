# Define the compiler and tools used in the MinGW environment
CC = gcc

# Windows Native Commands for Cleanup and Setup
DEL = del /Q
RMDIR = rmdir /S /Q

# Define flags and libraries from your successful command
CFLAGS = -O2 -Ilib
LDFLAGS = -D_WIN32
LIBS = -lws2_32

# Define output file paths
TARGET = bin/cronolog.exe

# Define source files (C files)
# Note: The paths for LibOb_strptime.c are now correctly specified from the root
SRCS = src/cronolog.c \
       src/cronoutils.c \
       lib/LibOb_strptime.c \
       src/strptime.c

# Automatically generate a list of object files (.o) in the 'obj' directory
# The substitution must convert 'lib/' back to 'src/' so the patsubst works with the pattern rules
OBJS = $(patsubst src/%.c, obj/%.o, $(patsubst lib/%.c, obj/%.o, $(SRCS)))
# OBJS = obj/cronolog.o obj/cronoutils.o obj/LibOb_strptime.o obj/strptime.o

# --- Rules ---

all: directories $(TARGET)

directories:
	@echo "Ensuring build directories exist..."
	@if not exist bin mkdir bin
	@if not exist obj mkdir obj
	@if not exist lib mkdir lib

# Final Linking Step:
$(TARGET): $(OBJS)
	@echo "Linking $(TARGET)..."
	$(CC) $(CFLAGS) $^ $(LDFLAGS) $(LIBS) -o $@

# Pattern Rule 1: For source files located in 'src/'
obj/%.o: src/%.c
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@

# Pattern Rule 2: For source files located in 'lib/'
obj/%.o: lib/%.c
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@

# Clean target: uses native Windows commands
clean:
	@echo "Cleaning up build files..."
	-$(DEL) $(subst /,\,$(TARGET)) $(subst /,\,$(OBJS))
	-$(RMDIR) bin obj
	
.PHONY: all clean directories