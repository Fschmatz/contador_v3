import 'package:contador_v3/logica/databaseHelper.dart';
import 'package:contador_v3/logica/multiplicador.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../logica/conta.dart';
import '../ui/botaoMais.dart';
import '../ui/botaoMenos.dart';

class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();

  Conta conta;
  Multiplicador multiplicador;
  Contador({Key key, @required this.conta,this.multiplicador}) : super(key: key);
}

class _ContadorState extends State<Contador> {


  //REFRESH PARA ATUALIZAR O VALOR
  Future refresh() {
    setState(() {});
  }


  //DIALOG ADD VALOR MANUAL
  TextEditingController customController = TextEditingController();

  createAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 4.0,
            title: Text(
              "Digite o valor:",
              style: TextStyle(
                fontSize: 17,
              ),
            ),

            content: TextField(
              //ADD com ENTER
              onSubmitted: (x) {
                setState(() {
                  Navigator.of(context)
                      .pop(widget.conta.valorManual(int.parse(customController.text)));
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
                fontSize: 40,
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 0.0,
                child: Text(
                  "Inserir",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop(
                        widget.conta.valorManual(int.parse(customController.text)));
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

    //dados do telefone, resolução
    final data = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,

      //CORPO

      body: SingleChildScrollView(

        child: Column(

            children: <Widget>[
          SizedBox(height: data.size.height / 7),

          //VALOR + OnTAP
          Container(
            alignment: Alignment.center,
            height: data.size.height / 4,
            child: InkWell(
              onTap: () {
                createAlert(context);
              },
              child: FittedBox(
                fit:BoxFit.fitWidth,
                child:
                  Text(
                    "" + widget.conta.valorAtual.toString(),
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                  ),

              ),
            ),
          ),

          SizedBox(height: data.size.height / 10),

          //BOTOES

          Container(
            height: data.size.height / 10,
            child: BotaoMais(
              refresh: refresh,
              conta: widget.conta,
              m: widget.multiplicador.valorAtualMultiplicador,
            ),
          ),

          SizedBox(height: data.size.height / 16),

          Container(
            height: data.size.height / 12,
            child: BotaoMenos(
              refresh: refresh,
              conta: widget.conta,
              m: widget.multiplicador.valorAtualMultiplicador,
            ),
          )
          ]
        ),
      ),


      );
  }
}
