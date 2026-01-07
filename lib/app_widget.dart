import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_tecnico_guia_de_moteis/core/enum/page_title_enum.dart';
import 'package:teste_tecnico_guia_de_moteis/core/services/http_service.dart';
import 'package:teste_tecnico_guia_de_moteis/design_system/theme/app_theme.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/view/home_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: PageTitleEnum.homePage.title,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [Provider<HttpService>(create: (_) => HttpService())],
        child: const HomeView(),
      ),
    );
  }
}