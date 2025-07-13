import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stylish_demo/app/ui/screens/page/onbordingpages/cubit/cubit/login_cubit_cubit.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/creat_account_page.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_bot.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_forget_passwordBottom.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_header_signin.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_password_feild.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_sign_bottom.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_text_email_feild.dart';
import 'package:stylish_demo/app/ui/screens/page/started_page/page/started_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubitCubit>();

    return BlocConsumer<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginCubitSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/images/Star 1.png', height: 100),
                        Positioned(
                          top: 20,
                          right: 20,
                          left: 20,
                          bottom: 20,
                          child: Image.asset(
                            'assets/images/Vector 5.png',
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Login successfully!'),
                  ],
                ),
              );
            },
          );

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => StartedPage()),
              (route) => false,
            );
          });
        } else if (state is LoginCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                "Login failed. Please try again.",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              backgroundColor: const Color.fromARGB(255, 226, 21, 6),
              duration: const Duration(seconds: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              elevation: 8,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const stylish_demoHeader(headerText: "Welcome\nBack!"),
                    const SizedBox(height: 40),

                    CustomEmailField(
                      controller: cubit.emailController,
                      focusNode: emailFocusNode,
                    ),
                    const SizedBox(height: 12),

                    CustomPasswordField(
                      hintText: 'Password',
                      controller: cubit.passwordController,
                    ),
                    const SizedBox(height: 8),

                    ForgotPasswordButton(),
                    const SizedBox(height: 30),

                    CustomSignButton(
                      text: state is LoginCubitLoading ? 'Loading...' : 'Login',
                      onPressed: () {
                        if (cubit.formKey.currentState?.validate() ?? false) {
                          cubit.signIn();
                        } else if (cubit.emailController.text.isEmpty ||
                            cubit.passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                "Please fill in all fields.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              backgroundColor: const Color.fromARGB(
                                255,
                                226,
                                21,
                                6,
                              ),
                              duration: const Duration(seconds: 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              elevation: 8,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 50),

                    SocialAuthSection(
                      bottomName: 'Sign Up',
                      onPerssed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccountPage(),
                          ),
                        );
                      },
                      haveAcc: 'Create An Account',
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
