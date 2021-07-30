enum Status {
  VAZIO,
  AGUARDANDO,
  CONCLUIDO,
  ERRO,
}

extension StatusExt on Status {
  static String msg = '';
  set mensagem(String novaMsg) => msg = novaMsg;
  String get mensagem => msg;
}
