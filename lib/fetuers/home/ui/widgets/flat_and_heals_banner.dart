import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_demo/core/theme/styles.dart';

class FlatAndHealsBanner extends StatelessWidget {
  const FlatAndHealsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 157.h,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          /// خلفية رمادية
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 8.r),
            child: Container(
              color: Colors.grey.shade200,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          /// نجوم ديكورية (SVG)
          Positioned(top: 8, child: SvgPicture.asset('assets/svg/stars.svg')),

          /// Gradient على اليسار
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            right: 385,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffEFAD18), Color(0xffF8D7B4)],
                ),
              ),
            ),
          ),

          /// صورة المنتج (heels)
          Positioned(
            top: 32,
            left: 16,
            child: Image.asset(
              'assets/images/heals.png',
              height: 108.h,
              width: 144,
            ),
          ),

          /// النصوص على يمين الصورة
          Positioned(
            right: 19,
            top: 35,
            child: Text('Flat and Heels', style: TextStyles.font16w500black),
          ),
          Positioned(
            right: 13,
            top: 58,
            child: Text(
              'Stand a chance to get rewarded',
              style: TextStyles.font10w400black,
            ),
          ),

          /// زر Visit Now
          Positioned(
            right: 12,
            top: 84,
            child: SizedBox(
              width: 93,
              height: 28.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xffF83758),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Visit now', style: TextStyles.font12w500white),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
