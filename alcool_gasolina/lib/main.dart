import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _resultado = "Informe os valores";
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  //falta:fazer a valifação do formulário usando o _formkey

  void _calculaCombustivelIdeal() {
    setState(() {
      double vAlcool = double.parse(alcoolController.text.replaceAll(',', '.'));
      double vGasolina = double.parse(gasolinaController.text.replaceAll(',', '.'));

      double proporcao = vAlcool / vGasolina;

      _resultado = (proporcao < 0.7) ? "Abasteça com Álcool" : "Abasteça com Gasolina";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Álcool ou Gasolina?", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.local_gas_station,
              size: 150.0,
              color: Colors.lightBlue[900],
            ),
            TextFormField(
              controller: alcoolController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Valor do Álcool",
                  labelStyle: TextStyle(color: Colors.lightBlue[900])),
              style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
            ),
            TextFormField(
              controller: gasolinaController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Valor do Gasolina",
                  labelStyle: TextStyle(color: Colors.lightBlue[900])),
              style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    _calculaCombustivelIdeal();
                  },
                  child: Text('Verificar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue[900],
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
            )
          ],
        ),
      ),
    );
  }
}
