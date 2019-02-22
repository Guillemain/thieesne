CC = gcc
CFLAGS = -Wall -O3

UNAME_S := $(shell uname -s)
$(info    UNAME_S is $(UNAME_S))

ifeq ($(UNAME_S),Darwin)
CFLAGS += -Wno-deprecated-declarations
LIBS := -framework OpenGL -lglut -lm
else
LIBS := -lglut -lGLU -lGL -lm
endif

all: texture lumiere textureDemo

solutions: texturesolution lumieresolution 

# solutions
lumieresolution: lumieresolution.o pnm_io.o
	$(CC) -o $@ $^ $(LIBS)

texturesolution: texturesolution.o pnm_io.o
	$(CC)  -o $@ $^ $(LIBS)

# le code fourni
lumiere : lumiere.o pnm_io.o
	$(CC) -o $@ $^ $(LIBS)

texture : texture.o  pnm_io.o
	$(CC) -o $@ $^ $(LIBS)

textureDemo : textureDemo.o pnm_io.o
	$(CC) -o $@ $^ $(LIBS)

clean:
	rm -f *.o texturesolution lumieresolution lumiere texture textureDemo

