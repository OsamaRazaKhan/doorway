import 'dart:developer';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doorway/Model/SubServiceModel.dart';
import 'package:doorway/res/color.dart';
import 'package:doorway/res/components/CustomGoogleFontText.dart';
import 'package:doorway/view_model/orderListenings_view_model.dart';
import 'package:doorway/view_model/reward_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';

class HandyManPayment extends StatefulWidget {
  final int summaryType;
  final List<SubServiceModel>? subService;
  final SubServiceModel? selectedSubService;
  final List<SubServiceModel>? subsList;
  final int? totalPrice;

  const HandyManPayment({
    Key? key,
    required this.summaryType,
    this.subService,
    this.selectedSubService,
    this.subsList,
    this.totalPrice,
  }) : super(key: key);

  @override
  _HandyManPaymentState createState() => _HandyManPaymentState();
}

class _HandyManPaymentState extends State<HandyManPayment> {
  var orderListingController = Get.put(OrderListingsController());
  var controller = Get.put(RewardController());
  bool homelyCreditsSwitch = false;
  bool voucherCheck = false;
  TextEditingController voucherController = TextEditingController();
  @override
  void initState() {
    callVAT();
    controller.userRewardListingMethod();
    super.initState();
  }

  void callVAT({String? couponCode}) async {}

  int getBill1() {
    /// working for handyman

    int totalPrice = 0;
    /*if (SubCategoryManager.subCategories[0].title!.contains('Water Tank') ||
        SubCategoryManager.subCategories[0].title!.contains('Air')) {

    }*/
    if (widget.subService!.length > 1) {
      for (var element in widget.subService!) {
        if (element.title!.contains('AC Repair')) {
          totalPrice += 0;
        } else if (element.price != null) {
          totalPrice += element.quantity * int.parse(element.price!);
        }
      }
    } else {
      for (var element in widget.subService!) {
        if (element.price != null) {
          totalPrice += int.parse(element.price!);
        }
      }
    }

    return totalPrice;
  }

  int getBill2() {
    return 1234;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.5,
          title: CustomGoogleFontText(
            text: 'Payment',
            color: Colors.black,
            size: SizeConfig.width17,
            fontWeight: FontWeight.bold,
          ),
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
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.height15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.width20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomGoogleFontText(
                            text: 'Sub-total',
                            size: SizeConfig.width14,
                            color: Colors.black54,
                          ),
                          CustomGoogleFontText(
                            text: '$currency {abc xyz}',
                            size: SizeConfig.width14,
                            color: Colors.black54,
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.height10,
                      ),
                      homelyCreditsSwitch
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomGoogleFontText(
                                  text: 'Discount',
                                  size: SizeConfig.width14,
                                  color: Colors.black54,
                                ),
                                CustomGoogleFontText(
                                  text: '$currency {00)}',
                                  size: SizeConfig.width14,
                                  color: Colors.black54,
                                )
                              ],
                            )
                          : const SizedBox.shrink(),
                      homelyCreditsSwitch
                          ? SizedBox(
                              height: SizeConfig.height10,
                            )
                          : const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomGoogleFontText(
                            text: 'VAT',
                            size: SizeConfig.width14,
                            color: Colors.black54,
                          ),
                          CustomGoogleFontText(
                            text: '$currency 000',
                            size: SizeConfig.width14,
                            color: Colors.black54,
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.height10,
                      ),
                      const Divider(
                        height: 3,
                        color: Colors.black,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: SizeConfig.height10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomGoogleFontText(
                            text: 'Total (All inclusive)',
                            size: SizeConfig.width14,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomGoogleFontText(
                            text: '$currency ${000}',
                            size: SizeConfig.width14,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.height10,
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.warning_amber,
                            size: SizeConfig.width16,
                          ),
                          SizedBox(
                            width: SizeConfig.width5,
                          ),
                          CustomGoogleFontText(
                            text: 'Duties may apply',
                            size: SizeConfig.width11,
                            color: Colors.black87,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height10,
                ),
                Container(
                  height: SizeConfig.height50,
                  width: SizeConfig.screenWidth,
                  color: Colors.grey.shade200,
                  child: Row(
                    children: [
                      SizedBox(width: SizeConfig.width15),
                      SizedBox(
                        height: SizeConfig.height25,
                        width: SizeConfig.width25,
                        child: Image.asset(
                          "images/homelyCredits.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: SizeConfig.width10),
                      SizedBox(
                        width: SizeConfig.width280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                CustomGoogleFontText(
                                  text: 'Use $appName credits',
                                  size: SizeConfig.width15,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  fixedDiscount() ?? "0",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: SizeConfig.width16),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // Get.to(() => const RewardScreenPage());
                              },
                              child: CustomGoogleFontText(
                                text: 'See Details',
                                size: SizeConfig.width12,
                                color: Colors.black54,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                          activeColor: Colors.white,
                          activeTrackColor: AppColors.primaryColor,
                          value: homelyCreditsSwitch,
                          onChanged: (value) {}),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            voucherCheck = !voucherCheck;
                            if (voucherCheck) {
                              homelyCreditsSwitch = false;
                            } else {
                              voucherController.clear();
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(SizeConfig.height5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: voucherCheck
                                ? AppColors.primaryColor
                                : Colors.grey.shade200,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: SizeConfig.height15,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      voucherCheck
                                          ? "images/voucherWhite.png"
                                          : "images/voucherBlack.png",
                                      fit: BoxFit.contain,
                                    ),
                                    CustomGoogleFontText(
                                      text: ' Add Voucher Code',
                                      size: SizeConfig.width11,
                                      color: voucherCheck
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Get.to(() => const CouponListingScreenSod());
                        },
                        child: CustomGoogleFontText(
                          text: 'See all vouchers',
                          decoration: TextDecoration.underline,
                          size: 12,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                voucherCheck
                    ? SizedBox(
                        height: SizeConfig.height10,
                      )
                    : const SizedBox.shrink(),
                voucherCheck
                    ? Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.width20),
                        height: SizeConfig.height40,
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.black54),
                        ),
                        child: TextFormField(
                          controller: voucherController,
                          decoration: InputDecoration(
                              hintText: 'Enter voucher code',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintStyle: const TextStyle(fontSize: 13),
                              prefixIcon: Container(
                                padding: EdgeInsets.all(SizeConfig.width10),
                                height: SizeConfig.height15,
                                width: SizeConfig.width15,
                                child: Image.asset(
                                  "images/voucherBlack.png",
                                  fit: BoxFit.contain,
                                  height: SizeConfig.height15,
                                  width: SizeConfig.width15,
                                ),
                              ),
                              suffixIcon: SizedBox(
                                width: SizeConfig.width70,
                                child: GestureDetector(
                                  onTap: () {
                                    callVAT(couponCode: voucherController.text);
                                  },
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Center(
                                      child: CustomGoogleFontText(
                                        text: 'Submit',
                                        size: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        bottomSheet: GestureDetector(
          onTap: () async {},
          child: Container(
              height: SizeConfig.height35,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(SizeConfig.width20,
                  SizeConfig.height5, SizeConfig.width20, SizeConfig.height25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor),
              child: Center(
                child: CustomGoogleFontText(
                  text: 'Pay Now',
                  color: Colors.white,
                  size: SizeConfig.width16,
                ),
              )),
        ),
      ),
    );
  }

  String? fixedDiscount() {
    if (controller.userRewardObject.value.reward != null) {
      if (controller.userRewardObject.value.reward!.type != null) {
        if (controller
                .userRewardObject.value.reward!.type!.platinumFixedDiscount !=
            null) {
          return controller
              .userRewardObject.value.reward!.type!.platinumFixedDiscount;
        } else if (controller
                .userRewardObject.value.reward!.type!.goldenFixedDiscount !=
            null) {
          return controller
              .userRewardObject.value.reward!.type!.goldenFixedDiscount;
        } else if (controller
                .userRewardObject.value.reward!.type!.silverFixedDiscount !=
            null) {
          return controller
              .userRewardObject.value.reward!.type!.silverFixedDiscount;
        } else if (controller.userRewardObject.value.reward!.type!
                .platinumPercentageDiscount !=
            null) {
          return "${controller.userRewardObject.value.reward!.type!.platinumPercentageDiscount ?? "0"}%";
        } else if (controller.userRewardObject.value.reward!.type!
                .goldenPercentageDiscount !=
            null) {
          return "${controller.userRewardObject.value.reward!.type!.goldenPercentageDiscount ?? "0"}%";
        } else if (controller.userRewardObject.value.reward!.type!
                .silverPercentageDiscount !=
            null) {
          return "${controller.userRewardObject.value.reward!.type!.silverPercentageDiscount ?? "0"}%";
        }
      }
    }
    return '0';
  }
}
