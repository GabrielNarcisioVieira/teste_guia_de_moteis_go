import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:teste_tecnico_guia_de_moteis/core/helpers/http_helper.dart';

void main() {
  group('HttpHelper - buildUri', () {
    test('Deve construir uma Uri simples sem parâmetros de query', () {
      const path = 'https://api.teste.com/moteis';

      final uri = HttpHelper.buildUri(path, null);

      expect(uri.toString(), path);
      expect(uri.scheme, 'https');
      expect(uri.host, 'api.teste.com');
    });

    test('Deve anexar parâmetros de query corretamente convertendo para string', () {
      const path = 'https://api.teste.com/moteis';
      final params = {
        'cidade': 'sao paulo',
        'limite': 10,
        'disponivel': true,
      };

      final uri = HttpHelper.buildUri(path, params);

      expect(uri.queryParameters['cidade'], 'sao paulo');
      expect(uri.queryParameters['limite'], '10');
      expect(uri.queryParameters['disponivel'], 'true');
      expect(uri.toString(), contains('limite=10'));
    });
  });

  group('HttpHelper - handleResponse', () {
    test('Deve decodificar JSON com sucesso quando status for 200', () {
      final response = http.Response('{"status": "ok", "data": []}', 200);

      final result = HttpHelper.handleResponse(response);

      expect(result, isA<Map<String, dynamic>>());
      expect(result['status'], 'ok');
    });

    test('Deve retornar null quando o corpo da resposta estiver vazio (204 No Content)', () {
      final response = http.Response('', 204);

      final result = HttpHelper.handleResponse(response);

      expect(result, isNull);
    });

    test('Deve lançar uma Exception quando o status code for erro (ex: 404)', () {
      final response = http.Response('Not Found', 404, reasonPhrase: 'Not Found');

      expect(
            () => HttpHelper.handleResponse(response),
        throwsA(isA<Exception>().having(
                (e) => e.toString(),
            'mensagem',
            contains('Erro HTTP: 404 - Not Found')
        )),
      );
    });

    test('Deve lançar uma Exception em caso de erro de servidor (500)', () {
      final response = http.Response('Internal Server Error', 500);

      expect(
            () => HttpHelper.handleResponse(response),
        throwsException,
      );
    });
  });
}