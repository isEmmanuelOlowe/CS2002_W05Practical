long power(long a, int b) {
  long total = 1;
  while (b != 0) {
    total = total * a;
    b--;
  }
  return total;
}
