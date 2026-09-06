import '../../domain/entities/timezone_entity.dart';

abstract class TimeZoneLocalDataSource {
  Future<List<TimeZone>> getTimeZones();
  Future<void> saveSelectedTimeZones(List<String> timeZoneIds);
  Future<List<String>> getSelectedTimeZones();
}

class TimeZoneLocalDataSourceImpl implements TimeZoneLocalDataSource {
  static const String _selectedTimeZonesKey = 'selected_timezones';

  @override
  Future<List<TimeZone>> getTimeZones() async {
    // Lista padrão de fusos horários
    return [
      TimeZone(
        id: 'UTC',
        name: 'Coordinated Universal Time',
        city: 'Londres',
        offset: 0,
      ),
      TimeZone(
        id: 'EST',
        name: 'Eastern Standard Time',
        city: 'Nova York',
        offset: -5,
      ),
      TimeZone(
        id: 'CST',
        name: 'Central Standard Time',
        city: 'Chicago',
        offset: -6,
      ),
      TimeZone(
        id: 'MST',
        name: 'Mountain Standard Time',
        city: 'Denver',
        offset: -7,
      ),
      TimeZone(
        id: 'PST',
        name: 'Pacific Standard Time',
        city: 'Los Angeles',
        offset: -8,
      ),
      TimeZone(
        id: 'BRT',
        name: 'Brasília Time',
        city: 'São Paulo',
        offset: -3,
      ),
      TimeZone(
        id: 'IST',
        name: 'Indian Standard Time',
        city: 'Índia',
        offset: 5.5 as int,
      ),
      TimeZone(
        id: 'JST',
        name: 'Japan Standard Time',
        city: 'Tóquio',
        offset: 9,
      ),
      TimeZone(
        id: 'AEST',
        name: 'Australian Eastern Standard Time',
        city: 'Sydney',
        offset: 10,
      ),
      TimeZone(
        id: 'NZST',
        name: 'New Zealand Standard Time',
        city: 'Auckland',
        offset: 12,
      ),
    ];
  }

  @override
  Future<void> saveSelectedTimeZones(List<String> timeZoneIds) async {
    // Implementar com Hive ou SharedPreferences
    // await _box.put(_selectedTimeZonesKey, timeZoneIds);
  }

  @override
  Future<List<String>> getSelectedTimeZones() async {
    // Implementar com Hive ou SharedPreferences
    // return List<String>.from(await _box.get(_selectedTimeZonesKey, defaultValue: []));
    return ['UTC', 'BRT', 'EST', 'JST'];
  }
}
