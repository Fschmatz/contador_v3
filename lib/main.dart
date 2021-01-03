import 'package:contador_v3/logica/multiplicador.dart';
import 'package:contador_v3/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //MULTIPLICADOR
  Multiplicador multiplicador = Multiplicador();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int v = ((prefs.getInt('valorMultiplicador')) != null)
      ? prefs.getInt('valorMultiplicador')
      : 1;
  multiplicador.setMultiplicador(v);


  //notifier usado para o tema
  runApp(ChangeNotifierProvider(

    create: (_) => ThemeNotifier(),

    child: Consumer<ThemeNotifier>(
      builder:(context, ThemeNotifier notifier, child){

        return MaterialApp(
          theme: notifier.darkTheme ? dark : light,
          home: Home(multiplicador: multiplicador),
        );
      },
    ),
  )
  );
}

