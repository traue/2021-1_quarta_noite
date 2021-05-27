import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(17.0, 1.0, 17.0, 1.0),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              maxLength: 50,
              decoration: InputDecoration(labelText: "Nova tarefa"),
            )),
            Container(
              height: 45.0,
              width: 45.0,
              child: FloatingActionButton(
                child: Icon(Icons.save),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
