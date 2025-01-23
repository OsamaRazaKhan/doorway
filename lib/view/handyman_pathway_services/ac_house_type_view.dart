import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';
import '../../Model/SevicesModel.dart';
import '../../Model/SubServiceModel.dart';
import '../../utils/SizeConfig.dart';

class AcHouseType extends StatefulWidget {
  const AcHouseType({Key? key}) : super(key: key);

  @override
  _AcHouseTypeState createState() => _AcHouseTypeState();
}

class _AcHouseTypeState extends State<AcHouseType> {
  List<ServicesModel> services = [];
  List<SubServiceModel> subServices = [];
  String callOutText = '';
  int callOutPrice = 0;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CustomGoogleFontText(
          text: 'Job Details',
          size: SizeConfig.width17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
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
                if (r1.index == 0) {}

                //Navigator.of(context).pop();
              })
        ],
      ),
      body: Column(
        children: [
          Container(
              height: SizeConfig.height40,
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: CustomGoogleFontText(
                text: 'What is your house type?',
                size: SizeConfig.width15,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 10,
          ),
          //appColorButton(title: 'Continue')
        ],
      ),
    );
  }

  Widget houseTypes(String title, int index) {
    return Container(
      width: 130,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: services[index].isSelected!
              ? AppColors.primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5.0,
                spreadRadius: 2.0,
                offset: const Offset(3.0, 3.0))
          ]),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            color: services[index].isSelected!
                ? Colors.white
                : AppColors.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
