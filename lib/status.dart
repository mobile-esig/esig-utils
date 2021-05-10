enum Status {
  ERRO,
  CONCLUIDO,
  VAZIO,
  AGUARDANDO,
}

extension StatusExt on Status {
  static String _mensagem = "";
  String get getMensagem => _mensagem;
  set setMensagem(String value) => _mensagem = value;
}
