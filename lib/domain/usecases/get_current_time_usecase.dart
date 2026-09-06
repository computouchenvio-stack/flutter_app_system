import '../entities/timezone_entity.dart';

class GetCurrentTimeUseCase {
  Future<ClockTime> call(TimeZone timeZone) async {
    final now = DateTime.now().toUtc();
    final zonedTime = now.add(Duration(hours: timeZone.offset));
    
    final formattedTime = _formatTime(zonedTime);
    final formattedDate = _formatDate(zonedTime);
    
    return ClockTime(
      timeZoneId: timeZone.id,
      city: timeZone.city,
      dateTime: zonedTime,
      formattedTime: formattedTime,
      formattedDate: formattedDate,
    );
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
  }
}
