enum PageTitleEnum {
  homePage(title: 'Gerador de Cartas - Perfil'),
  statisticPage(title: 'Estatísticas'),
  historyPage(title: 'Histórico'),
  gamePage(title: 'Jogar');

  final String title;
  const PageTitleEnum({required this.title});
}