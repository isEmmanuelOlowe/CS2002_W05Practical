long power(long a, int b) {
  long total = 1;

  while (b != 0) {
    while (b > 8) {
      total *= a;
      total *= a;
      total *= a;
      total *= a;
      total *= a;
      total *= a;
      total *= a;
      total *= a;
      b -= 8;
    }
    total *= a;
    b--;
  }
  return total;
}
