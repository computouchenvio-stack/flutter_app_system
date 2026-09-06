import '../../domain/entities/timezone_entity.dart';
import '../../domain/repositories/timezone_repository.dart';
import '../datasources/timezone_local_datasource.dart';

class TimeZoneRepositoryImpl implements TimeZoneRepository {
  final TimeZoneLocalDataSource localDataSource;

  TimeZoneRepositoryImpl({required this.localDataSource});

  @override
  Future<List<TimeZone>> getTimeZones() async {
    return await localDataSource.getTimeZones();
  }

  @override
  Future<void> saveSelectedTimeZones(List<String> timeZoneIds) async {
    await localDataSource.saveSelectedTimeZones(timeZoneIds);
  }

  @override
  Future<List<String>> getSelectedTimeZones() async {
    return await localDataSource.getSelectedTimeZones();
  }
}
