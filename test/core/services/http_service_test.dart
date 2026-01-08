import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:teste_tecnico_guia_de_moteis/core/services/http_service.dart';

class MockHttpClient extends Mock implements http.Client {}
class FakeUri extends Fake implements Uri {}

void main() {
  late HttpService service;
  late MockHttpClient mockClient;

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    mockClient = MockHttpClient();
    service = HttpService(client: mockClient);
  });

  group('HttpService - Testes de Integração de Infraestrutura', () {
    const tPath = 'https://api.teste.com/moteis';
    const tResponseData = {'data': 'sucesso'};
    final tResponseJson = jsonEncode(tResponseData);

    group('GET', () {
      test('Deve retornar dados decodificados quando o status code for 200', () async {
        when(() => mockClient.get(any(), headers: any(named: 'headers')))
            .thenAnswer((_) async => http.Response(tResponseJson, 200));

        final result = await service.get(tPath);

        expect(result, equals(tResponseData));
        verify(() => mockClient.get(any())).called(1);
      });

      test('Deve lançar Exception quando a chamada ao cliente falhar', () async {
        when(() => mockClient.get(any())).thenThrow(Exception('Erro de rede'));

        expect(() => service.get(tPath), throwsA(isA<Exception>()));
      });
    });

    group('POST', () {
      test('Deve enviar o body corretamente e retornar dados em caso de sucesso', () async {
        final tBody = {'id': 1};
        when(() => mockClient.post(
          any(),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
        )).thenAnswer((_) async => http.Response(tResponseJson, 201));

        final result = await service.post(tPath, data: tBody);

        expect(result, equals(tResponseData));
        verify(() => mockClient.post(
          any(),
          body: jsonEncode(tBody),
          headers: any(
            named: 'headers',
            that: containsPair('Content-Type', 'application/json'),
          ),
        )).called(1);
      });
    });

    group('PUT', () {
      test('Deve executar o PUT corretamente', () async {
        // Arrange
        when(() => mockClient.put(any(), body: any(named: 'body'), headers: any(named: 'headers')))
            .thenAnswer((_) async => http.Response(tResponseJson, 200));

        // Act
        final result = await service.put(tPath, data: {'name': 'novo'});

        // Assert
        expect(result, equals(tResponseData));
        verify(() => mockClient.put(any(), body: any(named: 'body'), headers: any(named: 'headers'))).called(1);
      });
    });

    group('DELETE', () {
      test('Deve executar o DELETE corretamente', () async {
        // Arrange
        when(() => mockClient.delete(any(), body: any(named: 'body'), headers: any(named: 'headers')))
            .thenAnswer((_) async => http.Response(tResponseJson, 200));

        // Act
        final result = await service.delete(tPath);

        // Assert
        expect(result, equals(tResponseData));
        verify(() => mockClient.delete(any(), body: any(named: 'body'), headers: any(named: 'headers'))).called(1);
      });
    });
  });
}