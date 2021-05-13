class ClimaData {
  final double temp;
  final double tempMax;
  final double tempMin;
  final String descTemp;
  final String icone;
  final int umidade;

  ClimaData(
      {this.temp,
      this.tempMax,
      this.tempMin,
      this.descTemp,
      this.icone,
      this.umidade});

  factory ClimaData.fromJson(Map<String, dynamic> json) {

    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
    
    return ClimaData(
      temp: json['main']['tempo'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      descTemp: capitalize(json['weather'][0]['description']),
      icone: (json['weather'][0]['icon']),
      umidade: json['main']['humidity'].toInt()
    );
  }
}
