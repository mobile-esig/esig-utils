import 'dart:io';

class ExceptionHandler {
  /// Traduz resposta do servidor para uma liguagem que os usuários entendam.
  /// Lista de códigos HTTP: [https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status]
  httpStatusHandler(int statusCode, [String? msg]) {
    if (msg != null) {
      return '$msg Cód: $statusCode';
    }

    String response = 'Status não identificado. Contate o desenvolvedor.';

    if (statusCode >= 500 && statusCode <= 599) {
      response = 'Erro interno no servidor, contate o desenvolvedor.';
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
          response = 'Erro nas informações enviadas. Contate o desenvolvedor.';
      }
    } else if (statusCode >= 200 && statusCode <= 300) {
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
          response = 'Operação bem sucedida.';
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
          response =
              'Serviço sofreu uma atualização ou não está mais disponível.';
      }
    } else if (statusCode <= 199) {
      response = '';
    }

    return response + 'Cód. $statusCode';
  }
}
