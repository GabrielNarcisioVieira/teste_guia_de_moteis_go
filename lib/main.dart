import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/app_modules.dart';
import 'package:teste_tecnico_guia_de_moteis/app_widget.dart';

void main() async {
  await setDependencies();
  runApp(const AppWidget());
}