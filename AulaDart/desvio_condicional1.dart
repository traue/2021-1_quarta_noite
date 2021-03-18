void main() {
  //variáveis
  double nota_av1 = 9.2;
  double nota_av2 = 10;
  double media = (0.6 * nota_av1) + (0.4 * nota_av2);
  bool aprovado;

  //Se a nota for maior ou igual a 6, passou!
  //Se for menor, não passou
  //Se for 10, passou e mandar uma carinnha feliz!
  if(media < 6) {
    aprovado = false;
    print("Sua nota foi: $media, infelizmente não passou... =(");
  } else if (media != 10) { //é maior que 6, mas não é 10...
    aprovado = true;
    print("Sua nota foi: $media, portanto está Aprovado!");
  } else { //a nota é igual a 10...
    aprovado = true;
    print("Média 10!!! Passou!!! Top!!! :D");
  }

  //--------Outra forma de fazer...---------
//   if(aprovado) {
//     print("Aprovado");
//   } else {
//     print("Reprovado");
//   }
  //Reescrevendo If anterior
  String resultado = aprovado ? "Aprovado" : "Reprovado";
  print(resultado);
}
