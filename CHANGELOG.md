## [5.0.1] - HttpUtils

- Refatora `HttpUtils`: statusCode agora pode ser null

## [5.0.0] - HttpUtils e DateTimeRangeExtension

- Renomeia `datetimeToString()` para `datetimeFromString()`
- Refatora `HttpUtils`: melhora nome da função conversora de códigos HTTP

## [4.2.1] - DateTimeRangeExtension

- Mudança nos títulos do CHANGELOG. Agora títulos refletem mudanças ao invés de data de lançamento
- Adiciona `DateTimeRangeExtension`
- Adiciona `datetimeToString()` no EsigDateUtils

## [4.2.0] - 10/01/2022

- Adiciona abstração `Model`
- Melhora documentação de `int_ext.dart`
- Adiciona `NAO_CARREGADO` na enumeração `Status`

## [4.1.2] - 19/10/2021

- `toDateTime` adicionado em `intExtension`

## [4.1.1] - 14/10/2021

- Reformula atributos de `dia.dart` e adiciona métodos
- Adiciona testes em `dia_test.dart`

## [4.1.0] - 08/10/2021

- Implementa `firstTwoNames` em `string_ext.dart`
- Implementa `isIndexValid` e `getNullable` em `list_ext.dart`

## [4.0.0] - 07/10/2021

- Remove snackbar, que foi transferido para `loading_empty_error`
- Nova extensão para `String` em `string_ext.dart`
- Nova extensão para `List<T>` em `list_ext.dart`
- Remove funções `halfWidth` `halfHeight` de `SizeScreen`. Usar `fracWidth(context, 2)` e `fracHeight(context, 2)` produzirá o mesmo efeito.

## [3.1.1] - 23/09/2021

- Cria extension `bool_check.dart`.
- `formatDateTime` agora pode receber valor nulo.

## [3.1.0] - 02/08/2021

- Cria `http_utils.dart` com função que traduz mensagens do servidor para uma linguagem mais amigável.
- Implementa testes dos membros de `http_utils.dart`.

## [3.0.0] - 30/07/2021

- Adiciona `String formattedDateTime()` na extension `date_time.dart`.
- Reformula funções em `date_time.dart` para conter opções variadas de retorno.

## [2.1.3] - 01/07/2021

- Adiciona a função `showSnackbar()` para mostrar uma snackbar customizada `date_time.dart`.

## [2.1.2] - 01/07/2021

- Declara tipo de retorno das funções em `date_time.dart`.
- Adiciona função `textoSeperado()` na classe `EsigUtils`.
- Adiciona testes de `textoSeperado()`.

## [2.1.1] - 14/06/2021

- Novas funções em SizeScreen: `fracWidth` e `fracHeiht`..
- Funções em SizeScreen marcadas como @Deprecated: `halfWidth` e `halfHeight`.
- Adicionada função de formatar `DateTime` em `date_utils.dart`.

## [2.0.1] - 12/05/2021

- `Status` e `StatusLogin` com mensagem configurável. Testes implementados.

## [2.0.0] - 12/05/2021

- Conclui migração para null-safety.

## [1.0.3] - 12/05/2021

- Classe `SizeScreen` corrigida.

## [1.0.2] - 11/05/2021

- Adiciona:

  - modelos `Dia` e `Semana`.
  - Extension methods `date_time` e `zero_pad`.
  - Mais funções em `EsigDateUtils` e `EsigUtils`.
  - Testes na maioria das funções.

## [1.0.0] - 10/05/2021

- Versão compatível com o flutter 2.0.0.

## [0.0.3] - 10/05/2021

- Corrigindo versão do crypto para ^3.0.0.

## [0.0.1+1] - 10/05/2021

- Utilitários gerais.

## [0.0.1] - 10/05/2021

- Corrigindo versão do intl para ^0.17.0.
