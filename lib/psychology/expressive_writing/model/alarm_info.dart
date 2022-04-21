// ignore_for_file: unnecessary_this

class AlarmInfo {
  bool isActive;
  final String timeOfDay;
  final DateTime dateTime;
  final String tilte;
  final List<String> values;

  AlarmInfo({
    required this.timeOfDay,
    this.isActive = true,
    required this.dateTime,
    required this.tilte,
    required this.values,
  });

  factory AlarmInfo.fromJson(Map<String, dynamic> json) {
    return AlarmInfo(
      isActive: json['isActive'],
      timeOfDay: json['timeOfDay'],
      dateTime: DateTime.parse(json['dateTime']),
      tilte: json['title'],
      values: List<String>.from(json['values']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isActive': isActive,
      'timeOfDay': timeOfDay,
      'dateTime': dateTime.toIso8601String(),
      'title': tilte,
      'values': values as List<dynamic>
    };
  }

  void toggleDone() {
    isActive = !isActive;
  }
}
