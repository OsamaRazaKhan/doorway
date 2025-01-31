// ignore_for_file: must_be_immutable, use_build_context_synchronously, library_private_types_in_public_api
import 'package:doorway/res/components/authenticationGlobal_components/custom_annimatedAuthContainer.dart';
import 'package:doorway/res/components/createAccount_components/custom_secondPortionCreateAccountPhone.dart';
import 'package:doorway/view_model/auth_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/SizeConfig.dart';

class CreateAccountPhoneScreen extends StatefulWidget {
  CreateAccountPhoneScreen({Key? key}) : super(key: key);
  @override
  _CreateAccountPhoneScreenState createState() =>
      _CreateAccountPhoneScreenState();
}

class _CreateAccountPhoneScreenState extends State<CreateAccountPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        authViewModel.clearStatesForPhone();
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: <Widget>[
            CustomAnnimatedAuthContainer(height: SizeConfig.height250),
            CustomSecondPortionCreateAccountPhone()
          ],
        ),
      ),
    );
  }
}
