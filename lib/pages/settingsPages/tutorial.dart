import 'package:flutter/material.dart';

class Tutorial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: Text("Tutorial"),
          centerTitle: true,

        ),

        body: ListView(
            children: <Widget>[

              Container(
                padding: EdgeInsets.fromLTRB(6,0,6,5),
                child: Text( '''    
                                 
      1.Como adiciono ao valor?                        
      -> Aperte o Botão " + " para adicionar. 
      
      
      2.Como reduzo o valor?  
      -> Aperte o Botão " - " para diminuir.  
      
      
      3.Como reseto o valor? 
      -> Segure o Botão " - " para zerar a contagem.
      
      
      4.Como inserir um valor manualmente? 
      -> Toque a contagem para inserir valor 
         manualmente.
         
         
      5.Como salvo contagens? 
      -> Toque o ícone de salvar, insira um nome
         e pressione "Salvar".
         
         
      6.Como atualizo as contagens? 
      -> Basta deslizar para baixo na tela
         de contagens salvas.
                    
         
      7.Como deleto uma contagem? 
      -> Na página de contagens salvas, basta
         clicar no botão da lixeira.
         
         
      8.Como editar uma contagem? 
      -> Na página de contagens salvas, basta
         clicar no botão de editar.
         
          
      ''',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            ]));

  }
}

