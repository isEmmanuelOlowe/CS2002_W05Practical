#include <stdio.h>
#include "pow.h"

void test_power(long a, int b) {
	long c = power(a, b);
	printf("%ld to the power %d is %ld\n", a, b, c);
}

int main(void) {
	test_power(13, 0);
	test_power(1234, 1);
	test_power(7, 8);
	test_power(3, 21);
}
