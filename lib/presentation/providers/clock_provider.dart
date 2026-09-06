import 'package:flutter/material.dart';
import '../../domain/entities/timezone_entity.dart';
import '../../domain/usecases/get_current_time_usecase.dart';
import '../../data/datasources/timezone_local_datasource.dart';

class ClockProvider extends ChangeNotifier {
  final TimeZoneLocalDataSource dataSource;
  final GetCurrentTimeUseCase getCurrentTimeUseCase;

  List<TimeZone> _timeZones = [];
  List<ClockTime> _clockTimes = [];
  bool _isLoading = false;
  late DateTime _lastUpdate;

  ClockProvider({
    required this.dataSource,
    required this.getCurrentTimeUseCase,
  }) {
    _lastUpdate = DateTime.now();
    _initialize();
  }

  List<TimeZone> get timeZones => _timeZones;
  List<ClockTime> get clockTimes => _clockTimes;
  bool get isLoading => _isLoading;

  Future<void> _initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      _timeZones = await dataSource.getTimeZones();
      await _updateClockTimes();

      // Atualizar a cada segundo
      Future.doWhile(() async {
        await Future.delayed(const Duration(seconds: 1));
        await _updateClockTimes();
        return true;
      });
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _updateClockTimes() async {
    final selectedTimeZoneIds = await dataSource.getSelectedTimeZones();
    final selectedTimeZones = _timeZones
        .where((tz) => selectedTimeZoneIds.contains(tz.id))
        .toList();

    _clockTimes = [];
    for (final timeZone in selectedTimeZones) {
      final clockTime = await getCurrentTimeUseCase(timeZone);
      _clockTimes.add(clockTime);
    }

    _lastUpdate = DateTime.now();
    notifyListeners();
  }

  Future<void> updateSelectedTimeZones(List<String> timeZoneIds) async {
    await dataSource.saveSelectedTimeZones(timeZoneIds);
    await _updateClockTimes();
  }

  Future<void> refresh() async {
    await _updateClockTimes();
  }
}
