import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/jobOtherDetails_components.dart/custom_imageContainersRow.dart';
import 'package:doorway/res/components/jobOtherDetails_components.dart/custom_notesTextField.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../utils/SizeConfig.dart';

class HandyManJobDetailsOtherInfo extends StatefulWidget {
  const HandyManJobDetailsOtherInfo({
    Key? key,
  }) : super(key: key);

  @override
  _JobDetailsOtherInfoState createState() => _JobDetailsOtherInfoState();
}

class _JobDetailsOtherInfoState extends State<HandyManJobDetailsOtherInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final subServicesViewModel = Provider.of<SubServicesViewModel>(
      context,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: shopAppbarBack('Job Details', context),
      body: ListView(
        children: [
          Container(
              height: SizeConfig.height40,
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: CustomGoogleFontText(
                text: 'Anything else?',
                size: SizeConfig.width15,
                fontWeight: FontWeight.bold,
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.height20,
                  horizontal: SizeConfig.width20),
              child: CustomNotesTextField(
                controller: subServicesViewModel.notesController,
              )),
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.height5, left: SizeConfig.width20),
            child: const Text(
              "Add Some Pictures",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          const CustomImageContainersRow(),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: CustomElevatedButton(
            title: 'Continue',
            onPress: () async {
              subServicesViewModel.moveToJobSchedule(context);
            }),
      ),
    );
  }
}
