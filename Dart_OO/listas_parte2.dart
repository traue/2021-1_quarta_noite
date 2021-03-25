class Aluno {
  //Atributos
  int ra;
  String nome;

  //Construtor
  Aluno(this.nome, this.ra);
}

void main() {
  List<Aluno> alunos = [];

  alunos.add(Aluno("Paulo", 123));
  alunos.add(Aluno("Thiago", 321));
  alunos.add(Aluno("Gustavo", 111));
  alunos.add(Aluno("Esdras", 456));

  //foreach em Dart
  //para cada aluno "a" dentro da lista de "alunos", faça
  for(Aluno a in alunos) {
    print(a.nome + " - RA: ${a.ra}");
  }
}
