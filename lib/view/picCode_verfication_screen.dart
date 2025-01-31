import 'dart:async';
import 'package:doorway/res/color.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../res/components/CustomGoogleFontText.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  String emailPhone = "";
  bool isEmail = true;
  bool showSuccess = true;

  PinCodeVerificationScreen(
      {Key? key,
      required this.emailPhone,
      required this.isEmail,
      required this.showSuccess})
      : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String pinCode = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
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
                  text:
                      "Enter a 4-digit code sent to your ${widget.isEmail ? "email" : "phone"}",
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
                    if (kDebugMode) {}
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
                child: ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0,
                    // ignore: unnecessary_new
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.height30),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: SizeConfig.width19, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.height10)),
              const Center(
                child: Text(
                  "By clicking continue, you agree to our terms",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.height10))
            ],
          ),
        ),
      ),
    );
  }
}
