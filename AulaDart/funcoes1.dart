void main() {
  double a = 7;
  double b = 10;
  calculaMedia(a, b);

  //print(retornoMedia(a, b));

//   if(retornoMedia(a, b) > 6) {
//     print("Aprovado");
//   }else {
//     print("reprovado");
//   }

  print((retornoMedia(a, b) > 6) ? "Aprovado" : "Reprovado");
  print(falaNome());
}

void calculaMedia(double v1, double v2) {
  double media = (v1 + v2) / 2;
  print(media);
}

double retornoMedia(double v1, double v2) {
  return((v1 + v2) / 2);
  //return media;
}

String falaNome() {
  return "Fulano";
}
