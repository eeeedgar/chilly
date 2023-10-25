class Event {
  final String title;
  final String address;
  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;
  final List<String> tags;

  Event({
    required this.address,
    required this.dateTimeStart,
    required this.dateTimeEnd,
    required this.tags,
    required this.title,
  });

  String getDuration() {
    return '${getDate(dateTimeStart)} - ${getDate(dateTimeEnd)}';
  }

  String getDate(DateTime dateTime) {
    String minutes = '${dateTime.minute}';
    if (dateTime.minute / 10 == 0) {
      minutes = '0${dateTime.minute}';
    }
    return '${dateTime.month}/${dateTime.day} ${dateTime.hour}:$minutes';
  }
}
