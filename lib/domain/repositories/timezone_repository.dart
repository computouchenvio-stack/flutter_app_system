import '../entities/timezone_entity.dart';

abstract class TimeZoneRepository {
  Future<List<TimeZone>> getTimeZones();
  Future<void> saveSelectedTimeZones(List<String> timeZoneIds);
  Future<List<String>> getSelectedTimeZones();
}
