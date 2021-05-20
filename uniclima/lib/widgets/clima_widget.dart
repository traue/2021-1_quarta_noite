import 'package:flutter/material.dart';
import 'package:uniclima/model/clima_model.dart';

class ClimaWidget extends StatelessWidget {

  final ClimaData dadosClimaticos;

  const ClimaWidget({Key key, @required this.dadosClimaticos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https://openweathermap.org/img/wn/${dadosClimaticos.icone}@2x.png',
          fit: BoxFit.fill,
          width: 100.0,
        ),
        Text(
          '${dadosClimaticos.temp.toStringAsFixed(0)} ºC',
          style: TextStyle(fontSize: 50.0),
        ),
        Text(
          dadosClimaticos.descTemp,
          style: TextStyle(fontSize: 30.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Temperatura mínima: ${dadosClimaticos.tempMin.toStringAsFixed(0)} ºC',
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        Text(
          'Temperatura máxima: ${dadosClimaticos.tempMax.toStringAsFixed(0)} ºC',
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        Text(
          'Umidade: ${dadosClimaticos.umidade.toString()} %',
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
