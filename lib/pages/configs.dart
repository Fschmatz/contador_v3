import 'package:contador_v3/logica/conta.dart';
import 'package:contador_v3/logica/multiplicador.dart';
import 'package:contador_v3/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'settingsPages/changelog.dart';
import 'settingsPages/about.dart';
import 'settingsPages/tutorial.dart';
import '../util/versaoNomeApp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Configs extends StatefulWidget {
  @override
  _ConfigsState createState() => _ConfigsState();

  Conta conta;
  int m;
  Multiplicador multiplicador;

  Configs({Key key, @required this.conta, this.m, this.multiplicador})
      : super(key: key);
}

class _ConfigsState extends State<Configs> {
  @override
  void initState() {
    super.initState();
  }

  //DIALOG MULTIPLICADOR
  TextEditingController customController = TextEditingController();

  createAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 4.0,
            title: Text(
              "Digite o valor:",
              style: TextStyle(fontSize: 17),
            ),
            content: TextField(
              //ADD com ENTER
              onSubmitted: (x) async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  prefs.setInt(
                      'valorMultiplicador', int.parse(customController.text));
                  widget.multiplicador.valorMultiplicador =
                      int.parse(customController.text);
                  Navigator.of(context).pop();
                });
                customController.clear();
              },

              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: customController,
              autofocus: true,
              decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(8.0)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(8.0))),
              style: TextStyle(fontSize: 40),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 0.0,
                child: Text(
                  "Salvar",
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  setState(() {
                    prefs.setInt(
                        'valorMultiplicador', int.parse(customController.text));
                    widget.multiplicador.valorMultiplicador =
                        int.parse(customController.text);
                    Navigator.of(context).pop();
                  });
                  customController.clear();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 3.0,
                margin: const EdgeInsets.all(2.0),
                color: Colors.yellow,
                child: ListTile(
                  title: Text(
                    "Flutter " +
                        versaoNomeApp.nomeApp +
                        " " +
                        versaoNomeApp.versaoApp,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Card(
                elevation: 3.0,
                margin: const EdgeInsets.all(0.5),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.text_snippet_outlined),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      title: Text(
                        "Tutorial",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tutorial()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.text_snippet_outlined),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      title: Text(
                        "Sobre",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.text_snippet_outlined),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      title: Text(
                        "Changelog",
                        style: TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Changelog()),
                        );
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Opções: ",
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 15.0,
              ),
              Card(
                elevation: 3.0,
                margin: const EdgeInsets.all(2),
                child: ListTile(
                  trailing: Text(
                    widget.multiplicador.valorAtualMultiplicador.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  title: Text(
                    "Multiplicador",
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    createAlert(context);
                  },
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  "Tema Escuro",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Consumer<ThemeNotifier>(
                  builder: (context, notifier, child) => Switch(
                      activeColor: Colors.blue,
                      value: notifier.darkTheme,
                      onChanged: (value) {
                        notifier.toggleTheme();
                      }),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
