enum Status {
  ERRO,
  CONCLUIDO,
  VAZIO,
  AGUARDANDO,
}

extension StatusExt on Status {
  static String msg = '';
  set mensagem(String valor) => msg = valor;
  String get mensagem => msg;
}
