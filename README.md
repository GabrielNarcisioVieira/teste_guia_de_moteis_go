🏨 Guia de Motéis - Teste Técnico Flutter
Este projeto é uma aplicação mobile desenvolvida em Flutter como parte de um desafio técnico. O objetivo é listar motéis e suas respectivas suítes, aplicando filtros avançados, cálculos de preços dinâmicos e uma experiência de usuário fluida com estados de carregamento e feedback visual.

🚀 Funcionalidades
Listagem Dinâmica: Exibição de motéis e suítes consumindo uma API REST.

Filtros Avançados: Filtragem profunda que atua diretamente nas suítes (Piscina, Hidro, Desconto, etc.).

Cálculo de Preços: Identificação automática do menor valor de entrada entre todas as suítes disponíveis.

UX/UI Premium: * Efeito Shimmer durante o carregamento.

Pull-to-Refresh para atualizar os dados.

Empty State customizado para buscas sem resultados.

Design System próprio com suporte a extensões de tema.

🏗️ Arquitetura e Organização
O projeto segue os princípios da Clean Architecture e do padrão MVVM (Model-View-ViewModel), garantindo separação de responsabilidades e facilidade para testes unitários.

Plaintext

lib/
├── core/              # Lógicas globais, modelos, serviços e extensões
├── design_system/     # Componentes de UI reaproveitáveis, cores e temas
└── modules/           # Módulos da aplicação (ex: Home)
├── repository/   # Comunicação com a fonte de dados
├── view/         # Telas (Widgets de alto nível)
└── view_model/   # Lógica de estado e regras de negócio da tela
🛠️ Tecnologias e Dependências
Gerenciamento de Estado: ChangeNotifier com ListenableBuilder.

Injeção de Dependência: GetIt.

Consumo de API: http.

Animações e UI: shimmer, flutter_svg, google_fonts.

Testes: flutter_test, mocktail, network_image_mock.

🏁 Como Rodar o Projeto
Pré-requisitos
Flutter instalado (versão estável mais recente recomendada).

Um emulador (Android/iOS) ou dispositivo físico conectado.

Instalação
Clone o repositório:

Bash

git clone https://github.com/seu-usuario/teste_tecnico_guia_de_moteis.git
Entre na pasta do projeto:

Bash

cd teste_tecnico_guia_de_moteis
Instale as dependências:

Bash

flutter pub get
Execute o app:

Bash

flutter run
🧪 Testes e Cobertura
O projeto foi desenvolvido com foco em alta testabilidade, cobrindo desde modelos de dados até interações de interface. Atualmente, o projeto mantém uma meta de +70% de cobertura.

Rodar todos os testes
Bash

flutter test
Gerar relatório de cobertura (LCOV)
Para verificar a cobertura detalhada, execute:

Bash

# 1. Gera o arquivo de cobertura
flutter test --coverage

# 2. Gera o HTML (Requer lcov instalado)
genhtml coverage/lcov.info -o coverage/html

# 3. Abrir no navegador (Windows)
start coverage/html/index.html
Nota: Os testes de widget utilizam mockNetworkImagesFor para simular o carregamento de imagens de rede sem necessidade de conexão real.

🎨 Design System
Os componentes foram criados de forma modular no diretório design_system.

CustomSwitchButton: Alternância entre "ir agora" e "ir outro dia" com animações suaves.

CustomLargeMotelCard: Card principal que encapsula o carrossel de suítes.

AppThemeExtension: Facilita o acesso às cores e estilos de texto via context.primaryColor, etc.

Desenvolvido por Gabriel – 2026.
