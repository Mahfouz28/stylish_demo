import 'package:flutter/material.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({
    super.key,
    this.showSignUpLink = true,
    required this.bottomName,
    required this.onPerssed,
    required this.haveAcc,
  });

  final bool showSignUpLink;
  final String bottomName;
  final VoidCallback onPerssed;
  final String haveAcc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("- OR Continue with -", style: TextStyle(fontSize: 14)),
        const SizedBox(height: 12),
        SizedBox(
          width: 200,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(60),
                onTap: () {},
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/images/Google.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(60),
                onTap: () {},
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/images/Facebook.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(60),
                onTap: () {},
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/images/appel.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showSignUpLink) ...[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(haveAcc),
              TextButton(
                onPressed: onPerssed,
                child: Text(
                  bottomName,
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 60),
      ],
    );
  }
}
