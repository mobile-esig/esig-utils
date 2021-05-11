enum StatusLogin {
  ERRO,
  LOGADO,
  DESLOGADO,
  AGUARDANDO,
}

extension StatusLoginExt on StatusLogin {
  static String mensagem = '';
}
