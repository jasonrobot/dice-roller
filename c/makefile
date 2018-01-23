CC=gcc
RM=rm -f

# CPPFLAGS=-g $(shell root-config --cflags)
# LDFLAGS=-g $(shell root-config --ldflags)
# LDLIBS=$(shell root-config --libs)

SRC_DIR := src
OBJ_DIR := obj
INC_FILES := $(wildcard $(SRC_DIR)/*.h)
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))
# $LDFLAGS := ...
# $CFLAGS := ...

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) -c -o $@ $<

dice: $(OBJ_FILES)
	$(CC) $(LDFLAGS) -o $@ $(OBJ_FILES)

test: $(OBJ_FILES)
	@echo $@
	@echo $^
	@echo $(SRC_DIR)
	@echo $(SRC_FILES)
	@echo $(wildcard $(SRC_DIR)/*.c)
	@echo $(OBJ_DIR)
	@echo $(OBJ_FILES)

clean: 
	$(RM) $(OBJ_FILES)

cleanall: clean
	$(RM) dice