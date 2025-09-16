import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_demo/fetuers/onbordingpages/cubit/cubit/login_cubit_cubit.dart';
import 'package:stylish_demo/fetuers/signin_signup/pages/login_page.dart';
import 'package:stylish_demo/fetuers/signin_signup/widget/custom_bot.dart';
import 'package:stylish_demo/fetuers/signin_signup/widget/custom_header_signin.dart';
import 'package:stylish_demo/fetuers/signin_signup/widget/custom_password_feild.dart';
import 'package:stylish_demo/fetuers/signin_signup/widget/custom_rigstraion_text.dart'
    show TermsAgreementText;
import 'package:stylish_demo/fetuers/signin_signup/widget/custom_sign_bottom.dart';
import 'package:stylish_demo/fetuers/signin_signup/widget/custom_text_email_feild.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubitCubit(),
      child: BlocConsumer<LoginCubitCubit, LoginCubitState>(
        listener: (context, state) {
          final cubit = context.read<LoginCubitCubit>();
          if (cubit.emailController.text.isEmpty ||
              cubit.passwordController.text.isEmpty ||
              confirmPasswordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  "Please fill in all fields.",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(16),
                elevation: 8,
              ),
            );
            return;
          }
          if (state is LoginCubitLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  content: Row(
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.kPrimaryColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text('Creating account...'),
                    ],
                  ),
                );
              },
            );
          }

          if (state is LoginCubitSuccess) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(); // Close loading dialog
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
                      const Text('Account created successfully!'),
                    ],
                  ),
                );
              },
            );

            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pop(); // Close success dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            });
          }

          if (state is LoginCubitFailure) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop(); // Close loading dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
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
          final cubit = context.read<LoginCubitCubit>();

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const stylish_demoHeader(
                        headerText: "Create an \naccount",
                      ),
                      const SizedBox(height: 10),

                      CustomEmailField(
                        controller: cubit.emailController,
                        focusNode: emailFocusNode,
                      ),
                      const SizedBox(height: 20),

                      CustomPasswordField(
                        hintText: 'Password',
                        controller: cubit.passwordController,
                      ),
                      const SizedBox(height: 20),

                      CustomPasswordField(
                        hintText: 'Confirm Password',
                        controller: confirmPasswordController,
                      ),
                      const SizedBox(height: 12),

                      const TermsAgreementText(),
                      const SizedBox(height: 40),

                      CustomSignButton(
                        text: state is LoginCubitLoading
                            ? 'Creating...'
                            : 'Create Account',
                        onPressed: () {
                          if (cubit.formKey.currentState?.validate() == true) {
                            if (cubit.passwordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    "Passwords do not match.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.all(16),
                                  elevation: 8,
                                ),
                              );
                              return;
                            }

                            cubit.signUp();
                          }
                        },
                      ),
                      const SizedBox(height: 15),

                      SocialAuthSection(
                        bottomName: 'Login',
                        onPerssed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => LoginPage()),
                          );
                        },
                        haveAcc: 'I Already Have an Account',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
