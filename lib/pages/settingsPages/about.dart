import 'package:flutter/material.dart';
import '../../util/versaoNomeApp.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: Text("Sobre"),
          centerTitle: true,
        ),

        body: Container(
          padding: EdgeInsets.fromLTRB(6,0,6,5),
          child: ListView(
              children: <Widget>[

                SizedBox(height: 20),
                Text(versaoNomeApp.nomeApp+" " + versaoNomeApp.versaoApp,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 25),

                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.deepOrangeAccent,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                ),

                Text( '''                     
                
MARTELADO E REFEITO DO ZERO: 
3.5 X POR ENQUANTO !!! 
       
      ''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),


                Text( '''                     
                                
 Aplicativo criado utilizando 
o Flutter e a linguagem Dart,
usado para testes e aprendizado. 
       
 Nele estão varias técnicas 
diferentes e tipos de Widgets.  
      
                     
 Este aplicativo um dia terá 
seu código disponibilizado 
gratuitamente no GitHub e 
talvez adicionado ao F-Droid. 
            
      ''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    //fontWeight: FontWeight.bold
                  ),
                ),

                Text( '''      
                
                       
"Without studying the soul sick" 
- Seneca                   
            
      ''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ]),
        )
    );

  }
}

