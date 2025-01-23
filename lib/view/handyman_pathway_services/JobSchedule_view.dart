import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/jobSchedule_components.dart/custom_calendarDatePicker.dart';
import 'package:doorway/res/components/jobSchedule_components.dart/custom_timingsGrid.dart';
import 'package:doorway/view_model/schedule_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/SizeConfig.dart';

class HandyManJobSchedule extends StatefulWidget {
  const HandyManJobSchedule({
    Key? key,
  }) : super(key: key);

  @override
  _JobScheduleState createState() => _JobScheduleState();
}

class _JobScheduleState extends State<HandyManJobSchedule> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: shopAppbarBack('Schedule', context, isBackEnable: true),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: SizeConfig.height40,
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: CustomGoogleFontText(
                text: 'Select Date & Time',
                size: SizeConfig.width15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const CustomCalendarDatePicker(),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.width10, right: SizeConfig.width10, top: 0),
            child: Divider(
              color: Colors.grey.shade300,
              thickness: 1.0,
              indent: 10,
              endIndent: 10,
            ),
          ),
          const CustomTimingsGrid(),
          SizedBox(
            height: SizeConfig.height10,
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: CustomElevatedButton(
            title: 'Continue',
            onPress: () async {
              final scheduleViewModel = Provider.of<ScheduleViewModel>(
                context,
                listen: false,
              );
              if (scheduleViewModel.selectedTimingIndex != -1) {
                scheduleViewModel.moveToJobSummary(context);
              } else {
                await showOkAlertDialog(
                  context: context,
                  title: 'Oops!',
                  message: 'Please selelct Time',
                  //onWillPop: () => Future.value(false)
                );
              }
            }),
      ),
    );
  }
}
