import 'package:flutter/material.dart';
import '../../util/versaoNomeApp.dart';

class Changelog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: Text("Changelog "+versaoNomeApp.versaoApp),
          centerTitle: true,
        ),

        body: ListView(
            children: <Widget>[

              Container(
                padding: EdgeInsets.fromLTRB(6,0,6,5),
                child: Text( '''
                
   8.5 -> Correções, Versão Final?              
   8.1b -> Correções            
   8.1 -> Correções              
   8.0 -> Temas OK           
   7.5 -> ThemeData Dark e Light            
   7.4 -> Correções = RC2            
   7.3 -> Melhorias de desempenho           
   7.2 -> Shared Preferences Multiplicador OK         
   7.1.1 -> Add Todo
   7.1 -> Organizado Shared preferences          
   7.0 -> Multiplicador Funcional           
   6.9 -> Shared preferences Funcional                
   6.8.1 -> Shared preferences não Funcional
   6.7 -> Dialogs Personalizados
   6.7 -> Editar Funcional                          
   6.6 -> Mudanças no Layout                           
   6.5 -> Pull down to refresh no salvos
   6.4 -> Novo tema escuro
   6.3 -> Refresh +/- corrigido
   6.2 -> Delete no icone 
   6.1 -> Listagem dos Salvos
   6.0 -> Db Funcional
   5.9.9 -> Sqflite quase funcional
   5.9.4 -> Melhorias de desempenho
   5.9.3 -> Correções
   5.9.2 -> Correções
   5.9.1 -> Correções
   5.9 -> Correções, separados botões
   5.8 -> Melhorias
   5.7 -> Classes globais
   5.6 -> Pagina about + avatar
   5.5 -> Nova Pagina Settings
   5.4 -> Cores Personalizadas
   5.3 -> Pagina tutorial
   5.2 -> Correções
   5.1 -> Correções, Landscape bloqueado
   5.0 -> Paginas funcionando
   4.9 -> Alterada logica do reset
   4.8 -> Layout Alterado (Botões)
   4.7 -> BottomBar (ñ funcional)
   4.6 -> Home responsiva
   4.5 -> Changelog com ListView
   4.4 -> Topbar em objetos
   4.3 -> Botões em objetos
   4.2 -> Melhorias de desempenho
   4.1 -> Dialog mais bonito, somente números
   4.0 -> Corrigido Pixel overflow
   3.6 -> Removido Botão Valor Manual, direto no Nº
   3.5 -> Teclado e Dialog resolvidos
   3.4 -> Splash screen
   3.3 -> Objeto para os valores conta
   3.2 -> Add changelog
   3.1 -> Protótipo de configs
   3.0 -> Novo ícone
   2.5 -> Alterado layout
   2.0 -> Teclado numérico para o dialog
   1.6 -> Valor manual com dialog
   1.5 -> Add inserir valor manual
   1.3 -> Ícone teste
   1.2 -> Add reset
   1.1 -> Novos botões .extended
   1.0 -> Projeto funcional
   0.8 -> Alterado layout e tema mudado para escuro
   0.5 -> Add botão + e -
   0.2 -> Nova lógica, mais simples
   0.1 -> Inicio do Projeto
   
                            
                            
                            
                       
                            
                            
                            
                            
                        
                            
      (ಠ‿ಠ)  
      ''',
                style: TextStyle(
                  fontSize: 16,
                  //fontWeight: FontWeight.bold
                ),
            ),
              )
        ]));

  }
}

