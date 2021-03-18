void main() {
  criaBotao(
    "Cadastrar",
    //cor: "Rosa"
    //largura: 10
    //altura: 20
    () {
      print("Olá mundo");
    }
  );

  criaBotao(
    "Cadastrar",
    //cor: "Rosa"
    //largura: 10
    //altura: 20
    acaoClick
  );
}

void criaBotao(String texto, Function funcao, {String? cor, double? largura, double? altura}) {
  print(texto);
  print(cor ?? "Verde");
  print(largura ?? 10.0);
  print(altura ?? 5.0);
  funcao();
}


void acaoClick() {
  print("Fui clicada");
}
