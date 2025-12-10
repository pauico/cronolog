# Define the compiler and tools used in the MinGW environment
CC = gcc

# Windows Native Commands for Cleanup and Setup
DEL = del /Q
RMDIR = rmdir /S /Q

# --- Configuration ---
# Include paths for external headers: one for the wrapper and one for the external library
CFLAGS = -O2 -Ilib -Iexternals/LibOb_strptime/src
LDFLAGS = -D_WIN32
LIBS = -lws2_32
#-lws2_32: This links the Winsock 2.0 32-bit library

# Define output file paths
TARGET = bin/cronolog.exe

# Define source files (C files) with their new, correct paths
SRCS = src/cronolog.c \
       src/cronoutils.c \
       lib/strptime.c \
       externals/LibOb_strptime/src/LibOb_strptime.c 

# Automatically generate a list of object files (.o) in the 'obj' directory.
# This uses multiple substitutions to map complex paths to simple object file names.
OBJS = $(patsubst src/%.c, obj/%.o, $(patsubst lib/%.c, obj/%.o, $(patsubst externals/LibOb_strptime/src/%.c, obj/%.o, $(SRCS))))
# Resulting OBJS: obj/cronolog.o obj/cronoutils.o obj/strptime.o obj/LibOb_strptime.o

# --- Rules ---

all: directories $(TARGET)

directories:
	@echo "Ensuring build directories exist..."
	@if not exist bin mkdir bin
	@if not exist obj mkdir obj

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

# Pattern Rule 3: For source files located in 'externals/LibOb_strptime/src/'
obj/%.o: externals/LibOb_strptime/src/%.c
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@

# Clean target: uses native Windows commands
clean:
	@echo "Cleaning up build files..."
	-$(DEL) $(subst /,\,$(TARGET)) $(subst /,\,$(OBJS))
	-$(RMDIR) bin obj
	
.PHONY: all clean directories