import java.util.Arrays; //<>// //<>//

class GrandNaturel {
  int[] chiffres; // chifres décimaux du moins au plus significatif

  
  GrandNaturel(int[] chiffres) {
    this.chiffres = chiffres.clone();
  }
  
  GrandNaturel(GrandNaturel gn) {
      this(gn.chiffres);
  }
  // Crée un grand naturel égal à c
  GrandNaturel(int c) {
    // on s'assure que c est positif
  assert c >= 0 :
    "on ne représente que les nombres positifs";
    // on commence par calculer le nombre de chiffres
    int nbChiffres = 0;
    for (int c1 = c; c1 > 0; c1 /= 10) {
      nbChiffres++;
    }
    // on crée un tableau de la taille nécessaire
    chiffres = new int[nbChiffres];
    // et on le rmplit
    for (int i = 0; i < nbChiffres; i++) {
      chiffres[i] = c % 10;
      c /= 10;
    }
  }

  public int nbChiffres() {
    return chiffres.length;
  }

  public int chiffre(int i) {
    if (i >= chiffres.length || i < 0)
      return 0;
    return chiffres[i];
  }

  boolean egal(GrandNaturel n) {
    Object[] arr1 = {n.chiffres};
    Object[] arr2 = {chiffres};
    return Arrays.deepEquals(arr1, arr2);
  }

  boolean sup(GrandNaturel n) {
    boolean result = false;
    if (this.egal(n)) return false;
    if (n.nbChiffres() == chiffres.length) {
      for (int i = chiffres.length-1; i>= 0; i--) {
        if (n.chiffres[i] == chiffres[i]) {
          continue;
        } else if (n.chiffres[i] < chiffres[i]) {
          result = true;
          break;
        } else {
          result= false;
          break;
        }
      }
    } else if (n.nbChiffres() > chiffres.length) {
      return false;
    } else {
      return true;
    }
    return result;
  }

  boolean inf(GrandNaturel n) {
    boolean result = false;
    if (this.egal(n)) return false;
    if (n.nbChiffres() == chiffres.length) {
      for (int i = chiffres.length-1; i>= 0; i--) {
        if (n.chiffres[i] == chiffres[i]) {
          continue;
        } else if (n.chiffres[i] < chiffres[i]) {
          result = false;
          break;
        } else {
          result = true;
          break;
        }
      }
    } else if (n.nbChiffres() > chiffres.length) {
      return true;
    } else {
      return true;
    }
    return result;
  }

  void normaliser() {
    int retenue = 0;
    // on sépare chaque chifre en dizaines et unités et on distribue
    // les dizaines vers le chiffre suivant
    for (int i = 0; i < chiffres.length; i++) {
      chiffres[i] += retenue;
      retenue = chiffres[i] / 10;
      chiffres[i] %= 10;
    }
    // s'il restre quelque chose à la fin, on l'ajoute
    if (retenue > 0) {
      GrandNaturel r = new GrandNaturel(retenue);
      chiffres = concat(chiffres, r.chiffres);
    }
  }
  String toString() {
    String result = "";
    for (int i = chiffres.length-1; i>=0; i--) {
      result += String.valueOf(chiffres[i]) ;
    }
    return result;
  }
  
  GrandNaturel plus(int c) {
  assert c > 0 : "c ne peut pas être négatif"; 
  GrandNaturel resultat = new GrandNaturel(this);
  resultat.chiffres[0] += c;
  resultat.normaliser();
  return resultat;
}

  GrandNaturel plus(GrandNaturel c) {
    GrandNaturel resultat = new GrandNaturel(this);
    GrandNaturel toAdd = new GrandNaturel(c);
    if (toAdd.nbChiffres() > resultat.nbChiffres()) {
      for (int i = 0; i< resultat.chiffres.length; i++) {
        toAdd.chiffres[i] += resultat.chiffres[i];
      }
      toAdd.normaliser();
      return toAdd;
    } else {
      for (int i = 0; i< toAdd.chiffres.length; i++) {
        resultat.chiffres[i] += toAdd.chiffres[i];
      }
      resultat.normaliser();
      return resultat;
    }
  }

  GrandNaturel mult(int n) {
  assert n >= 0 :
    "c ne peut pas être négatif";
    GrandNaturel resultat = new GrandNaturel(this);
    for (int i = 0; i< resultat.chiffres.length; i++) {
      resultat.chiffres[i] *= n ;
    }
    resultat.normaliser();
    return resultat;
  }

  GrandNaturel mult (GrandNaturel n) {
    //GrandNaturel result = new GrandNaturel(this);
    GrandNaturel resultA = new GrandNaturel(this);
    int resultB = 0;
    for (int i = 0; i < chiffres.length; i++) {
      resultA = resultA.plus(powerOf(10, i).mult(chiffres[i]));
    }
    for (int j = 0; j < n.chiffres.length; j++) {
      resultB += n.chiffres[j] * Math.pow(10, j);
    }
    return new GrandNaturel(resultA).mult(resultB); //<>//
  }
  
  GrandNaturel powerOf(int n , int i) {
    if (i == 0) { return new GrandNaturel(1) ; }
    int k = 0;
    GrandNaturel res = new GrandNaturel(n);
    while(k< i) {
      res = res.mult(k);
      k++;
    }
    return res;
  }

  GrandNaturel fact() {
    GrandNaturel chiffre = new GrandNaturel(this);
    GrandNaturel result = new GrandNaturel(1);
    for (int i = 1; i <= Integer.valueOf(chiffre.toString()); i++) {
      result = result.mult(i);
    }
    return result;
  }
}
