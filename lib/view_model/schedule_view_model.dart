import 'package:doorway/global.dart';
import 'package:doorway/model/TimeModel.dart';
import 'package:doorway/repository/schedule_repository.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/utils/utils.dart';
import 'package:flutter/material.dart';

class ScheduleViewModel with ChangeNotifier {
  final _scheduleRepo = ScheduleRepository();
  int selectedTimingIndex = -1;
  DateTime selectedDay = DateTime.now();

  List<TimeModel> timings = [];

  bool _loading = false;
  bool get Loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSelectedTiming(int index) {
    if (index != selectedTimingIndex) {
      timings[index].isSelected = true;
      if (selectedTimingIndex != -1) {
        timings[selectedTimingIndex].isSelected = false;
      }
      selectedTimingIndex = index;
      notifyListeners();
    }
  }

  setSelectedDay(DateTime dateTime) {
    selectedDay = dateTime;
    notifyListeners();
  }

  void moveToJobSummary(BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutesName.JobSummary_view,
    );
  }

  Future<void> GetTimings(dynamic data) async {
    try {
      final value = await _scheduleRepo.GetTimings(data);
      if (value['code'] == "201" || value['code'] == 201) {
        for (var item in value['data']) {
          timings.add(
            TimeModel.fromMap(item),
          );
        }
        notifyListeners(); // Debugging output
      }
    } catch (error, stackTrace) {
      // Handle the error gracefully
    }
  }
}
