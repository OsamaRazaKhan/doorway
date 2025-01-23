import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Model/SevicesModel.dart';
import '../../Model/SubServiceModel.dart';
import '../../res/color.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../utils/SizeConfig.dart';
import 'main_screen.dart';

class SummaryRepairEP extends StatefulWidget {
  final ServicesModel? selectedService;
  final SubServiceModel? selectedSubService;
  final List<String>? base64Images;
  final String? notes;
  final int? totalPrice;
  final DateTime? selectedDay;
  final String? time;
  final int? smallQ;
  final int? mediumQ;
  final int? largeQ;
  final List<SubServiceModel>? subsList;
  final List<ServicesModel>? servicesList;
  final int? ladderLength;

  const SummaryRepairEP(
      {Key? key,
      this.selectedService,
      this.selectedSubService,
      this.base64Images,
      this.notes,
      this.totalPrice,
      this.selectedDay,
      this.time,
      this.largeQ,
      this.mediumQ,
      this.ladderLength,
      this.servicesList,
      this.subsList,
      this.smallQ})
      : super(key: key);

  @override
  _SummaryRepairEPState createState() => _SummaryRepairEPState();
}

class _SummaryRepairEPState extends State<SummaryRepairEP> {
  int smallQ = 0;
  int mediumQ = 0;
  int largeQ = 0;

  @override
  void initState() {
    if (widget.smallQ != null) {
      smallQ = widget.smallQ!;
    }
    if (widget.mediumQ != null) {
      mediumQ = widget.mediumQ!;
    }
    if (widget.largeQ != null) {
      largeQ = widget.largeQ!;
    }
    super.initState();
  }

  int getGridviewSize() {
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomGoogleFontText(
            text: 'Summary',
            color: Colors.black,
            size: SizeConfig.width17,
            fontWeight: FontWeight.bold,
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
        body: Container(
          height: 50,
          width: 50,
          color: Colors.red,
        ),
        bottomSheet: Container(
          color: Colors.white,
          child: GestureDetector(
            onTap: () async {},
            child: Container(
                margin: EdgeInsets.only(
                  right: SizeConfig.width20,
                  left: SizeConfig.width20,
                  bottom: SizeConfig.height25,
                ),
                height: SizeConfig.height35,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor),
                child: Center(
                  child: CustomGoogleFontText(
                    text: 'Continue',
                    color: Colors.white,
                    size: SizeConfig.width15,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
