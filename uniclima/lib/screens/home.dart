import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:http/http.dart' as http;
import 'package:uniclima/model/clima_model.dart';
import 'package:uniclima/widgets/clima_widget.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isLoading = false;
  ClimaData climaData;

  List<String> _cidades = [
    'Aracaju',
    'Belém',
    'Belo Horizonte',
    'Boa Vista',
    'Brasilia',
    'Campo Grande',
    'Cuiaba',
    'Curitiba',
    'Florianópolis',
    'Fortaleza',
    'Goiânia',
    'João Pessoa',
    'Macapá',
    'Maceió',
    'Manaus',
    'Natal',
    'Palmas',
    'Porto Alegre',
    'Porto Velho',
    'Recife',
    'Rio Branco',
    'Rio de Janeiro',
    'Salvador',
    'São Luiz',
    'São Paulo',
    'Teresina',
    'Vitoria'
  ];

  String _cidadeSelecionada = "São Paulo";

  @override
  void initState() {
    super.initState();
    carregaTempo();
  }

  carregaTempo() async {
    setState(() {
      isLoading = true;
    });

    final String _appid = ''; //Coloque aqui SUA chave de API
    final String _lang = 'pt_br';
    final String _units = 'metric';
    final _apiUrl = 'api.openweathermap.org';
    final _path = '/data/2.5/weather';
    final _params = {
      "q": _cidadeSelecionada,
      "appid" : _appid,
      "units" : _units,
      "lang" : _lang
    };

    final climaResponse = await http.get(Uri.https(_apiUrl, _path, _params));

    print('Url montada: ' + climaResponse.request.url.toString());

    if(climaResponse.statusCode == 200) {
      return setState(() {
        isLoading = false;
        climaData = ClimaData.fromJson(jsonDecode(climaResponse.body));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_cidadeSelecionada),
        centerTitle: true,
      ),
      body: Center(
        child: Column(  
          children: [
            SearchableDropdown.single(
              items: _cidades
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _cidadeSelecionada = value;
                  carregaTempo();
                });
              },
              displayClearIcon: false,
              value: _cidadeSelecionada,
              icon: Icon(Icons.location_on),
              isExpanded: true,
              closeButton: "Fechar",
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(6.0),
                    child: isLoading
                        ? CircularProgressIndicator(
                            strokeWidth: 6.0,
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                          )
                        : climaData != null
                      ? ClimaWidget(dadosClimaticos: climaData)
                      : Container(
                      child: Text(
                        'Sem dados para exibir',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
