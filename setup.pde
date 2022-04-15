void setup() { //<>//
  test();
}

void test() {
  // Constructeur et accesseurs
  GrandNaturel n1 = new GrandNaturel(102);
  assert n1.nbChiffres() == 3;
  assert n1.chiffre(0) == 2;
  assert n1.chiffre(1) == 0;
  assert n1.chiffre(2) == 1;
  // si la position n'est pas valide, le chiffre est considéré comme zéro
  assert n1.chiffre(3) == 0;
  assert n1.chiffre(-1) == 0;
  println("constructeur et accesseurs ok");

  // À compléter avec des tests pour les autres méthodes
  assert n1.toString().equals("102");

  GrandNaturel n2 = new GrandNaturel(102);
  assert n1.egal(n2);

  GrandNaturel n3 = new GrandNaturel(103);
  assert n1.inf(n3);
  assert n3.sup(n1);

  GrandNaturel a = new GrandNaturel(759);
  GrandNaturel b = a.plus(12043);
  assert n1.plus(102).egal(new GrandNaturel(102 + 102));
  assert n1.plus(789000).egal(new GrandNaturel(102 + 789000));

  GrandNaturel c = new GrandNaturel(759);
  assert c.mult(2).egal(new GrandNaturel(1518));
  assert c.mult(new GrandNaturel(1518)).egal(new GrandNaturel(1165824));

  GrandNaturel n15 = new GrandNaturel(15);
  GrandNaturel n16 = n15.plus(1);
  assert n15.fact().toString().equals("1307674368000");
  assert n16.fact().egal(n15.fact().mult(n16));
  
  assert fibo(10).toString().equals("55");
  assert fibo(100).toString().equals("354224848179261915075");
}
