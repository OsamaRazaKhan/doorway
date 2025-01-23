// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../res/color.dart';
import '../../res/components/CustomGoogleFontText.dart';
import '../../utils/SizeConfig.dart';
import '../../view_model/auth_view_model.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String emailPhone;
  final bool isEmail;
  const OtpVerificationScreen({
    Key? key,
    required this.emailPhone,
    required this.isEmail,
  }) : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  // var userUpdateDataController = Get.put(updateUserDataController());
  TextEditingController otpController = TextEditingController();

  bool hasError = false;
  String pinCode = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(247, 249, 252, 1),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: CustomGoogleFontText(
          text: 'Verification',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          size: SizeConfig.width22,
        ),
        elevation: 0.0,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: const Color.fromRGBO(247, 249, 252, 1),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.height8),
              child: CustomGoogleFontText(
                text: "Enter a 4-digit code sent to your ",
                color: Colors.black,
                size: SizeConfig.width16,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: SizeConfig.height20,
            ),
            Form(
              key: formKey,
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                boxShadows: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ],
                enableActiveFill: true,
                textInputAction: TextInputAction.done,
                showCursor: true,
                cursorColor: Colors.white,
                textStyle: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: otpController,
                pinTheme: PinTheme(
                    activeColor: Colors.white,
                    selectedColor: AppColors.primaryColor,
                    activeFillColor: Colors.white,
                    inactiveColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: AppColors.primaryColor,
                    fieldHeight: 50,
                    fieldWidth: 50,
                    fieldOuterPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                    borderRadius: BorderRadius.circular(20),
                    shape: PinCodeFieldShape.box),
                onChanged: (value) {
                  if (kDebugMode) {
                    print('value: $value');
                  }
                },
                onCompleted: (value) {
                  setState(() {
                    pinCode = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.width30),
              child: Text(
                hasError ? "*Please fill up all the cells properly" : "",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: SizeConfig.height12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: SizeConfig.height20,
            ),
            const Spacer(),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width15,
                    vertical: SizeConfig.height10),
                width: double.infinity,
                height: SizeConfig.height65,
                child: CustomElevatedButton(
                    title: "Continue",
                    loading: authViewModel.verifyOtpLoading,
                    onPress: authViewModel.isWorking == false
                        ? () {
                            Map data;
                            if (widget.isEmail) {
                              data = {
                                'email': widget.emailPhone,
                                'code': pinCode,
                              };
                            } else {
                              data = {
                                'phone': widget.emailPhone,
                                'code': pinCode,
                              };
                            }
                            authViewModel.VerifyOtp(data, context);
                          }
                        : null)),
            Padding(
                padding: EdgeInsets.symmetric(vertical: SizeConfig.height10)),
            const Center(
              child: Text(
                "By clicking continue, you agree to our",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey
                    //  AppColors.shopLightGreyColor
                    ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: SizeConfig.height10))
          ],
        ),
      ),
    );
  }
}
