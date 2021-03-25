void main() {
  print(ePar(25));
  print(ePar2(31));
  imprimeNome("Yuri");
  print(calculaArea(3, 8));
}

bool ePar(int numero) {
  return (numero % 2 == 0) ? true : false;
}

bool ePar2(int numero) => (numero % 2 == 0);

int calculaArea(int base, int altura) => base * altura;

void imprimeNome(String nome) => print("Olá $nome");
