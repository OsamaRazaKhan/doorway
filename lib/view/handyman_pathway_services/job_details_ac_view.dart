import 'dart:developer';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';
import '../../Model/SevicesModel.dart';
import '../../Model/SubServiceModel.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';

class JobDetailsAC extends StatefulWidget {
  final int? callOutPrice;
  final String? callOutText;
  final List<SubServiceModel>? subServices;
  final ServicesModel? selectedService;

  const JobDetailsAC(
      {Key? key,
      this.callOutPrice,
      this.callOutText,
      this.subServices,
      this.selectedService})
      : super(key: key);

  @override
  _JobDetailsACState createState() => _JobDetailsACState();
}

class _JobDetailsACState extends State<JobDetailsAC> {
  List<SubServiceModel> subServices = [];
  String callOutText = '';
  int callOutPrice = 0;
  int totalPrice = 0;
  int selectindex = 0;

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
          color: Colors.black,
          size: SizeConfig.width17,
          fontWeight: FontWeight.bold,
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
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: callOutText.isNotEmpty,
            child: const SizedBox(
              height: 10,
            ),
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
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: subServices.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  // selectindex = index;
                  return itemOptions(
                    itemName: subServices[index].title!,
                    description: subServices[index].description!,
                    index: index,
                  );
                },
              ),
            ),
          ),
          billInfo(),
          appColorButton(title: 'Continue'),
        ],
      ),
    );
  }

  Widget itemOptions({
    required String itemName,
    required String description,
    required int index,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(3.0, 3.0),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ]),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomGoogleFontText(
                  text: itemName,
                  size: SizeConfig.width13,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 5,
                ),
                Visibility(
                    visible: itemName.contains('AC Repair'),
                    child: CustomGoogleFontText(
                      text: 'Call out Charge',
                      size: SizeConfig.width11,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
          subServices[index].quantity == 0
              ? GestureDetector(
                  onTap: () {
                    if (subServices[index].quantity <= 0) {
                      setState(() {
                        subServices[index].quantity += 1;
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: SizeConfig.width6),
                    height: SizeConfig.height20,
                    width: SizeConfig.width50,
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
              : addItem(index: index),
          // To DO
          InkWell(
            onTap: () async {
              // ignore: unused_local_variable
              final result = await showOkAlertDialog(
                context: context,
                title: itemName,
                message: description,
                //onWillPop: () => Future.value(false)
              );
            },
            child: Container(
              height: SizeConfig.height55,
              width: SizeConfig.width40,
              decoration: const BoxDecoration(
                color: Color(0xffffb340), //Colors.grey,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/i.png',
                  width: SizeConfig.width20,
                  height: SizeConfig.height20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addItem({required int index}) {
    return Padding(
      padding: EdgeInsets.only(
        right: SizeConfig.width10,
      ),
      child: Container(
        height: SizeConfig.height18,
        width: SizeConfig.width80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.iColor),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (subServices[index].quantity <= 0) {
                  // setState(() {
                  //   price = 0;
                  // });
                } else {
                  setState(() {
                    subServices[index].quantity -= 1;
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.width4),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.remove,
                    size: 20,
                    color: AppColors.iColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              subServices[index].quantity.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (subServices[index].title!.contains('AC Repair')) {
                    if (subServices[index].quantity >= 1) {
                      //do nothing
                    } else {
                      subServices[index].quantity += 1;
                    }
                  } else {
                    subServices[index].quantity += 1;
                  }
                });
              },
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                alignment: Alignment.center,
                child: Icon(Icons.add, size: 20, color: AppColors.iColor),
              ),
            ),
            // SizedBox(
            //   width: 10,
            // ),
          ],
        ),
      ),
    );
  }

  Widget appColorButton({required String title}) {
    return GestureDetector(
      onTap: () async {
        if (totalPrice == callOutPrice && subServices[0].quantity == 0) {
          // ignore: unused_local_variable
          final result = await showOkAlertDialog(
              context: context,
              title: 'Oops!',
              message: 'Please select a service');
        } else {}
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
          color: Colors.white,
          size: SizeConfig.width15,
        ),
      ),
    );
  }

  Widget billInfo() {
    totalPrice = callOutPrice;
    for (var element in subServices) {
      if (element.title!.contains('AC Repair')) {
        totalPrice += 0;
      } else {
        totalPrice += element.quantity * int.parse(element.price!);
      }
    }

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
