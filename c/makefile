CC=gcc
RM=rm -f

# CPPFLAGS=-g $(shell root-config --cflags)
# LDFLAGS=-g $(shell root-config --ldflags)
# LDLIBS=$(shell root-config --libs)

SRCS=$(main.c)
OBJS=$(subst .c,.o,$(SRCS))

all: dice

dice: $(OBJS)
	$(CC) -o dice $(OBJS)

dice.o: main.c

clean: 
	$(RM) $(OBJS)

distclean: clean
	$(RM) dice