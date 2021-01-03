import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Multiplicador{

  int valorMultiplicador;

  Multiplicador({this.valorMultiplicador});

  int get valorAtualMultiplicador{
    return valorMultiplicador;
  }

  setMultiplicador(int v){
    this.valorMultiplicador = v;
  }

}