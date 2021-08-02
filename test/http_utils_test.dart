import 'dart:io';

import 'package:esig_utils/http_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late String msg;

  setUpAll(() {
    msg = 'mensagem de erro ou sucesso';
  });

  group('static final constants:', () {
    test('default messages', () {
      expect(HttpUtils.clientErrorDefaultMsg, isNotEmpty);
      expect(HttpUtils.informationDefaultMsg, isNotEmpty);
      expect(HttpUtils.redirectDefaultMsg, isNotEmpty);
      expect(HttpUtils.serverErrorDefaultMsg, isNotEmpty);
      expect(HttpUtils.successDefaultMsg, isNotEmpty);
      expect(HttpUtils.unknownStatusDefaultMsg, isNotEmpty);
    });
  });

  group('httpStatusHandler():', () {
    test('msg != null', () {
      final resposta = HttpUtils.httpStatusHandler(HttpStatus.badGateway, msg);
      expect(resposta, contains('${HttpStatus.badGateway}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('100 à 199', () {
      String resposta = HttpUtils.httpStatusHandler(HttpStatus.continue_);
      expect(resposta, contains('${HttpStatus.continue_}'));
      expect(resposta, contains(HttpUtils.informationDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.httpStatusHandler(199);
      expect(resposta, contains('${199}'));
      expect(resposta, contains(HttpUtils.informationDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.httpStatusHandler(HttpStatus.continue_, msg);
      expect(resposta, contains('${HttpStatus.continue_}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('200 à 299', () {
      String resposta = HttpUtils.httpStatusHandler(HttpStatus.created);
      expect(resposta, contains('${HttpStatus.created}'));
      expect(resposta, contains('Objeto criado.'));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.httpStatusHandler(299);
      expect(resposta, contains('${299}'));
      expect(resposta, contains(HttpUtils.successDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.httpStatusHandler(HttpStatus.created, msg);
      expect(resposta, contains('${HttpStatus.created}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('300 à 399', () {
      String resposta =
          HttpUtils.httpStatusHandler(HttpStatus.movedPermanently);
      expect(resposta, contains('${HttpStatus.movedPermanently}'));
      expect(resposta, contains('A URI do recurso requerido mudou.'));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.httpStatusHandler(399);
      expect(resposta, contains('${399}'));
      expect(resposta, contains(HttpUtils.redirectDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.httpStatusHandler(HttpStatus.movedPermanently, msg);
      expect(resposta, contains('${HttpStatus.movedPermanently}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('400 à 499', () {
      String resposta = HttpUtils.httpStatusHandler(HttpStatus.badRequest);
      expect(resposta, contains('${HttpStatus.badRequest}'));
      expect(resposta, contains('Dados enviados contêm algum erro.'));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.httpStatusHandler(499);
      expect(resposta, contains('${499}'));
      expect(resposta, contains(HttpUtils.clientErrorDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.httpStatusHandler(HttpStatus.badRequest, msg);
      expect(resposta, contains('${HttpStatus.badRequest}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('500 à 599', () {
      String resposta =
          HttpUtils.httpStatusHandler(HttpStatus.internalServerError);
      expect(resposta, contains('${HttpStatus.internalServerError}'));
      expect(resposta, contains(HttpUtils.serverErrorDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.httpStatusHandler(599);
      expect(resposta, contains('${599}'));
      expect(resposta, contains(HttpUtils.serverErrorDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta =
          HttpUtils.httpStatusHandler(HttpStatus.internalServerError, msg);
      expect(resposta, contains('${HttpStatus.internalServerError}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });
  });
}
