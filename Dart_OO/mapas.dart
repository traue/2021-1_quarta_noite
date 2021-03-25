class DadosVeiculo {
  String fabricante;
  String modelo;
  int ano;

  DadosVeiculo(this.fabricante, this.modelo, this.ano);
}

void main() {
  Map<String, int> objetos = Map();

  objetos["Celular"] = 2;
  objetos["Canetas"] = 10;
  objetos["Chaves"] = 30;

  print(objetos);

  Map<String, dynamic> funcionario = Map();

  funcionario["nome"] = "Chapolim Colorado";
  funcionario["idade"] = 40;
  funcionario["fumante"] = true;
  funcionario["dependentes"] = 8;
  funcionario["salario"] = 12.300;

  print(funcionario["salario"]);

  Map<String, DadosVeiculo> carros = Map();

  carros["ABC-123"] = DadosVeiculo("Fiat", "Uno", 1996);
  carros["ABC-124"] = DadosVeiculo("VW", "Passat", 2019);
  carros["ABC-125"] = DadosVeiculo("Audi", "A6", 2017);
  carros["ABC-126"] = DadosVeiculo("Mercedes", "C300", 2020);

  carros.forEach((k, v) => print("Placa: ${k}: ${v.fabricante} - ${v.modelo} - ${v.ano}"));
}
