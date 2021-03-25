class Pessoa {

  //atributos da pessoa:
  String nome;
  String _email;
  int _idade;

//   Pessoa(String nome, String email, int idade) {
//     this.nome = nome;
//     this.email = email;
//     this.idade = idade;
//   }

  Pessoa(this.nome, this._email, this._idade);

  int get idade => _idade;
  String get email => _email;

  set idade(int idade) {
    if(idade > 0 && idade < 150) {
      _idade = idade;
    }
  }

  //métodos
  void fazerAniversaio() {
    _idade++; //mesma coisa que idade = idade + 1;
    print("Ôba, festinha!! :D");
  }

  String falarEmail() {
    return("Meu e-mail é $email");
  }

  void comer(String comida) {
    print("hmmm, adordo comer $comida");
  }

}

void main() {
  Pessoa p1 = Pessoa(
    'Thiago G. Traue',
    'thiago.traue@uni9.pro.br',
    33
  );



  print("Idade de p1: ${p1.idade}");
  p1.fazerAniversaio();
  print("Idade de p1: ${p1.idade}");
  print(p1.falarEmail());
  p1.comer("Chocolate");
  print(p1.idade);
  p1.idade = 30;
  print(p1.idade);
  p1.idade = 300;
  print(p1.idade);
}
