import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Model/SubCategoriesModel.dart';
import '../../res/color.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../utils/SizeConfig.dart';
import 'main_screen.dart';

class HandyManMaintenanceScreen extends StatefulWidget {
  const HandyManMaintenanceScreen({Key? key}) : super(key: key);

  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<HandyManMaintenanceScreen> {
  List<SubCategoriesModel> subCategories = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomGoogleFontText(
          text: 'CategoryManager.category.title',
          size: SizeConfig.width17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.red,
          )
        ],
      ),
    );
  }

  Widget advantageDetails(
      {required IconData iconData,
      required String title,
      required String subTitlte}) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.25),
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      child: Row(
        children: [
          Icon(
            iconData,
            color: AppColors.primaryColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomGoogleFontText(
                text: title,
                size: SizeConfig.width15,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomGoogleFontText(
                text: subTitlte,
                size: SizeConfig.width11,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget typeCard({required String title, required void Function()? onPress}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: SizeConfig.width150,
        height: SizeConfig.height100,
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
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomGoogleFontText(
              text: title,
              textAlign: TextAlign.center,
              size: SizeConfig.width16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
