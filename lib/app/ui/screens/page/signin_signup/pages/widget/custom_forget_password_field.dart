import 'package:flutter/material.dart';
import 'package:stylish_demo/core/appcolors.dart';

class ForgotPasswordField extends StatelessWidget {
  const ForgotPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[300],
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              hintText: "Enter your email address",
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.email_rounded),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text.rich(
          TextSpan(
            text: "* ",
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text:
                    "We will send you a message to set or reset your new password",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
