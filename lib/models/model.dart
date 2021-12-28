/// Modela uma entidade serializável via JSON.
/// Contém a função abstrata [fromJson], que deve ser implementada pelo usuário.
/// Já a [tryFromJson], serve para o mesmo propósito de [fromJson], mas emite seu erro
/// com uma formatação mais adequada para a telemetria (e.g. Firebase Console).
abstract class Model {
  fromJson(Map<String, dynamic> json);

  tryFromJson(Map<String, dynamic> json) {
    try {
      fromJson(json);
    } catch (e) {
      throw ({'Exception': e, 'json': json});
    }
  }
}
