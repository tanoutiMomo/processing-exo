  GrandNaturel fibo(int N) {
    GrandNaturel num1 = new GrandNaturel(0);
    GrandNaturel num2 = new GrandNaturel(1);
    GrandNaturel num3 = new GrandNaturel(0);
    int counter = 1;

    // Iterate till counter is N
    while (counter < N) {
      // Swap
      num3 = num2.plus(num1);
      num1 = num2;
      num2 = num3;
      counter++;
    }
    return num3;
  }
