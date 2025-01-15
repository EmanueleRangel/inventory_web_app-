lib/
├── main.dart               # Arquivo principal, ponto de entrada
├── config/                 # Configurações globais (e.g., configurações de API, constantes)
│   └── api_config.dart     # Configuração de endpoints de API, por exemplo
│
├── models/                 # Modelos de dados
│   ├── user.dart           # Modelo de dados de usuário
│   └── item.dart           # Modelo de dados de item
│
├── screens/                # Telas da aplicação
│   ├── login_screen.dart   # Tela de login
│   ├── registration_screen.dart # Tela de cadastro de usuário
│   ├── item_registration_screen.dart # Tela de cadastro de itens
│   └── user_list_screen.dart # Tela de listagem de usuários (admin)
│
├── widgets/                # Componentes reutilizáveis
│   ├── custom_text_field.dart # Campo de texto personalizado
│   └── custom_button.dart   # Botão personalizado
│
├── services/               # Lógica de negócios, comunicação com a API, etc.
│   ├── auth_service.dart   # Serviço de autenticação (login e cadastro)
│   └── item_service.dart   # Serviço para adicionar e buscar itens
│
└── utils/                  # Funções utilitárias e helpers
    ├── validators.dart     # Funções de validação
    └── formatter.dart      # Funções para formatação de dados
