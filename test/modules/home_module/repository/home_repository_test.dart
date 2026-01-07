import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_tecnico_guia_de_moteis/core/architecture/result_architecture.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/services/http_service.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/repository/home_repository.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  late HomeRepository repository;
  late MockHttpService mockHttpService;

  setUp(() {
    mockHttpService = MockHttpService();
    repository = HomeRepository(mockHttpService);
  });

  group('HomeRepository - getMotels', () {

    test('Deve retornar Success com uma lista de MotelModel quando a requisição for bem sucedida', () async {
      final mockResponse = {
        "sucesso": true,
        "data": {
          "moteis": [
            {
              "fantasia": "Motel Le Nid",
              "distancia": 28.27,
              "suites": []
            }
          ]
        }
      };

      when(() => mockHttpService.get(any())).thenAnswer((_) async => mockResponse);

      final result = await repository.getMotels();
      expect(result, isA<Success<List<MotelModel>, Exception>>());

      final successValue = (result as Success).value;
      expect(successValue.length, 1);
      expect(successValue.first.fantasia, "Motel Le Nid");
      verify(() => mockHttpService.get(any())).called(1);
    });

    test('Deve retornar Failure com a mensagem da API quando sucesso for false', () async {
      final mockErrorResponse = {
        "sucesso": false,
        "mensagem": "Erro de servidor"
      };

      when(() => mockHttpService.get(any())).thenAnswer((_) async => mockErrorResponse);

      final result = await repository.getMotels();
      expect(result, isA<Failure>());

      final failure = result as Failure;
      expect(failure.exception.toString(), contains('Erro de servidor'));
    });

    test('Deve retornar Failure quando o HttpService lançar uma exceção', () async {
      when(() => mockHttpService.get(any())).thenThrow(Exception('Falha de conexão'));

      final result = await repository.getMotels();

      expect(result, isA<Failure>());

      final failure = result as Failure;
      expect(failure.exception.toString(), contains('Ocorreu uma falha inesperada'));
      expect(failure.exception.toString(), contains('Falha de conexão'));
    });

    test('Deve retornar Failure quando a estrutura do JSON for inválida', () async {
      final mockInvalidResponse = {
        "sucesso": true,
        "data": null
      };

      when(() => mockHttpService.get(any())).thenAnswer((_) async => mockInvalidResponse);

      final result = await repository.getMotels();

      expect(result, isA<Failure>());
      expect((result as Failure).exception.toString(), contains('falha inesperada'));
    });
  });
}