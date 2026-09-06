# Relógio Digital com Múltiplos Fusos Horários

Recurso que exibe a hora atual em diferentes fusos horários do mundo.

## 🎯 Funcionalidades

- ✅ Exibição de horários em múltiplos fusos
- ✅ Relógio digital em tempo real (atualização por segundo)
- ✅ Seleção customizável de fusos horários
- ✅ Interface responsiva com cards animados
- ✅ Suporte a 10+ fusos horários principais
- ✅ Exibição de data em cada fuso
- ✅ Atualização automática a cada segundo
- ✅ Pull-to-refresh

## 📁 Estrutura de Arquivos

```
lib/
├── domain/
│   ├── entities/
│   │   └── timezone_entity.dart      # Entities TimeZone e ClockTime
│   ├── usecases/
│   │   └── get_current_time_usecase.dart
│   └── repositories/
│       └── timezone_repository.dart
├── data/
│   ├── datasources/
│   │   └── timezone_local_datasource.dart
│   └── repositories/
│       └── timezone_repository_impl.dart
└── presentation/
    ├── pages/
    │   └── clock_page.dart           # Página principal
    ├── providers/
    │   └── clock_provider.dart       # State management
    └── widgets/
        └── digital_clock_widget.dart # Widget do relógio
```

## 🚀 Como Usar

### 1. Integrar no App Principal

Adicionar ao `lib/main.dart`:

```dart
import 'package:provider/provider.dart';
import 'data/datasources/timezone_local_datasource.dart';
import 'domain/usecases/get_current_time_usecase.dart';
import 'presentation/providers/clock_provider.dart';
import 'presentation/pages/clock_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => ClockProvider(
          dataSource: TimeZoneLocalDataSourceImpl(),
          getCurrentTimeUseCase: GetCurrentTimeUseCase(),
        ),
        child: const ClockPage(),
      ),
    );
  }
}
```

### 2. Customizar Fusos Horários

Editar `lib/data/datasources/timezone_local_datasource.dart` e adicionar/remover fusos:

```dart
TimeZone(
  id: 'BRT',
  name: 'Brasília Time',
  city: 'São Paulo',
  offset: -3,
),
```

## 📊 Fusos Horários Suportados

| Cidade | ID | Offset |
|--------|----|---------|
| Londres | UTC | +0 |
| Nova York | EST | -5 |
| Chicago | CST | -6 |
| Denver | MST | -7 |
| Los Angeles | PST | -8 |
| São Paulo | BRT | -3 |
| Índia | IST | +5:30 |
| Tóquio | JST | +9 |
| Sydney | AEST | +10 |
| Auckland | NZST | +12 |

## 🎨 Personalização

### Cores do Card

Editar `lib/presentation/widgets/digital_clock_widget.dart`:

```dart
gradient: LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Colors.blue.shade900,  // Customizar cor superior
    Colors.blue.shade600,  // Customizar cor inferior
  ],
),
```

### Tamanho da Fonte

```dart
Text(
  time,
  style: TextStyle(
    fontSize: 48, // Aumentar/diminuir conforme necessário
    fontWeight: FontWeight.bold,
  ),
)
```

## 🔧 Persistência de Dados

Para salvar a seleção de fusos no banco de dados, descomentar em `timezone_local_datasource.dart`:

```dart
@override
Future<void> saveSelectedTimeZones(List<String> timeZoneIds) async {
  await _box.put(_selectedTimeZonesKey, timeZoneIds);
}

@override
Future<List<String>> getSelectedTimeZones() async {
  return List<String>.from(await _box.get(_selectedTimeZonesKey, defaultValue: []));
}
```

## 📱 Screenshots Esperados

- Tela com grade de relógios (2 colunas)
- Cards com gradiente azul
- Hora em formato digital (HH:mm:ss)
- Data formatada (dd/MM/yyyy)
- Botão de configurações para adicionar/remover fusos
- Pull-to-refresh para atualizar

## ⚡ Performance

- Atualização eficiente a cada segundo
- Uso de ChangeNotifier para state management
- Renderização otimizada com Consumer
- Sem rebuild desnecessário

## 🐛 Possíveis Melhorias Futuras

- Suporte a horário de verão (DST)
- Animação de transição entre fusos
- Modo escuro
- Notificações por hora
- Sincronização com servidor NTP
- Suporte a mais de 40 fusos horários

---

**Branch:** `feature/digital-clock-timezones`
