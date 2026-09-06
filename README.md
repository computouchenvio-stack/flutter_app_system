# Flutter App System - Windows & Android

Sistema multiplataforma desenvolvido em Flutter com suporte completo para Windows e Android.

## 🚀 Características

- ✅ Suporte nativo para Windows e Android
- ✅ Arquitetura limpa com separação de camadas
- ✅ State management com Provider e Riverpod
- ✅ HTTP client com Dio e Retrofit
- ✅ Banco de dados local com Hive
- ✅ Navegação com GoRouter
- ✅ Logging e tratamento de erros
- ✅ Validação de dados

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                 # Entrada da aplicação
├── config/
│   └── app_config.dart      # Configurações globais
├── data/
│   ├── datasources/         # Camada de dados (API, BD local)
│   └── repositories/        # Repositórios (implementação)
├── domain/
│   ├── entities/            # Modelos de domínio
│   └── usecases/            # Casos de uso
└── presentation/
    ├── pages/               # Telas
    ├── providers/           # State management
    └── widgets/             # Componentes reutilizáveis
```

## 📋 Pré-requisitos

- Flutter 3.0+
- Dart 3.0+
- Android SDK (para Android)
- Windows SDK (para Windows)

## 🔧 Instalação

### 1. Clone o repositório

```bash
git clone https://github.com/computouchenvio-stack/flutter_app_system.git
cd flutter_app_system
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Gere código gerado

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🎯 Executar o App

### Android

```bash
flutter run -d android
```

### Windows

```bash
flutter run -d windows
```

## 🏗️ Arquitetura

O projeto segue a **Clean Architecture** com camadas bem definidas:

### Presentation Layer
- UI Components
- Pages/Screens
- State Management (Provider/Riverpod)

### Domain Layer
- Entities
- Repositories (interfaces)
- Use Cases

### Data Layer
- Data Sources (Local/Remote)
- Repositories (implementação)
- Models

## 📦 Dependências Principais

- **provider**: State management
- **riverpod**: State management alternativo
- **dio**: HTTP client
- **hive**: Banco de dados local
- **go_router**: Navegação
- **get_it**: Service locator

## 📝 Padrões de Código

### Exemplo de Use Case

```dart
class GetUserUseCase {
  Future<User> call(String userId) async {
    return await repository.getUser(userId);
  }
}
```

### Exemplo de Provider

```dart
class UserProvider extends ChangeNotifier {
  User? _user;
  
  Future<void> loadUser(String userId) async {
    _user = await getUserUseCase(userId);
    notifyListeners();
  }
}
```

## 🧪 Testes

```bash
flutter test
```

## 🚀 Build Release

### Android APK

```bash
flutter build apk --release
```

### Android App Bundle

```bash
flutter build appbundle --release
```

### Windows

```bash
flutter build windows --release
```

## 📝 Licença

MIT License - veja o arquivo LICENSE para mais detalhes

## 👨‍💻 Autor

**computouchenvio-stack**

## 🤝 Contribuindo

Pull requests são bem-vindos! Para mudanças maiores, abra uma issue primeiro para discutir as alterações propostas.

---

**Desenvolvido com ❤️ em Flutter**
