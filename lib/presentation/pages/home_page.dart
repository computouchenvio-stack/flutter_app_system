import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App System'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<AppProvider>(
          builder: (context, appProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bem-vindo ao App System',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Estado: ${appProvider.appState}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    appProvider.updateAppState('Atualizado!');
                  },
                  child: const Text('Atualizar Estado'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
