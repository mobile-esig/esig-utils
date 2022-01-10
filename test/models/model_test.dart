import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:esig_utils/models/model.dart';

class Modelo extends Model {
  late int id;
  late String nome;

  @override
  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}

final modeloJson = '''
{
   "id":1,
   "nome":"Fulano"
}
''';

//TODO: testar excepções
void main() {
  late Modelo modelo;

  setUpAll(() {
    modelo = Modelo();
  });

  group('Model: ', () {
    test('construção sem json', () {
      expect(modelo, isA<Modelo>());
      expect(modelo, isA<Model>());
    });

    test('construção com tryFromJson', () {
      expect(modelo, isA<Modelo>());
      expect(modelo, isA<Model>());

      modelo.tryFromJson(jsonDecode(modeloJson));
      expect(modelo, isA<Modelo>());
      expect(modelo, isA<Model>());
      expect(modelo.id, equals(1));
      expect(modelo.nome, equals('Fulano'));
    });

    test('tryToJson', () {
      expect(modelo, isA<Modelo>());
      expect(modelo, isA<Model>());
      Map json = modelo.tryToJson();
      expect(json, isNotNull);
    });
  });
}
