class Conta {

  int id;
  int valor;
  String nome;

  Conta({this.id, this.valor = 0, this.nome});


  bool vManual = false;

  //LOGICA ANTIGA
  int get valorAtual{
      return valor;
  }

  void aumentar(int m) {
    valor = valor + m;
  }

  void diminuir(int m) {
    if((valor - m) < 0){
      valor = 0;
    }else{
      valor = valor - m;
    }
  }

  void resetar() {
    valor = 0;
  }

  void valorManual(int x) {
    valor = x;
  }

}