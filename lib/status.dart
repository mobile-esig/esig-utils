enum Status {
  ERRO,
  CONCLUIDO,
  VAZIO,
  AGUARDANDO,
}

extension StatusExt on Status {
  static String mensagem = '';
}
