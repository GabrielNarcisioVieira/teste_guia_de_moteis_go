
import 'dart:convert';
import 'package:teste_tecnico_guia_de_moteis/core/helpers/http_helper.dart';
import 'package:teste_tecnico_guia_de_moteis/core/interfaces/http_service_interface.dart';
import 'package:http/http.dart' as http;

class HttpService implements IHttpService {
  final http.Client _client = http.Client();

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final uri = HttpHelper.buildUri(path, queryParameters);
      final response = await _client.get(uri);
      return HttpHelper.handleResponse(response);
    } catch (e) {
      throw Exception('Erro em HttpService.get: $e');
    }
  }

  @override
  Future post(String path, {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final uri = HttpHelper.buildUri(path, queryParameters);
      final response = await _client.post(
        uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      return HttpHelper.handleResponse(response);
    } catch (e) {
      throw Exception('Erro em HttpService.post: $e');
    }
  }

  @override
  Future put(String path, {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final uri = HttpHelper.buildUri(path, queryParameters);
      final response = await _client.put(
        uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      );
      return HttpHelper.handleResponse(response);
    } catch (e) {
      throw Exception('Erro em HttpService.put: $e');
    }
  }

  @override
  Future delete(String path, {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final uri = HttpHelper.buildUri(path, queryParameters);
      final response = await _client.delete(
        uri,
        body: data != null ? jsonEncode(data) : null,
        headers: {'Content-Type': 'application/json'},
      );
      return HttpHelper.handleResponse(response);
    } catch (e) {
      throw Exception('Erro em HttpService.delete: $e');
    }
  }
}