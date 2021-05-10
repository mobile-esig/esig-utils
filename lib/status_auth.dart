enum StatusLogin {
  ERRO,
  LOGADO,
  DESLOGADO,
  AGUARDANDO,
}

extension StatusLoginExt on StatusLogin {
  static String _mensagem = "";
  String get getMensagem => _mensagem;
  set setMensagem(String value) => _mensagem = value;
}
