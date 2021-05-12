enum StatusLogin {
  ERRO,
  LOGADO,
  DESLOGADO,
  AGUARDANDO,
}

extension StatusLoginExt on StatusLogin {
  static String msg = '';
  set mensagem(String valor) => msg = valor;
  String get mensagem => msg;
}
