import 'package:doorway/utils/utils.dart';
import 'package:doorway/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginViewModel = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextFormField(
              controller: loginViewModel.emailController.value,
              focusNode: loginViewModel.emailFocusNode.value,
              validator: (value){
                
              },
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context,
                    loginViewModel.emailFocusNode.value,
                    loginViewModel.passwordFocusNode.value);
              },
            ),
            TextFormField(
              controller: loginViewModel.passwordController.value,
              focusNode: loginViewModel.passwordFocusNode.value,
            ),
          ],
        ),
      ),
    );
  }
}
