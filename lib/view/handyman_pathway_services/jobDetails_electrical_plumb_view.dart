import 'dart:developer';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';
import '../../Model/SevicesModel.dart';
import '../../Model/SubServiceModel.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';

class JobDetailsElectricalPlumb extends StatefulWidget {
  const JobDetailsElectricalPlumb({Key? key}) : super(key: key);

  @override
  _JobDetailsElectricalPlumbState createState() =>
      _JobDetailsElectricalPlumbState();
}

class _JobDetailsElectricalPlumbState extends State<JobDetailsElectricalPlumb> {
  List<ServicesModel> services = [];
  List<SubServiceModel> subServices = [];
  String callOutText = '';
  int callOutPrice = 0;
  int totalPrice = 0;

  List<Item> options = [];

  List<FixedExtentScrollController> scrollControllersList = [];

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
          const SizedBox(
            height: 10,
          ),
          billInfo(),
          appColorButton(title: 'Continue')
        ],
      ),
    );
  }

  Widget optionContainer(Item option, int index) {
    return InkWell(
      onTap: () {
        for (var element in options) {
          element.isSelected = false;
        }
        options[index].isSelected = true;
        setState(() {});
      },
      child: Container(
          width: 130,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: option.isSelected ? AppColors.primaryColor : Colors.white,
              border: Border.all(
                  width: 1,
                  color: option.isSelected
                      ? AppColors.primaryColor
                      : Colors.black)),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomGoogleFontText(
            text: option.title,
            textAlign: TextAlign.center,
            color: option.isSelected ? Colors.white : Colors.black,
            size: SizeConfig.width14,
          )),
    );
  }

  Widget appColorButton({required String title}) {
    return GestureDetector(
      onTap: () async {
        int index =
            services.indexWhere((element) => element.isSelected == true);
        if (index > -1) {
          int subInd =
              subServices.indexWhere((element) => element.isSelected == true);
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
          )),
    );
  }

  Widget serviceItem(
      {required String name,
      required int index,
      // required String image,
      List<SubServiceModel>? filteredSubs,
      required FixedExtentScrollController scrollController}) {
    if (filteredSubs!.isEmpty) {
      return serviceItemNoSubService(
        name: name, index: index,
        //image: image
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: MediaQuery.of(context).size.width,
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
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig.width15,
            ),
            SizedBox(
              width: SizeConfig.width180,
              child: CustomGoogleFontText(
                  text: name,
                  size: SizeConfig.width16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Expanded(
              child: SizedBox(
                width: SizeConfig.width15,
              ),
            ),
            SizedBox(
              height: SizeConfig.height80,
              width: SizeConfig.width100,
              child: ListWheelScrollView(
                controller: scrollController,
                itemExtent: SizeConfig.height30,
                /*useMagnifier: true,
                magnification: 1.2,*/
                onSelectedItemChanged: (value) {
                  setState(() {
                    for (var element in subServices) {
                      element.isSelected = false;
                    }
                    for (var element in filteredSubs) {
                      element.isSelected = false;
                    }

                    filteredSubs[value].isSelected = true;
                    int id = filteredSubs[value].id!;

                    int mainSubIndex =
                        subServices.indexWhere((element) => element.id == id);
                    if (mainSubIndex > -1) {
                      subServices[mainSubIndex].isSelected = true;
                      int sId = int.parse(subServices[mainSubIndex].serviceId!);
                      int mainIndex =
                          services.indexWhere((element) => element.id == sId);
                      if (mainIndex > -1) {
                        for (var element in services) {
                          element.isSelected = false;
                        }
                        services[mainIndex].isSelected = true;
                      }
                    }
                  });
                },
                children: filteredSubs.map((filteredSubItem) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: CustomGoogleFontText(
                        text: filteredSubItem.title!,
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        color: filteredSubItem.isSelected
                            ? AppColors.primaryColor
                            : Colors.black38,
                        size: filteredSubItem.isSelected
                            ? SizeConfig.width15
                            : SizeConfig.width12,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: SizeConfig.width15,
            ),
          ],
        ),
      );
    }
  }

  Widget serviceItemNoSubService({
    required String name,
    required int index,
    //required String image
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var element in services) {
            element.isSelected = false;
          }
          services[index].isSelected = true;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.white,
            color: services[index].isSelected!
                ? AppColors.primaryColor
                : Colors.white,
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
                child: CustomGoogleFontText(
              text: name,
              size: SizeConfig.width15,
              fontWeight: FontWeight.bold,
              //color: AppColors.primaryColor,
              color: services[index].isSelected!
                  ? Colors.white
                  : AppColors.primaryColor,
            )),
          ],
        ),
      ),
    );
  }

  Widget billInfo() {
    totalPrice = callOutPrice;

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
              )
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

class Item {
  String title;
  bool isSelected;

  Item({required this.isSelected, required this.title});
}
