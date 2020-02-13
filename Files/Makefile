CC = clang
CFLAGS = -c -Wall -Wextra -O0
AFLAGS = -c -S -Wall -Wextra -fno-verbose-asm
LFLAGS = -Wall -Wextra
DEPS = pow.h

all: main pow0.s pow1.s pow2.s pow3.s
clean:
	rm -f main *.o pow0.s pow1.s pow2.s pow3.s

main: main.o pow.o $(DEPS)
	${CC} ${LFLAGS} main.o pow.o -o main

main.o: main.c $(DEPS)
	${CC} ${CFLAGS} main.c -o main.o

pow.o: pow.c $(DEPS)
	${CC} ${CFLAGS} pow.c -o pow.o

pow0.s: pow.c $(DEPS)
	${CC} ${AFLAGS} -O0 pow.c -o pow0.s

pow1.s: pow.c $(DEPS)
	${CC} ${AFLAGS} -O1 pow.c -o pow1.s

pow2.s: pow.c $(DEPS)
	${CC} ${AFLAGS} -O2 pow.c -o pow2.s

pow3.s: pow.c $(DEPS)
	${CC} ${AFLAGS} -O3 pow.c -o pow3.s
