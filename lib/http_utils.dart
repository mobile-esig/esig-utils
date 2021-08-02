import 'dart:io';

class HttpUtils {
  static final String serverErrorDefaultMsg =
      'Erro interno no servidor, contate o desenvolvedor.';

  static final String clientErrorDefaultMsg = 'Erro nas informações enviadas.';

  static final String redirectDefaultMsg =
      'Serviço sofreu uma atualização ou não está mais disponível.';

  static final String successDefaultMsg = 'Operação bem sucedida.';

  static final String informationDefaultMsg =
      'Solicitação em andamento, aguarde.';

  static final String unknownStatusDefaultMsg =
      'Status não identificado. Contate o desenvolvedor.';

  /// Traduz resposta do servidor para uma liguagem que os usuários entendam.
  /// Lista de códigos HTTP: [https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status]
  static String httpStatusHandler(int statusCode, [String? msg]) {
    if (msg != null) {
      return '$msg Cód: $statusCode';
    }

    String response = unknownStatusDefaultMsg;

    if (statusCode >= 500 && statusCode <= 599) {
      response = serverErrorDefaultMsg;
    } else if (statusCode >= 400 && statusCode <= 499) {
      switch (statusCode) {
        case HttpStatus.badRequest:
          response = 'Dados enviados contêm algum erro.';
          break;
        case HttpStatus.unauthorized:
          response = 'Usuário não autenticado. Realize login novamente.';
          break;
        case HttpStatus.forbidden:
          response =
              'Requisição rejeitada. Você não tem permissão para fazer isso.';
          break;
        case HttpStatus.notFound:
          response = 'Recurso não encontrado.';
          break;
        case HttpStatus.methodNotAllowed:
          response = 'Requisição com método incorreto.';
          break;
        default:
          response = clientErrorDefaultMsg;
      }
    } else if (statusCode >= 200 && statusCode <= 299) {
      switch (statusCode) {
        case HttpStatus.ok:
          response = 'Requisição foi bem sucedida.';
          break;
        case HttpStatus.created:
          response = 'Objeto criado.';
          break;
        case HttpStatus.accepted:
          response =
              'A requisição foi recebida mas nenhuma ação foi tomada sobre ela.';
          break;
        case HttpStatus.noContent:
          response =
              'Não há conteúdo para enviar para esta solicitação, mas os cabeçalhos podem ser úteis.';
          break;
        default:
          response = successDefaultMsg;
      }
    } else if (statusCode >= 300 && statusCode <= 399) {
      switch (statusCode) {
        case HttpStatus.multipleChoices:
          response = 'A requisição tem mais de uma resposta possível.';
          break;
        case HttpStatus.movedPermanently:
          response = 'A URI do recurso requerido mudou.';
          break;
        default:
          response = redirectDefaultMsg;
      }
    } else if (statusCode <= 199) {
      response = informationDefaultMsg;
    }

    return response + ' Cód: $statusCode';
  }
}
