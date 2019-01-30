CC = gcc
CCOPTS = -Wall -O3

LIBS = -lGL -lglut -lm -lGLU

all: robot subdivision

# le code fourni
robot : robot.o 
	$(CC) $(CCOPTS) -o $@ $^ $(LIBS)

subdivision : subdivision.o 
	$(CC) $(CCOPTS) -o $@ $^ $(LIBS)

clean:
	rm -f *.o robot subdivision

