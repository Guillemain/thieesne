CC = gcc
CFLAGS = -Wall -O3
UNAME_S := $(shell uname -s)
$(info    UNAME_S is $(UNAME_S))

ifeq ($(UNAME_S),Darwin)
CFLAGS += -Wno-deprecated-declarations
LIBS := -framework OpenGL -lglut -lm
else
LIBS := -lglut -lGLU -lGL -lstdc++ -lm
endif


all: robot subdivision

# le code fourni
robot : robot.o
	$(CC) -o $@ $^ $(LIBS)

subdivision : subdivision.o
	$(CC) -o $@ $^ $(LIBS)

clean:
	rm -f *.o robot subdivision

