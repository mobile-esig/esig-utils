///Legenda:
///
/// NAO_CARREGADO: Estado inicial, nenhuma requisição foi feita.
///
/// ERRO: Requisição retornou um erro.
///
/// CONCLUIDO: Requisição retornou resposta adequada.
///
/// VAZIO: Requisição bem sucedida, mas retornou dados vazios.
///
/// AGUARDANDO: Requisição em andamento.

enum Status {
  NAO_CARREGADO,
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
