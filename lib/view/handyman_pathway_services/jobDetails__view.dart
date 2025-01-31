import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/res/components/jobDetails_components/custom_billInfo.dart';
import 'package:doorway/res/components/jobDetails_components/custom_hourCard.dart';
import 'package:doorway/res/components/jobDetails_components/custom_ladderContainer.dart';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/view_model/subServices_view_model.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../utils/SizeConfig.dart';

class HandyManJobDetails extends StatefulWidget {
  const HandyManJobDetails({
    Key? key,
  }) : super(key: key);

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<HandyManJobDetails> {
  @override
  void initState() {
    super.initState();
    final subServiceViewModel =
        Provider.of<SubServicesViewModel>(context, listen: false);
    subServiceViewModel.CheckForSubServices(context);
  }

  @override
  Widget build(BuildContext context) {
    final subServicesViewModel = Provider.of<SubServicesViewModel>(
      context,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: shopAppbarBack('Job Details', context, isBackEnable: true),
      body: Padding(
        padding: EdgeInsets.only(bottom: SizeConfig.height60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: SizeConfig.height40,
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: CustomGoogleFontText(
                  text: 'What do you need for this service?',
                  size: SizeConfig.width15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: SizeConfig.height10,
              ),
              ModalProgressHUD(
                inAsyncCall: false,
                child: Container(
                    height: SizeConfig.height400,
                    child: subServicesViewModel.subServicesList.isNotEmpty
                        ? ListView.builder(
                            primary: false,
                            //physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.35),
                            shrinkWrap: true,
                            itemCount:
                                subServicesViewModel.subServicesList.length,
                            itemBuilder: (ctx, index) {
                              return CustomSubServiceCard(
                                  subServicesViewModel: subServicesViewModel,
                                  index: index,
                                  onTap: () {
                                    subServicesViewModel
                                        .setSelectedSubService(index);
                                  });
                            },
                          )
                        : Center(
                            child: Text(
                            'No more sub services',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ))),
              ),
              SizedBox(
                height: SizeConfig.height10,
              ),
              Container(
                height: SizeConfig.height40,
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: CustomGoogleFontText(
                  text: 'Do you require a ladder?',
                  size: SizeConfig.width15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomLadderContainer(),
              //Expanded(child: Container()),
              CustomBillInfo(currency: subServicesViewModel.Price.toString()),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: CustomElevatedButton(
            title: 'Continue',
            onPress: () async {
              if (subServicesViewModel.subServicesList.isNotEmpty) {
                if (subServicesViewModel.isSelected == true) {
                  subServicesViewModel.moveToJobDetailsOtherInfo(context);
                } else {
                  await showOkAlertDialog(
                    context: context,
                    title: 'Oops!',
                    message: 'Please select a sub service',
                    //onWillPop: () => Future.value(false)
                  );
                }
              } else {
                subServicesViewModel.moveToJobDetailsOtherInfo(context);
              }
            }),
      ),
    );
  }
}
