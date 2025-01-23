import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/schedule_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCalendarDatePicker extends StatefulWidget {
  const CustomCalendarDatePicker({super.key});

  @override
  State<CustomCalendarDatePicker> createState() =>
      _CustomCalendarDatePickerState();
}

class _CustomCalendarDatePickerState extends State<CustomCalendarDatePicker> {
  @override
  Widget build(BuildContext context) {
    final scheduleViewModel = Provider.of<ScheduleViewModel>(
      context,
    );
    return Container(
      height: SizeConfig.height210,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.width20),
      child: CalendarDatePicker(
        selectableDayPredicate: (value) {
          return value.day < DateTime.now().day &&
                  value.month < DateTime.now().month &&
                  value.year < DateTime.now().year
              ? false
              : true;
        },
        initialDate: scheduleViewModel.selectedDay,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
        onDateChanged: (value) {
          scheduleViewModel.setSelectedDay(value);
        },
      ),
    );
  }
}
