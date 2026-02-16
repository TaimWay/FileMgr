# Note: Run 'make init' command before building to initialize

# Project name
TARGET = FileMgr

# Source directory
SRC_DIR = src
RES_DIR = src

# Source files
CPP_SOURCES = $(SRC_DIR)/main.cpp $(SRC_DIR)/explorer.cpp
RC_SOURCE = $(RES_DIR)/resource.rc

# Output directories
OUT_DIR = target
DEBUG_DIR = $(OUT_DIR)/debug
RELEASE_DIR = $(OUT_DIR)/release

# Executable names
DEBUG_TARGET = $(DEBUG_DIR)/$(TARGET).exe
RELEASE_TARGET = $(RELEASE_DIR)/$(TARGET).exe

# Resource object files
DEBUG_RES_OBJ = $(DEBUG_DIR)/resource.o
RELEASE_RES_OBJ = $(RELEASE_DIR)/resource.o

# Common compilation options
COMMON_FLAGS = -std=c++17 -municode -mwindows
COMMON_LIBS = -lcomctl32 -lshell32 -lgdi32
COMMON_INCLUDES = -I$(SRC_DIR)

# Debug options
DEBUG_FLAGS = -g -O0 -D_DEBUG
DEBUG_LDFLAGS =

# Release options
RELEASE_FLAGS = -O3 -s -flto -DNDEBUG
RELEASE_LDFLAGS = -Wl,--gc-sections -flto

# Default target
.PHONY: help
help:
	@printf "Makefile for $(TARGET)\n\n"
	@printf "Usage:\n"
	@printf "  make init\t\t\t\t\tCreate output directories (debug and release)\n"
	@printf "  make build.debug or make debug\t\tBuild debug version (output: $(DEBUG_TARGET))\n"
	@printf "  make build.release or make release\t\tBuild release version (output: $(RELEASE_TARGET))\n"
	@printf "  make run.debug\t\t\t\tRun debug version\n"
	@printf "  make run.release\t\t\t\tRun release version\n"
	@printf "  make clear\t\t\t\t\tClean all build artifacts\n"
	@printf "  make help\t\t\t\t\tDisplay this help message\n\n"
	@printf "Tip: Run 'make init' first if it's your first time or after 'make clear'\n"

# Create output directories
.PHONY: init
init:
	@echo "Creating output directories..."
	@mkdir -p $(DEBUG_DIR) $(RELEASE_DIR)

# Rule for compiling resource files (pattern rule)
$(DEBUG_DIR)/%.o: $(RES_DIR)/%.rc
	@echo "Compiling resource file (debug mode): $< -> $@"
	windres $< -O coff -o $@

$(RELEASE_DIR)/%.o: $(RES_DIR)/%.rc
	@echo "Compiling resource file (release mode): $< -> $@"
	windres $< -O coff -o $@

# Compile main program and link (debug)
$(DEBUG_TARGET): $(DEBUG_RES_OBJ) $(CPP_SOURCES)
	@echo "Linking debug executable: $@"
	g++ $(COMMON_FLAGS) $(DEBUG_FLAGS) $(COMMON_INCLUDES) \
		$(CPP_SOURCES) $(DEBUG_RES_OBJ) \
		-o $@ $(COMMON_LIBS) $(DEBUG_LDFLAGS)
	@echo "Debug build completed: $@"

# Compile main program and link (release)
$(RELEASE_TARGET): $(RELEASE_RES_OBJ) $(CPP_SOURCES)
	@echo "Linking release executable: $@"
	g++ $(COMMON_FLAGS) $(RELEASE_FLAGS) $(COMMON_INCLUDES) \
		$(CPP_SOURCES) $(RELEASE_RES_OBJ) \
		-o $@ $(COMMON_LIBS) $(RELEASE_LDFLAGS)
	@echo "Release build completed: $@"

# Convenience targets
.PHONY: debug
debug: init $(DEBUG_TARGET)

.PHONY: release
release: init $(RELEASE_TARGET)

# Compatibility with old names
.PHONY: build.debug build.release
build.debug: debug
build.release: release

# Run targets
.PHONY: run.debug
run.debug: debug
	@echo "Running debug version..."
	$(DEBUG_TARGET)

.PHONY: run.release
run.release: release
	@echo "Running release version..."
	$(RELEASE_TARGET)

# Clean
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(OUT_DIR)
	@echo "Clean completed."

# Prevent conflicts with files of the same name
.PHONY: init debug release build.debug build.release run.debug run.release clean help