import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';
import '../../Model/SevicesModel.dart';
import '../../Model/SubServiceModel.dart';
import '../../Model/TimeModel.dart';
import '../../res/color.dart';
import '../../res/components/custom_text_button.dart';
import '../../utils/SizeConfig.dart';
import 'main_screen.dart';

class ScheduleRepairEP extends StatefulWidget {
  final ServicesModel? selectedService;
  final SubServiceModel? selectedSubService;
  final List<String>? base64Images;
  final String? notes;
  final int? totalPrice;
  final int? smallQ;
  final int? mediumQ;
  final int? largeQ;
  final List<ServicesModel>? servicesList;
  final List<SubServiceModel>? subsList;
  final int? ladderLength;

  const ScheduleRepairEP(
      {Key? key,
      this.base64Images,
      this.notes,
      this.selectedService,
      this.selectedSubService,
      this.totalPrice,
      this.largeQ,
      this.mediumQ,
      this.smallQ,
      this.ladderLength,
      this.subsList,
      this.servicesList})
      : super(key: key);

  @override
  _ScheduleRepairEPState createState() => _ScheduleRepairEPState();
}

class _ScheduleRepairEPState extends State<ScheduleRepairEP> {
  DateTime selectedDay = DateTime.now();

  List<TimeModel> timings = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomGoogleFontText(
          text: 'Schedule',
          size: SizeConfig.width17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () async {
                final r1 = await showOkCancelAlertDialog(
                  context: context,
                  title: 'Confirmation',
                  message: 'Are you sure you want to exit?',
                  okLabel: 'Yes',
                  cancelLabel: 'No',
                );

                log(r1.index.toString());
                if (r1.index == 0) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const ServiceMain(
                                selectedIndex: 0,
                              )),
                      (route) => false);
                }

                //Navigator.of(context).pop();
              })
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: SizeConfig.height40,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: CustomGoogleFontText(
              text: 'Select Date & Time',
              size: SizeConfig.width15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: SizeConfig.height210,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CalendarDatePicker(
              selectableDayPredicate: (value) {
                return value.day < DateTime.now().day &&
                        value.month < DateTime.now().month &&
                        value.year < DateTime.now().year
                    ? false
                    : true;
              },
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
              onDateChanged: (value) {
                setState(() {
                  selectedDay = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 0),
            child: Divider(
              color: Colors.grey.shade300,
              thickness: 1.0,
              indent: 10,
              endIndent: 10,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.red,
          ),
          SizedBox(
            height: SizeConfig.height10,
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
            right: SizeConfig.width20,
            left: SizeConfig.width20,
            bottom: SizeConfig.height25,
            top: SizeConfig.height10),
        child: CustomTextButton(
          onPressed: () async {
            int index =
                timings.indexWhere((element) => element.isSelected == true);
            if (index > -1) {
            } else {
              final result = await showOkAlertDialog(
                context: context,
                title: 'Oops!',
                message: 'Please select a time slot',
                //sonWillPop: () => Future.value(false)
              );
              log(result.toString());
            }
          },
        ),
      ),
    );
  }

  Widget timeContainer({required String time, required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border(
            bottom: BorderSide(
                color:
                    isSelected ? AppColors.primaryColor : Colors.grey.shade200,
                width: 1),
            left: BorderSide(
                color:
                    isSelected ? AppColors.primaryColor : Colors.grey.shade200,
                width: 1),
            top: BorderSide(
                color:
                    isSelected ? AppColors.primaryColor : Colors.grey.shade200,
                width: 1),
            right: BorderSide(
                color:
                    isSelected ? AppColors.primaryColor : Colors.grey.shade200,
                width: 1),
          )),
      alignment: Alignment.center,
      child: CustomGoogleFontText(
        text: time,
        color: isSelected ? Colors.white : Colors.black,
        size: SizeConfig.width13,
      ),
    );
  }
}
