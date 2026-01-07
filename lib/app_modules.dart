import 'package:get_it/get_it.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/home_module.dart';

final getIt = GetIt.instance;

Future<void> setDependencies() async {
  registerHomeModule(getIt);
}