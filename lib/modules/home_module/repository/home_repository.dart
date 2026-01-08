import 'package:teste_tecnico_guia_de_moteis/core/architecture/result_architecture.dart';
import 'package:teste_tecnico_guia_de_moteis/core/constants/api_consts.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/core/services/http_service.dart';

class HomeRepository {
  final HttpService _httpService;

  HomeRepository(HttpService httpService) : _httpService = httpService;

  Future<Result<List<MotelModel>, Exception>> getMotels() async {
    try {
      final response = await _httpService.get(ApiConsts.urlPath);

      if (response is Map && response['sucesso'] == true) {
        final List moteis = response['data']['moteis'] ?? [];
        var motels = moteis.map((m) => MotelModel.fromJson(m)).toList();
        return Success(motels);
      }

      return Failure(Exception(response['mensagem'] ?? 'Erro desconhecido.'));
    } catch (e) {
      return Failure(Exception('Ocorreu uma falha inesperada. \nMensagem: $e'));
    }
  }
}
