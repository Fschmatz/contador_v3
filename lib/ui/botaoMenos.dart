import 'package:flutter/material.dart';
import '../logica/conta.dart';



class BotaoMenos extends StatefulWidget {
  @override
  _BotaoMenosState createState() => _BotaoMenosState();

  Conta conta;
  int m;
  final Function() refresh;

  BotaoMenos({Key key, @required this.refresh, @required this.conta, @required this.m}) : super(key: key);
}

class _BotaoMenosState extends State<BotaoMenos> {

  @override
  Widget build(BuildContext context) {

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 65.0,
              width: 140.0,
              child: InkWell(

                //Logica HOLD para RESET
                  onLongPress: () {
                    widget.conta.resetar();
                    widget.refresh();
                  },

                  child: FloatingActionButton.extended (
                    heroTag: null,
                    onPressed: (){

                        widget.conta.diminuir(widget.m);
                        widget.refresh();

                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    elevation: 3.0,
                    label: Text('     -     ', style:
                    TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.redAccent,
                  )
              )
          )
        ],
      );
  }}


