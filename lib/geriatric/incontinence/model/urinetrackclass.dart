class UrineTrackClass {
  late String id;
  late String urineevent;
  late String date;
  late String scale;

  UrineTrackClass(
    this.urineevent,
    this.date,
    this.scale,
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'urineevent': urineevent,
      'date': date,
      'scale': scale,
    };
    return map;
  }

  UrineTrackClass.fromMap(Map<String, dynamic> map) {
    urineevent = map['urineevent'];
    date = map['date'];
    scale = map['scale'];
  }
}
