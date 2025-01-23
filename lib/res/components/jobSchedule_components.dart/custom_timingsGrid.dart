import 'dart:async';

import 'package:doorway/res/components/global_components/custom_showLoading.dart';
import 'package:doorway/res/components/global_components/custom_somethingWrong.dart';
import 'package:doorway/res/components/jobSchedule_components.dart/custom_timeContainer.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/schedule_view_model.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class CustomTimingsGrid extends StatefulWidget {
  const CustomTimingsGrid({super.key});

  @override
  State<CustomTimingsGrid> createState() => _CustomTimingsGridState();
}

class _CustomTimingsGridState extends State<CustomTimingsGrid> {
  bool showLoading = true;
  @override
  void initState() {
    super.initState();
    final scheduleViewModel = Provider.of<ScheduleViewModel>(
      context,
      listen: false,
    );
    Map<String, dynamic> data = {
      'vend_id': '4',
    };
    if (scheduleViewModel.timings.isEmpty) {
      scheduleViewModel.GetTimings(data);
    }
    Timer(const Duration(seconds: 20), () {
      if (scheduleViewModel.timings.isEmpty) {
        setState(() {
          showLoading = false; // Stop showing the loading indicator
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheduleViewModel = Provider.of<ScheduleViewModel>(
      context,
    );
    return SizedBox(
      height: SizeConfig.height340,
      child: showLoading && scheduleViewModel.timings.isEmpty
          ? const CustomShowLoading(title: "Loading vendor's timings...")
          : scheduleViewModel.timings.isEmpty
              ? const CustomSomethingWrong() // Empty container after 20 seconds
              : ModalProgressHUD(
                  inAsyncCall: scheduleViewModel.Loading,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: SizeConfig.width80,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2.0,
                    ),
                    itemCount: scheduleViewModel.timings.length,
                    //physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          scheduleViewModel.setSelectedTiming(index);
                        },
                        child: CustomTimeContainer(
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
