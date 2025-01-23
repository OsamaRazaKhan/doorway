import 'package:doorway/res/color.dart';
import 'package:doorway/utils/SizeConfig.dart';
import 'package:doorway/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(247, 249, 252, 1),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.height20, horizontal: SizeConfig.width20),
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: Image.asset(
                  'assets/images/shop-account-success.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.height10)),
              Text(
                "Success!",
                style: TextStyle(
                    color: Colors.black, fontSize: SizeConfig.height40),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.height10)),
              Text(
                "Your account is created. Enjoy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.width21,
                    height: 1.5),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.height15,
                    vertical: SizeConfig.height10),
                width: double.infinity,
                height: SizeConfig.height65,
                child: ElevatedButton(
                  onPressed: () {
                    AuthViewModel.moveToHomeScreen(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.height30),
                    ),
                  ),
                  child: Text(
                    'Start using',
                    style: TextStyle(
                        fontSize: SizeConfig.width19, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
