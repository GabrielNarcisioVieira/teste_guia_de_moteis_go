# 🏨 Guia de Motéis - Teste Técnico Flutter

Este projeto é uma aplicação mobile robusta desenvolvida em **Flutter** como parte de um desafio técnico. A aplicação foca na listagem de motéis e suas respectivas suítes, implementando uma lógica de filtragem profunda e uma interface de usuário rica em feedbacks visuais.

---

## 🚀 Funcionalidades Principais

* **Listagem Dinâmica:** Consumo de API REST para exibição de motéis e suítes.
* **Filtros de Suíte:** Lógica de filtragem avançada que atua no nível da suíte (Piscina, Hidro, Sauna, Desconto, etc.).
* **Cálculo de Menor Preço:** Identificação automática do menor valor de entrada entre todos os períodos de todas as suítes de um motel.
* **UX/UI Premium:**
    * **Shimmer Effect:** Esqueleto de carregamento (Skeleton) para uma transição suave de dados.
    * **Pull-to-Refresh:** Atualização manual da listagem através do gesto de deslizar.
    * **Empty State:** Tela de feedback customizada com opção de limpar filtros quando não há resultados.
    * **Design System:** Tematização via extensões de contexto (ThemeExtension) para cores e tipografia consistentes.

---

## 🏗️ Arquitetura e Organização

O projeto utiliza os princípios da **Clean Architecture** adaptados ao padrão **MVVM (Model-View-ViewModel)**, garantindo a separação de responsabilidades e alta testabilidade.

### Estrutura de Pastas:
- **lib/core:** Base do projeto (Models, Services, Extensions, Utils, Enums e Helpers).
- **lib/design_system:** Biblioteca de componentes visuais, widgets customizados e definições de tema.
- **lib/modules:** Divisão por módulos da aplicação.
    - **Repository:** Comunicação com o HttpService e tratamento de erros.
    - **ViewModel:** Gerenciamento de estado (ChangeNotifier) e lógica de filtragem.
    - **View:** Interface do usuário (UI) e widgets de tela.

---

## 🛠️ Tecnologias e Bibliotecas

* **Estado:** ChangeNotifier + ListenableBuilder.
* **Injeção de Dependência:** GetIt (Service Locator).
* **Consumo de API:** http.
* **UI & Estilização:** shimmer, flutter_svg, google_fonts, intl.
* **Testes:** flutter_test, mocktail, network_image_mock.

---

## 🧪 Testes e Cobertura

O projeto foi construído com foco em **testabilidade**, possuindo uma suite de testes que cobre Unitários (Core/Model/Service), de Widget (Design System) e de Integração (ViewModel).

### Rodar os testes:
Para executar todos os testes unitários e de widget:
flutter test

### Gerar relatório de cobertura:
Para gerar o relatório detalhado de cobertura (necessário ter o lcov instalado):

1. Executa os testes e gera os dados:
flutter test --coverage

2. Gera o HTML (Opcional):
genhtml coverage/lcov.info -o coverage/html

3. Abrir no navegador (Windows):
start coverage/html/index.html

Nota: Os testes de UI utilizam mockNetworkImagesFor para garantir que o layout seja testado sem depender de conexões reais com a internet.

---

## 🏁 Como Iniciar o Projeto

1. **Pré-requisitos:** Ter o Flutter instalado na versão estável mais recente.
2. **Clone o repo:** git clone https://github.com/seu-usuario/teste_tecnico_guia_de_moteis.git
3. **Instale as dependências:**
flutter pub get
4. **Execute a aplicação:**
flutter run

---

## 🎨 Componentes do Design System

- **CustomSwitchButton:** Alternância animada com AnimatedAlign entre as opções de reserva.
- **CustomLargeMotelCard:** Componente principal que integra o carrossel de suítes e informações de avaliação.
- **CustomFilterList:** Cabeçalho persistente (Sliver) que facilita a filtragem rápida.
- **AppThemeExtension:** Extensão que permite acessar o tema de forma limpa: context.primaryColor ou context.headlineSmall.

---
Desenvolvido por Gabriel - Janeiro de 2026.
