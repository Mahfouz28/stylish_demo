import 'package:flutter/material.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_forget_password_field.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_header_signin.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_sign_bottom.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const stylish_demoHeader(headerText: "Forgot\npassword?"),
              const SizedBox(height: 30),

              const ForgotPasswordField(),
              const SizedBox(height: 24),

              CustomSignButton(text: 'Submit', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
