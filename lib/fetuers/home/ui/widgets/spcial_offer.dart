import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/styles.dart';

class SpcialOffer extends StatelessWidget {
  const SpcialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/special offer.png',
            height: 60.h,
            width: 75.w,
          ),
          24.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Special Offers 😱', style: TextStyles.font16w500black),
              Text(
                'We make sure you get the offer you \nneed at best prices',
                style: TextStyles.font12w300black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
