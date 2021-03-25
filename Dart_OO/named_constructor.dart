class Aluno extends Pessoa {
  int ra;

  Aluno(this.ra, nome, email) : super(nome, email);

  Aluno.matricular(nome, email) : super(nome, email) {
    print("Seja bem-vindo(a) $nome");
  }
}

class Professor extends Pessoa {
  int matricula;

  Professor(this.matricula, nome, email) : super(nome, email);

}

class Pessoa {
  String nome;
  String email;

  Pessoa(this.nome, this.email);
}

void main() {
  Aluno a1 = Aluno.matricular("Gustavo", "gustavinho@hotmail.com");
  print(a1.nome);
}
