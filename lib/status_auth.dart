enum StatusLogin {
  ERRO,
  LOGADO,
  DESLOGADO,
  AGUARDANDO,
}

extension StatusLoginExt on StatusLogin {
  static String msg = '';
  set mensagem(String novaMsg) => msg = novaMsg;
  String get mensagem => msg;
}
