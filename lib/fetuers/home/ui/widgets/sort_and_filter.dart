import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_demo/core/theme/styles.dart';

class SortAndFilter extends StatelessWidget {
  const SortAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('All Featured', style: TextStyles.font18w600Black),
        Spacer(),

        SizedBox(
          height: 24.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 1,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sort', style: TextStyles.font12w400Black),
                8.horizontalSpace,
                SvgPicture.asset('assets/svg/sort Iocne.svg'),
              ],
            ),
          ),
        ),
        12.horizontalSpace,

        SizedBox(
          height: 24.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 1,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Text('Filter', style: TextStyles.font12w400Black),
                8.horizontalSpace,

                SvgPicture.asset('assets/svg/filter.svg'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
