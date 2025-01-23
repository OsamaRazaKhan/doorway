import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:flutter/material.dart';
import '../../Model/SevicesModel.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import 'job_brands_repair_ep_view.dart';

class JobDetailsRepairEP extends StatefulWidget {
  const JobDetailsRepairEP({Key? key}) : super(key: key);

  @override
  _JobDetailsRepairEPState createState() => _JobDetailsRepairEPState();
}

class _JobDetailsRepairEPState extends State<JobDetailsRepairEP> {
  List<ServicesModel> services = [];
  String callOutText = '';
  int callOutPrice = 0;
  int totalPrice = 0;

  List<Item> options = [];

  @override
  void initState() {
    options.add(Item(isSelected: true, title: 'Repair'));
    options.add(Item(isSelected: false, title: 'Installation'));

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
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              optionContainer(options[0], 0),
              const SizedBox(
                width: 30,
              ),
              optionContainer(options[1], 1),
            ],
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
            color: option.isSelected ? Colors.white : Colors.black,
            size: SizeConfig.width14,
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget appColorButton({required String title}) {
    return GestureDetector(
      onTap: () async {
        int index =
            services.indexWhere((element) => element.isSelected == true);
        if (index > -1) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => JobBrandsRepairEP(
                    selectedService: services[index],
                    totalPrice: totalPrice,
                  )));
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

  Widget serviceItem({
    required String name,
    required int index,
    // required String image,
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
        margin: const EdgeInsets.symmetric(horizontal: 90, vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //color: Colors.white,
            color: services[index].isSelected!
                ? AppColors.primaryColor
                : Colors.white,
            //  color: option.isSelected ? AppColors.primaryColor : Colors.white,
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
                textAlign: TextAlign.center,
                size: SizeConfig.width13,
                fontWeight: FontWeight.bold,
                color: services[index].isSelected!
                    ? Colors.white
                    : AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget billInfo() {
    totalPrice = callOutPrice;
    for (var element in services) {
      if (element.isSelected!) {
        try {
          totalPrice += int.parse(element.price!);
        } catch (e) {
          totalPrice += 0;
        }
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
