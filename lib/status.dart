enum Status {
  ERRO,
  CONCLUIDO,
  VAZIO,
  AGUARDANDO,
}

extension StatusExt on Status {
  static String msg = '';
  set mensagem(String novaMsg) => msg = novaMsg;
  String get mensagem => msg;
}
