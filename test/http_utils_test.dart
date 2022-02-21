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

  group('getMessage():', () {
    test('statusCode == null', () {
      var resposta = HttpUtils.getMessage(null);
      expect(resposta, contains(HttpUtils.unknownStatusDefaultMsg));
      expect(resposta.contains('Cód'), isFalse);

      resposta = HttpUtils.getMessage(null, msg);
      expect(resposta, contains(msg));
      expect(resposta.contains('Cód'), isFalse);
    });

    test('msg != null', () {
      final resposta = HttpUtils.getMessage(HttpStatus.badGateway, msg);
      expect(resposta, contains('${HttpStatus.badGateway}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('100 à 199', () {
      String resposta = HttpUtils.getMessage(HttpStatus.continue_);
      expect(resposta, contains('${HttpStatus.continue_}'));
      expect(resposta, contains(HttpUtils.informationDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(199);
      expect(resposta, contains('${199}'));
      expect(resposta, contains(HttpUtils.informationDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(HttpStatus.continue_, msg);
      expect(resposta, contains('${HttpStatus.continue_}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('200 à 299', () {
      String resposta = HttpUtils.getMessage(HttpStatus.created);
      expect(resposta, contains('${HttpStatus.created}'));
      expect(resposta, contains('Criado com sucesso. Cód: 201'));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(299);
      expect(resposta, contains('${299}'));
      expect(resposta, contains(HttpUtils.successDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(HttpStatus.created, msg);
      expect(resposta, contains('${HttpStatus.created}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('300 à 399', () {
      String resposta = HttpUtils.getMessage(HttpStatus.movedPermanently);
      expect(resposta, contains('${HttpStatus.movedPermanently}'));
      expect(
        resposta,
        contains(
            'O endereço do site mudou. Por favor, entre em contato com o suporte técnico'),
      );
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(399);
      expect(resposta, contains('${399}'));
      expect(resposta, contains(HttpUtils.redirectDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(HttpStatus.movedPermanently, msg);
      expect(resposta, contains('${HttpStatus.movedPermanently}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('400 à 499', () {
      String resposta = HttpUtils.getMessage(HttpStatus.badRequest);
      expect(resposta, contains('${HttpStatus.badRequest}'));
      expect(resposta, contains('Dados enviados contêm algum erro.'));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(499);
      expect(resposta, contains('${499}'));
      expect(resposta, contains(HttpUtils.clientErrorDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(HttpStatus.badRequest, msg);
      expect(resposta, contains('${HttpStatus.badRequest}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });

    test('500 à 599', () {
      String resposta = HttpUtils.getMessage(HttpStatus.internalServerError);
      expect(resposta, contains('${HttpStatus.internalServerError}'));
      expect(resposta, contains(HttpUtils.serverErrorDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(599);
      expect(resposta, contains('${599}'));
      expect(resposta, contains(HttpUtils.serverErrorDefaultMsg));
      expect(resposta, contains(' Cód'));

      resposta = HttpUtils.getMessage(HttpStatus.internalServerError, msg);
      expect(resposta, contains('${HttpStatus.internalServerError}'));
      expect(resposta, contains(msg));
      expect(resposta, contains(' Cód'));
    });
  });
}
