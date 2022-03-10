import 'dart:io';

class HttpUtils {
  static const String serverErrorDefaultMsg =
      'Erro interno no servidor. Por favor, contate o suporte técnico.';

  static const String clientErrorDefaultMsg = 'Erro nas informações enviadas.';

  static const String redirectDefaultMsg = 'Serviço não está mais disponível.';

  static const String successDefaultMsg = 'Operação bem sucedida.';

  static const String informationDefaultMsg =
      'Solicitação em andamento, por favor, aguarde.';

  static const String unknownStatusDefaultMsg =
      'Um erro ocorreu. Verifique seu acesso à internet ou entre em contato com o suporte técnico.';

  /// Traduz resposta do servidor para uma liguagem que os usuários entendam.
  /// Lista de códigos HTTP: [https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status]
  static String getMessage(int? statusCode, [String? msg]) {
    if (statusCode == null) {
      return msg ?? unknownStatusDefaultMsg;
    }

    if (msg != null) {
      return '$msg Cód: $statusCode';
    }

    String response = unknownStatusDefaultMsg;

    if (statusCode >= 500 && statusCode <= 599) {
      response = serverErrorDefaultMsg;
    } else if (statusCode >= 400 && statusCode <= 499) {
      switch (statusCode) {
        case HttpStatus.badRequest:
          response =
              'Dados enviados contêm algum erro. Verifique e tente novamente';
          break;
        case HttpStatus.unauthorized:
          response =
              'Usuário não autenticado. Por favor, realize login novamente.';
          break;
        case HttpStatus.forbidden:
          response =
              'Operação rejeitada. Você não tem permissão para fazer isso.';
          break;
        case HttpStatus.notFound:
          response = 'Não encontrado.';
          break;
        case HttpStatus.methodNotAllowed:
          response =
              'Erro na comunicação com o servidor. Por favor, entre em contato com o suporte técnico.';
          break;
        default:
          response = clientErrorDefaultMsg;
      }
    } else if (statusCode >= 200 && statusCode <= 299) {
      switch (statusCode) {
        case HttpStatus.ok:
          response = 'A operação foi bem sucedida.';
          break;
        case HttpStatus.created:
          response = 'Criado com sucesso.';
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
          response =
              'O endereço do site mudou. Por favor, entre em contato com o suporte técnico.';
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
