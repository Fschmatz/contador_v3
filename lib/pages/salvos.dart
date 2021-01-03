import 'package:contador_v3/logica/databaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Salvos extends StatefulWidget {
  @override
  _SalvosState createState() => _SalvosState();
}

class _SalvosState extends State<Salvos> {
  List<Map<String, dynamic>> contas = new List();
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    getAllContas();
  }


  //DATABASE
  Future<void> getAllContas() async {
    var resposta = await dbHelper.queryAllRows();
    setState(() {
      contas = resposta;
    });
  }

  void deletar(int id) async {
    final idDeletado = await dbHelper.delete(id);
    print(id.toString() + ' deletado');
  }

  void atualizar(int id,  String nome, String valor) async {
    // linha para atualizar
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : id,
      DatabaseHelper.columnNome : nome,
      DatabaseHelper.columnValor  : valor
    };
    final linhasAfetadas = await dbHelper.update(row);
    print('atualizadas $linhasAfetadas linha(s)');
  }

  // DATABASE

  //DIALOG DO EDIT


  createAlert(BuildContext context,int id, String n, String v) {

    TextEditingController customControllerNome = TextEditingController();
    TextEditingController customControllerValor = TextEditingController();

    customControllerNome.text = n;
    customControllerValor.text = v;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 4.0,
            scrollable: true,

            title: Text(
              "Editar contagem ",
              style: TextStyle(
                fontSize: 19,
              ),
            ),



            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, //min ou max?
              children: [

                    Text("Nome :",
                      style: TextStyle(
                          fontSize: 19,
                          ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.name,
                      controller: customControllerNome,
                      autofocus: true,

                      decoration: InputDecoration(
                          filled: true,
                          //fillColor: coresApp.corItensCamposDialog,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                //color: coresApp.corItensCamposDialog,
                              ),
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                           // color: coresApp.corItensCamposDialog,
                          ),
                        borderRadius: BorderRadius.circular(8.0)
                    )
                      ),

                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 14,),

                    //VALOR
                    Text("Valor :",
                      style: TextStyle(
                          fontSize: 19,
                        ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      keyboardType: TextInputType.number,
                      controller: customControllerValor,
                      autofocus: true,

                      decoration: InputDecoration(
                          filled: true,
                          //fillColor: coresApp.corItensCamposDialog,
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
                        fontSize: 19,
                      ),
                    ),
              ],
            ),


            actions: <Widget>[
              MaterialButton(
                elevation: 0.0,
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop(

                      atualizar( //id nome valor
                          id,
                          customControllerNome.text,
                          customControllerValor.text
                      ),
                    );
                  });
                  getAllContas();
                  customControllerValor.clear();
                  customControllerNome.clear();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              //ITENS
              Expanded(
                child: RefreshIndicator(
                  child: ListView.builder(
                    //shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    itemCount: contas.length,
                    itemBuilder: (context, int index) {
                      return Card(
                        elevation: 3.0,
                        margin: const EdgeInsets.fromLTRB(17, 6, 17, 6),
                        child: ListTile(
                          trailing: Wrap(
                            spacing: 8,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit_outlined,
                                ),
                                onPressed: () {
                                  createAlert(context,
                                      contas[index]['_id'],
                                      contas[index]['nome'] ,
                                      contas[index]['valor'].toString());
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete_outline_outlined,
                                ),
                                onPressed: () {
                                  deletar(contas[index]['_id']);
                                  getAllContas();
                                },
                              ),
                            ],
                          ),
                          title: Text(
                            contas[index]['valor'].toString(),
                            style: TextStyle( fontSize: 18),
                          ),
                          subtitle: Text(
                            contas[index]['nome'],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                 onRefresh: getAllContas,

                ),
              ),



            ]));
  }
}
