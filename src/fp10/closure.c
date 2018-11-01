/* Closure implementation in C */

#include <stdio.h>

typedef int (*IntInt_IntInt_Int)(int, int, int, int);
typedef IntInt_IntInt_Int Implementation;

// { Args: (Int, Int), FreeVars: (Int, Int) } -> Int
typedef struct Closure_IntInt_IntInt_Int {
  Implementation implementation;
  int fv1; int fv2;
} Closure;

int apply_IntInt_IntInt_Int(Closure *c, int v1, int v2) {
  return c->implementation(v1, v2, c->fv1, c->fv2);
}

int f_implementation(int x, int y, int a, int b) { return a * x + b * y; }

int main() {
  const int a = 3, b = 4;
  Closure closure_f = { f_implementation, a, b };
  printf("C-style: %d\n", apply_IntInt_IntInt_Int(&closure_f, 5, 6));
}
