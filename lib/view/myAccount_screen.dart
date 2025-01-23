import 'package:doorway/res/components/ShopAppbarBack.dart';
import 'package:doorway/res/components/global_components/custom_elevatedButton.dart';
import 'package:doorway/res/components/myAccount_component.dart/custom_accountDetails.dart';
import 'package:doorway/res/components/myAccount_component.dart/custom_accountSettingsItem.dart';
import 'package:doorway/utils/routes/routes_name.dart';
import 'package:doorway/view_model/auth_view_model.dart';
import 'package:doorway/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../utils/SizeConfig.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);
    //final themeProvider = Provider.of<ThemeProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
        appBar: shopAppbarBack("My Account", context),
        body: Column(
          children: [
            Visibility(
              visible: true,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.height15,
                    horizontal: SizeConfig.width25),
                child: const CustomAccountDetails(),
              ),
            ),
            CustomAccountSettingsItem(title: "Payment Methods", onTap: () {}),
            CustomAccountSettingsItem(
                title: "Rewards",
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.reward_screen);
                }),
            CustomAccountSettingsItem(
                title: "My Address Book",
                onTap: () {
                  Map<String, dynamic> arguments = {"wannaPlaceOrder": false};
                  Navigator.pushNamed(context, RoutesName.SavedAddresses_view,
                      arguments: arguments);
                }),
            CustomAccountSettingsItem(
                title: "My Details",
                onTap: () async {
                  Navigator.pushNamed(
                    context,
                    RoutesName.myDetails_screen,
                  );
                }),
            Padding(
                padding: EdgeInsets.symmetric(vertical: SizeConfig.height20))
          ],
        ),
        bottomSheet: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width15, vertical: SizeConfig.height10),
            width: double.infinity,
            height: SizeConfig.height60,
            child: CustomElevatedButton(
                loading: authViewModel.logoutLoading,
                title: "Log out",
                onPress: authViewModel.isWorking == false
                    ? () {
                        authViewModel.LogOut(context, userViewModel);
                      }
                    : null)),
      ),
    );
  }
}
