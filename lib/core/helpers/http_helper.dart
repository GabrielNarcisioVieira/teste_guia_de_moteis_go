import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper{
  static Uri buildUri(String path, Map<String, dynamic>? queryParameters) {
    var uri = Uri.parse(path);
    if (queryParameters != null && queryParameters.isNotEmpty) {
      final stringQuery = queryParameters.map(
            (key, value) => MapEntry(key, value.toString()),
      );
      uri = uri.replace(queryParameters: stringQuery);
    }
    return uri;
  }

  static dynamic handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro HTTP: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}