OPT=
DEFS=
CFLAGS=-fopenmp -mavx2

all: matrix_multiply.out

matrix_multiply.out: main.o
	gcc $(CFLAGS) -o matrix_multiply.out main.o

main.o: main.c
	gcc -c $(CFLAGS) $(OPT) $(DEFS) -o main.o main.c
	gcc -S -fverbose-asm $(CFLAGS) $(OPT) $(DEFS) -o main.s main.c

clean:
	rm -f matrix_multiply.out main.o main.s
