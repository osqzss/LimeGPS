CC=gcc -O2 -Wall

all: limegps.c gpssim.c
	$(CC) -o LimeGPS limegps.c gpssim.c -lm -lpthread -lLimeSuite
	
