import 'package:flutter/material.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';

class TermsAgreementText extends StatelessWidget {
  const TermsAgreementText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            children: [
              const TextSpan(text: 'By clicking the '),
              TextSpan(
                text: 'Register',
                style: const TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(text: ' button, you agree to the public offer'),
            ],
          ),
        ),
      ),
    );
  }
}
