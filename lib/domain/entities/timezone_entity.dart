class TimeZone {
  final String id;
  final String name;
  final String city;
  final int offset; // UTC offset em horas

  TimeZone({
    required this.id,
    required this.name,
    required this.city,
    required this.offset,
  });
}

class ClockTime {
  final String timeZoneId;
  final String city;
  final DateTime dateTime;
  final String formattedTime; // HH:mm:ss
  final String formattedDate; // dd/MM/yyyy

  ClockTime({
    required this.timeZoneId,
    required this.city,
    required this.dateTime,
    required this.formattedTime,
    required this.formattedDate,
  });
}
