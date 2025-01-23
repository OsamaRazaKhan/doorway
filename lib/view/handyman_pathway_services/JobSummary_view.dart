import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/res/components/jobSummary_components.dart/custom_gridForJobSummary.dart';
import 'package:doorway/res/components/custom_shopAppbarBack.dart';
import 'package:doorway/res/components/jobSummary_components.dart/custom_imagesForJobSummary.dart';
import 'package:doorway/res/components/jobSummary_components.dart/custom_scheduleContainerJobSummary.dart';
import 'package:doorway/res/components/jobSummary_components.dart/custom_somethingMore.dart';
import 'package:doorway/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../utils/SizeConfig.dart';

class HandyManJobSummary extends StatefulWidget {
  const HandyManJobSummary({
    Key? key,
  }) : super(key: key);

  @override
  _JobSummaryState createState() => _JobSummaryState();
}

class _JobSummaryState extends State<HandyManJobSummary> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderViewModel = Provider.of<OrderViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: shopAppbarBack('Summary', context),
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.height15,
                left: 0,
                bottom: SizeConfig.height10,
                right: 0),
            child: ListView(
              children: [
                const CustomGridForJobSummary(),
                SizedBox(height: SizeConfig.height5),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.width20),
                  child: CustomGoogleFontText(
                    text: 'Anything else?',
                    size: SizeConfig.width15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.height10),
                CustomSomeThingMore(),
                SizedBox(height: SizeConfig.height20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.width20),
                  child: CustomGoogleFontText(
                    text: 'Schedule',
                    size: SizeConfig.width15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.height10),
                const CustomScheduleContainerJobSummary(),
                SizedBox(height: SizeConfig.height5),
                const CustomImagesForJobSummary(),
                SizedBox(height: SizeConfig.height80),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: CustomElevatedButton(
            title: 'Continue',
            loading: orderViewModel.orderLoading,
            onPress: orderViewModel.isWorking == false
                ? () async {
                    dynamic data = orderViewModel.getOrderInstance(context);
                    orderViewModel.placeOrder(
                      data,
                    );
                  }
                : null),
      ),
    );
  }
}
