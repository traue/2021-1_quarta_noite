import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _todoList = [];
  final _todoController = TextEditingController();
  int _indiceUltimoRemovido;
  Map<String, dynamic> _ultimoRemovido;

  @override
  void initState() {
    super.initState();
    _lerDados().then((value) {
      setState(() {
        _todoList = json.decode(value);
      });
    });
  }

  Future<File> _abreArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/todoList.json");
  }

  Future<String> _lerDados() async {
    try {
      final arquivo = await _abreArquivo();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> _salvarDados() async {
    String dados = json.encode(_todoList);
    final arquivo = await _abreArquivo();
    return arquivo.writeAsString(dados);
  }

  void _adicionaTarefa() {
    setState(() {
      Map<String, dynamic> novoTodo = Map();
      novoTodo["titulo"] = _todoController.text;
      novoTodo["realizado"] = false;
      _todoController.text = "";
      _todoList.add(novoTodo);
      _salvarDados();
    });
  }

  Future<Null> _recarregaLista() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _todoList.sort((a, b) {
        if (a["realizado"] && !b["realizado"]) return 1;
        if (!a["realizado"] && b["realizado"]) return -1;
        return 0;
      });
      _salvarDados();
    });
    return null;
  }

  Widget widgetTarefa(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(0.85, 0.0),
          child: Icon(Icons.delete_sweep_outlined, color: Colors.white),
        ),
      ),
      direction: DismissDirection.endToStart,
      child: CheckboxListTile(
        title: Text(_todoList[index]["titulo"]),
        value: _todoList[index]["realizado"],
        secondary: CircleAvatar(
          child: Icon(
            _todoList[index]["realizado"] ? Icons.check : Icons.error,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _todoList[index]["realizado"] = value;
            _salvarDados();
          });
        },
        checkColor: Theme.of(context).primaryColor,
        activeColor: Theme.of(context).secondaryHeaderColor,
      ),
      onDismissed: (direction) {
        setState(() {
          _ultimoRemovido = Map.from(_todoList[index]);
          _indiceUltimoRemovido = index;
          _todoList.removeAt(index);
          _salvarDados();
        });

        final snack = SnackBar(
          content: Text("Tarefa \"${_ultimoRemovido["titulo"]}\" apagada!"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              setState(() {
                _todoList.insert(_indiceUltimoRemovido, _ultimoRemovido);
                _salvarDados();
              });
            },
          ),
          duration: Duration(seconds: 4),
        );
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snack);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 17.0, 1.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _todoController,
                    maxLength: 50,
                    decoration: InputDecoration(labelText: "Nova tarefa"),
                  )),
                  Container(
                    height: 45.0,
                    width: 45.0,
                    child: FloatingActionButton(
                      child: Icon(Icons.save),
                      onPressed: () {
                        if (_todoController.text.isEmpty) {
                          final alerta = SnackBar(
                            content: Text("Não pode ser vazio!"),
                            duration: Duration(seconds: 4),
                            action: SnackBarAction(
                              label: "Ok",
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .removeCurrentSnackBar();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(alerta);
                        } else {
                          _adicionaTarefa();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Expanded(
                child: RefreshIndicator(
              onRefresh: _recarregaLista,
              child: ListView.builder(
                itemBuilder: widgetTarefa,
                itemCount: _todoList.length,
                padding: EdgeInsets.only(top: 10.0),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
