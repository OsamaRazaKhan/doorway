import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/view_model/schedule_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTimeContainer extends StatefulWidget {
  final int index;
  const CustomTimeContainer({
    super.key,
    required this.index,
  });

  @override
  State<CustomTimeContainer> createState() => _CustomTimeContainerState();
}

class _CustomTimeContainerState extends State<CustomTimeContainer> {
  @override
  Widget build(BuildContext context) {
    final scheduleViewModel = Provider.of<ScheduleViewModel>(
      context,
    );
    return Container(
        decoration: BoxDecoration(
            color: scheduleViewModel.timings[widget.index].isSelected
                ? AppColors.primaryColor
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              bottom: BorderSide(
                  color: scheduleViewModel.timings[widget.index].isSelected
                      ? AppColors.primaryColor
                      : Colors.grey.shade200,
                  width: 1),
              left: BorderSide(
                  color: scheduleViewModel.timings[widget.index].isSelected
                      ? AppColors.primaryColor
                      : Colors.grey.shade200,
                  width: 1),
              top: BorderSide(
                  color: scheduleViewModel.timings[widget.index].isSelected
                      ? AppColors.primaryColor
                      : Colors.grey.shade200,
                  width: 1),
              right: BorderSide(
                  color: scheduleViewModel.timings[widget.index].isSelected
                      ? AppColors.primaryColor
                      : Colors.grey.shade200,
                  width: 1),
            )),
        alignment: Alignment.center,
        child: CustomGoogleFontText(
            text: scheduleViewModel.timings[widget.index].time,
            color: scheduleViewModel.timings[widget.index].isSelected
                ? Colors.white
                : Colors.black));
  }
}
