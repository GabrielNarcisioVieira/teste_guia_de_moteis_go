import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_tecnico_guia_de_moteis/core/architecture/result_architecture.dart';
import 'package:teste_tecnico_guia_de_moteis/core/services/http_service.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/repository/home_repository.dart';

class MockHttpService extends Mock implements HttpService {}

void main() {
  late HomeRepository repository;
  late MockHttpService mockHttp;

  setUp(() {
    mockHttp = MockHttpService();
    repository = HomeRepository(mockHttp);
  });

  group('HomeRepository - getMotels', () {
    test('Deve retornar Success com lista de motéis quando a API responder 200', () async {
      final mockResponse = {
        'sucesso': true,
        'data': {
          'moteis': [
            {'fantasia': 'Motel 1', 'suites': []}
          ]
        }
      };

      when(() => mockHttp.get(any())).thenAnswer((_) async => mockResponse);

      final result = await repository.getMotels();

      expect(result, isA<Success>());
      expect((result as Success).value.length, 1);
    });

    test('Deve retornar Failure quando a API indicar erro no JSON', () async {
      when(() => mockHttp.get(any())).thenAnswer((_) async => {'sucesso': false, 'mensagem': 'Erro'});

      final result = await repository.getMotels();

      expect(result, isA<Failure>());
    });
  });
}