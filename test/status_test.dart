import 'package:esig_utils/status.dart';
import 'package:esig_utils/status_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Status: ', () {
    test('Getter e Setter de mensagem', () async {
      /// Inicialização
      Status status = Status.VAZIO;
      expect(status.mensagem, isEmpty);

      /// Configuração de mensagem
      status.mensagem = 'mensagem';
      expect(status.mensagem, isNotEmpty);
      expect(status.mensagem, equals('mensagem'));

      /// Mensagem não é apagada após mudar Status
      status = Status.CONCLUIDO;
      expect(status.mensagem, equals('mensagem'));
    });
  });

  group('StatusLogin: ', () {
    test('Getter e Setter de mensagem', () async {
      /// Inicialização
      StatusLogin status = StatusLogin.LOGADO;
      expect(status.mensagem, isEmpty);

      /// Configuração de mensagem
      status.mensagem = 'mensagem';
      expect(status.mensagem, isNotEmpty);
      expect(status.mensagem, equals('mensagem'));

      /// Mensagem não é apagada após mudar Status
      status = StatusLogin.DESLOGADO;
      expect(status.mensagem, equals('mensagem'));
    });
  });
}
