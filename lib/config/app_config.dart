import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/datasources/local_datasource.dart';
import '../data/repositories/app_repository.dart';
import '../presentation/providers/app_provider.dart';

class AppConfig {
  static Future<void> initialize() async {
    // Inicializar configurações do app
    // Configurar banco de dados
    // Configurar serviços
  }

  static List<ChangeNotifierProvider> get providers => [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
      ];
}
