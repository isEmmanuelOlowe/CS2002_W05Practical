CC = clang
CFLAGS = -c -Wall -Wextra -O0
AFLAGS = -c -S -Wall -Wextra -fno-verbose-asm
LFLAGS = -Wall -Wextra
DEPS = pow.h

all: main main-iter1 main-iter2 pow0.s pow1.s pow2.s pow3.s pow-iter1.s
clean:
	rm -f main main-iter1 main-iter2 *.o pow0.s pow1.s pow2.s pow3.s pow-iter1.s

main: main.o pow.o $(DEPS)
	${CC} ${LFLAGS} main.o pow.o -o main

main-iter1: main.o pow-iter1.o $(DEPS)
	${CC} ${LFLAGS} main.o pow-iter1.o -o main-iter1

main-iter2: main.o pow-iter2.o $(DEPS)
	${CC} ${LFLAGS} main.o pow-iter2.o -o main-iter2

main.o: main.c $(DEPS)
	${CC} ${CFLAGS} main.c -o main.o

pow.o: pow.c $(DEPS)
	${CC} ${CFLAGS} pow.c -o pow.o

pow-iter1.o: pow-iter1.c $(DEPS)
	${CC} ${CFLAGS} pow-iter1.c -o pow-iter1.o

pow-iter2.o: pow-iter2.c $(DEPS)
	${CC} ${CFLAGS} pow-iter2.c -o pow-iter2.o

pow0.s: pow.c $(DEPS)
	${CC} ${AFLAGS} -O0 pow.c -o pow0.s

pow1.s: pow.c $(DEPS)
	${CC} ${AFLAGS} -O1 pow.c -o pow1.s

pow2.s: pow.c $(DEPS)
	${CC} ${AFLAGS} -O2 pow.c -o pow2.s

pow3.s: pow.c $(DEPS)
	${CC} ${AFLAGS} -O3 pow.c -o pow3.s

pow-iter1.s: pow-iter1.c $(DEPS)
	${CC} ${AFLAGS} -O1 pow-iter1.c -o pow-iter1.s
