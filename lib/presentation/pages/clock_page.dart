import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/clock_provider.dart';
import '../widgets/digital_clock_widget.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relógio Digital - Múltiplos Fusos'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ClockProvider>().refresh();
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _showTimeZoneSelector(context);
            },
          ),
        ],
      ),
      body: Consumer<ClockProvider>(
        builder: (context, clockProvider, child) {
          if (clockProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (clockProvider.clockTimes.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.schedule_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nenhum fuso horário selecionado',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      _showTimeZoneSelector(context);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Adicionar Fusos Horários'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => clockProvider.refresh(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: clockProvider.clockTimes.length,
                itemBuilder: (context, index) {
                  final clockTime = clockProvider.clockTimes[index];
                  return DigitalClockWidget(
                    time: clockTime.formattedTime,
                    date: clockTime.formattedDate,
                    city: clockTime.city,
                    timeZoneId: clockTime.timeZoneId,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showTimeZoneSelector(BuildContext context) {
    final clockProvider = context.read<ClockProvider>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Selecionar Fusos Horários'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: clockProvider.timeZones.length,
                  itemBuilder: (context, index) {
                    final timeZone = clockProvider.timeZones[index];
                    final isSelected =
                        clockProvider.clockTimes.any((ct) => ct.timeZoneId == timeZone.id);

                    return CheckboxListTile(
                      title: Text('${timeZone.city} (${timeZone.id})'),
                      subtitle: Text(
                        '${timeZone.name}\nUTC ${timeZone.offset > 0 ? '+' : ''}${timeZone.offset}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      value: isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          // Atualizar seleção
                        });
                      },
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Salvar seleção
                    Navigator.pop(context);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
