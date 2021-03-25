class Fruta {
  String nome;
  bool madura;

  Fruta(this.nome, this.madura);
}

void main() {
  List<Fruta> frutas = [];

  frutas.add(Fruta("Banana", true));
  frutas.add(Fruta("Mamão", false));
  frutas.add(Fruta("Laranja", false));
  frutas.add(Fruta("Abacate", true));
  frutas.add(Fruta("Carambola", true));
  frutas.add(Fruta("Abacaxi", true));

  //foreach:
  print("Usando o foreach...:");
  for(Fruta fru in frutas) {
    print(fru.madura
         ? "Já pode comer ${fru.nome}"
         : "Ainda não pode comer ${fru.nome}"
    );
  }


  //----usando o for....
  print("Usando o for...:");
  for(int i = 0; i < frutas.length; i++) {
        print(frutas[i].madura
         ? "Já pode comer ${frutas[i].nome}"
         : "Ainda não pode comer ${frutas[i].nome}"
    );
  }

  //usando o "while"...
  print("Usando o while: ");
  int j = 0;
  while (j < frutas.length) {
    print(frutas[j].madura
        ? "Já pode comer ${frutas[j].nome} "
        : "Não pode comer ainda ${frutas[j].nome}");
    j++;;
  }

  //do.. while (faça, enquanto)
  print("Usando o do..while, impriminto a lista ao contrário: ");
  int k = frutas.length -1;
  do {
    print(frutas[k].madura
        ? "Já pode comer ${frutas[k].nome} "
        : "Não pode comer ainda ${frutas[k].nome}");
    k--;
  } while (k >= 0);
}
