import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/color.dart';
import 'package:flutter/material.dart';
import '../../Model/SevicesModel.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';

class JobDetailsWaterTank extends StatefulWidget {
  const JobDetailsWaterTank({Key? key}) : super(key: key);

  @override
  _JobDetailsWaterTankState createState() => _JobDetailsWaterTankState();
}

class _JobDetailsWaterTankState extends State<JobDetailsWaterTank> {
  String callOutText = '';

  List<ServicesModel> services = [];
  int callOutPrice = 0;
  int totalPrice = 0;
  int smallPrice = 0;
  int mediumPrice = 0;
  int largePrice = 0;

  int smallQ = 0;
  int mediumQ = 0;
  int largeQ = 0;

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
                text: 'What services do you want?',
                size: SizeConfig.width15,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: callOutText.isNotEmpty,
            child: Align(
                alignment: Alignment.center,
                child: CustomGoogleFontText(
                  text: callOutText,
                  textAlign: TextAlign.center,
                  size: SizeConfig.width15,
                )),
          ),
          Visibility(
            visible: callOutText.isNotEmpty,
            child: const SizedBox(
              height: 10,
            ),
          ),
          billInfo(),
          appColorButton(title: 'Continue')
        ],
      ),
    );
  }

  Widget tankOptions({
    required String title,
    required String subTitle,
    required int quantity,
    required int price,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(3.0, 3.0),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomGoogleFontText(
                  text: title,
                  size: SizeConfig.width17,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomGoogleFontText(
                  text: subTitle,
                  size: SizeConfig.width15,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          quantity == 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      if (title == 'Small') {
                        smallQ += 1;
                      } else if (title == 'Medium') {
                        mediumQ += 1;
                      } else {
                        largeQ += 1;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: SizeConfig.width6),
                    height: SizeConfig.height25,
                    width: SizeConfig.width60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.iColor),
                    child: Center(
                        child: CustomGoogleFontText(
                      text: 'add  +',
                      color: Colors.white,
                      size: SizeConfig.width12,
                    )),
                  ),
                )
              : Container(
                  height: SizeConfig.height18,
                  width: SizeConfig.width80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.iColor)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.width5,
                      ),
                      InkWell(
                        onTap: () {
                          if (quantity <= 0) {
                            // setState(() {
                            //   price = 0;
                            // });
                          } else {
                            if (title == 'Small') {
                              smallQ -= 1;
                            } else if (title == 'Medium') {
                              mediumQ -= 1;
                            } else {
                              largeQ -= 1;
                            }
                            setState(() {});
                          }
                        },
                        child: Icon(Icons.remove,
                            size: 20, color: AppColors.iColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (title == 'Small') {
                              smallQ += 1;
                            } else if (title == 'Medium') {
                              mediumQ += 1;
                            } else {
                              largeQ += 1;
                            }
                          });
                        },
                        child:
                            Icon(Icons.add, size: 20, color: AppColors.iColor),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget appColorButton({required String title}) {
    return GestureDetector(
      onTap: () async {
        // ignore: unused_local_variable
        int index = -1;
        if (smallQ > 0 || mediumQ > 0 || largeQ > 0) {
        } else {
          // ignore: unused_local_variable
          final result = await showOkAlertDialog(
              context: context,
              title: 'Oops!',
              message: 'Please select a service');
        }
      },
      child: Container(
        height: SizeConfig.height35,
        width: SizeConfig.screenWidth,
        margin: EdgeInsets.only(
          right: SizeConfig.width20,
          left: SizeConfig.width20,
          bottom: SizeConfig.height25,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryColor),
        alignment: Alignment.center,
        child: CustomGoogleFontText(
          text: title,
          size: SizeConfig.width15,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget billInfo() {
    totalPrice = callOutPrice +
        (smallPrice * smallQ) +
        (mediumPrice * mediumQ) +
        (largePrice * largeQ);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          SizedBox(
            height: SizeConfig.height5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomGoogleFontText(
                text: 'Total (All inclusive)',
                size: SizeConfig.width16,
                color: Colors.black,
              ),
              CustomGoogleFontText(
                text: '$currency $totalPrice',
                size: SizeConfig.width16,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.height10,
          ),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.black,
                size: SizeConfig.width18,
              ),
              SizedBox(
                width: SizeConfig.height10,
              ),
              CustomGoogleFontText(
                text: 'Duties may apply',
                size: SizeConfig.width10,
                color: Colors.black,
              )
            ],
          ),
        ],
      ),
    );
  }
}
