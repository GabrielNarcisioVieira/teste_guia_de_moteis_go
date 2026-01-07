import 'package:teste_tecnico_guia_de_moteis/core/services/http_service.dart';

class HomeRepository{
  final HttpService _httpService;

  HomeRepository(HttpService httpService) : _httpService = httpService;
}