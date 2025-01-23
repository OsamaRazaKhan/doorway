import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/schedule_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomScheduleContainerJobSummary extends StatefulWidget {
  const CustomScheduleContainerJobSummary({super.key});

  @override
  State<CustomScheduleContainerJobSummary> createState() =>
      _CustomScheduleContainerJobSummaryState();
}

class _CustomScheduleContainerJobSummaryState
    extends State<CustomScheduleContainerJobSummary> {
  @override
  Widget build(BuildContext context) {
    final scheduleViewModel = Provider.of<ScheduleViewModel>(
      context,
    );
    return Container(
      height: SizeConfig.height50,
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.width20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(3.0, 3.0),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.width20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomGoogleFontText(
              text:
                  'Time : ${scheduleViewModel.timings[scheduleViewModel.selectedTimingIndex].time}',
              size: SizeConfig.width14,
            ),
            CustomGoogleFontText(
              text:
                  'Date : ${scheduleViewModel.selectedDay.day}/${scheduleViewModel.selectedDay.month}/${scheduleViewModel.selectedDay.year}',
              size: SizeConfig.width14,
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }
}
