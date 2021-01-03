import 'package:flutter/material.dart';
import '../logica/conta.dart';

class BotaoMais extends StatefulWidget {
  @override
  _BotaoMaisState createState() => _BotaoMaisState();

  Conta conta;
  final Function() refresh;
  int m;

  BotaoMais({Key key, @required this.refresh, @required this.conta, @required this.m }) : super(key: key);

}

class _BotaoMaisState extends State<BotaoMais> {

  @override
  Widget build(BuildContext context) {

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: 150.0,
              width: 200.0,
              child: InkWell(

                  child: FloatingActionButton.extended(
                    heroTag: null,
                    onPressed: (){

                      widget.conta.aumentar(widget.m);
                      widget.refresh();

                      },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    elevation: 3.0,
                    label: Text('    +    ', style:
                    TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.green,
                  )
              )
          )
        ],
      );
    }
  }


