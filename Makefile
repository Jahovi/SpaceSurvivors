PROJECT_NAME = SpaceSurvivors

INCLUDE_DIR = external/raylib/include
CC = clang
CFLAGS = -I$(INCLUDE_DIR)

BIN_DIR = build/bin
OBJ_DIR = build/obj
EXT_DIR = external
SOURCE_DIR = src

_LIBS = raylib/libraylib.a
LIBS = $(patsubst %, $(EXT_DIR)/%, $(_LIBS))

_OBJ = main.o
OBJ = $(patsubst %, $(OBJ_DIR)/%, $(_OBJ))

OSX_OPTIONS = -framework CoreVideo -framework IOKit -framework Cocoa -framework GLUT -framework OpenGL

$(OBJ_DIR)/%.o: $(SOURCE_DIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

build: $(OBJ)
	$(CC) -o $(BIN_DIR)/$(PROJECT_NAME) $^ $(CFLAGS) $(LIBS) $(OSX_OPTIONS)

.PHONY: clean
clean:
	rm $(BIN_DIR)/*.exe $(OBJ_DIR)/*.o