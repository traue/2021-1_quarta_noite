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
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Valor do Álcool",
                  labelStyle: TextStyle(color: Colors.lightBlue[900])),
              style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
            ),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Valor do Gasolina",
                  labelStyle: TextStyle(color: Colors.lightBlue[900])),
              style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
            ),
            //PARAMOS AQUI... FALTA O BOTÃO E A LÓGICA
          ],
        ),
      ),
    );
  }
}
