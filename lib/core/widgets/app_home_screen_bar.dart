import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_demo/core/helpers/extintions.dart';
import 'package:stylish_demo/core/routing/routs.dart';

class AppHomeScreenBar extends StatelessWidget {
  const AppHomeScreenBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.0.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffF2F2F2),

            child: SvgPicture.asset(
              'assets/svg/Vector.svg',
              width: 16.w,
              height: 16.h,
            ),
          ),
          SvgPicture.asset('assets/svg/logoipsum-255 1.svg'),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.profileScreen);
            },
            child: Image.asset(
              'assets/images/apbaravatar.png',
              width: 40.w,
              height: 40.h,
            ),
          ),
        ],
      ),
    );
  }
}
