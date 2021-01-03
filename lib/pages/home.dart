import 'package:contador_v3/logica/conta.dart';
import 'package:contador_v3/logica/databaseHelper.dart';
import 'package:contador_v3/logica/multiplicador.dart';
import 'package:contador_v3/pages/configs.dart';
import 'package:contador_v3/pages/salvos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/contador.dart';
import '../util/versaoNomeApp.dart';
import '../logica/conta.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  Multiplicador multiplicador;
  Home({Key key, @required this.multiplicador}) : super(key: key);
}

class _HomeState extends State<Home> {

  @override
  void initState(){
    super.initState();
  }


  Conta conta = new Conta();

  //LOGICA DB
  final dbHelper = DatabaseHelper.instance;

  void inserir(int valor, String nome) async {
    // linha para incluir
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome : '$nome',
      DatabaseHelper.columnValor : valor
    };
    final id = await dbHelper.insert(row);
    print('linha inserida id: $id');
  }


  //ALERTDIALOG DO SAVE

  TextEditingController customController = TextEditingController();

  createAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 4.0,

            title: Text(
              "Digite o nome da contagem:",
              style: TextStyle(
                fontSize: 17,
              ),
            ),

            content: TextField(

              //ADD com ENTER
              onSubmitted: (x) {
                setState(() {
                  Navigator.of(context).pop(

                      inserir(
                          this.conta.valorAtual,
                          customController.text));
                });

                customController.clear();
              },
              textCapitalization: TextCapitalization.sentences,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              controller: customController,
              autofocus: true,

              decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        //color: coresApp.corItensCamposDialog,
                      ),
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        //color: coresApp.corItensCamposDialog,
                      ),
                      borderRadius: BorderRadius.circular(8.0)
                  )
              ),

              style: TextStyle(
                fontSize: 30,
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 0.0,
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: () {

                  setState(() {
                    Navigator.of(context).pop(

                         inserir( //valor, nome
                            this.conta.valorAtual,
                            customController.text),
                        );

                  });
                  customController.clear();
                },
              )
            ],
          );
        });
  }

  //ALERTDIALOG DO SAVE



  int _currentIndex = 0;
  bool _exibeSave = true;

  final tabs = [
    Contador(),
    Salvos(),
    Configs(),
  ];


  List<Widget> pageList = List<Widget>();


  @override
  Widget build(BuildContext context) {

    pageList.add(Contador(conta: conta,multiplicador: widget.multiplicador));
    pageList.add(Salvos());
    pageList.add(Configs(conta: conta,multiplicador: widget.multiplicador));

    return Scaffold(
        resizeToAvoidBottomPadding: false,

        //TOPO
        appBar: AppBar(
            elevation: 8.0,
            title: Text(versaoNomeApp.nomeApp+" "+versaoNomeApp.versaoApp),
            centerTitle: true,
            actions: <Widget>[

              //Botão save
              Visibility(
                visible: _exibeSave,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {

                      createAlert(context);

                    },
                    child: Icon(
                      Icons.save_outlined,
                      size: 26.0,
                    ),
                  ),
                ),
              )
            ]),

        body: IndexedStack(
          index: _currentIndex,
          children: pageList,
        ),

        //BOTTOMBAR
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,   //???

            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            elevation: 8.0,


            onTap: (index) {
              setState(() {
                _currentIndex = index;


                //VISIBILIDADE DO SAVE
                if(_currentIndex == 0){
                  _exibeSave = true;
                }
                else{
                  _exibeSave = false;
                }

              });
            },

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.library_add_outlined),
                label: 'Contador',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star_border_outlined),
                label: 'Salvos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Configurações',
              ),

            ],
          ),
        );
  }
}



