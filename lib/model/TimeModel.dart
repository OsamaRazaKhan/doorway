class TimeModel {
  late String time;
  late bool isSelected;

  TimeModel({required this.time, this.isSelected = false});

  TimeModel.fromMap(Map<String, dynamic> map) {
    time = map['time']?.toString() ?? "";
    isSelected = map['isSelected'] ?? false;
  }
}
