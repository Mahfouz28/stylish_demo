import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/helpers/extintions.dart';
import 'package:stylish_demo/core/routing/routs.dart';
import 'package:stylish_demo/core/theme/styles.dart';

class Sponserd extends StatelessWidget {
  const Sponserd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 380.h,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.only(left: 16.r),
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: Text('Sponserd', style: TextStyles.font20w500black),
            ),
            12.verticalSpace,

            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
              child: Image.asset(
                'assets/images/image 12.png',
                fit: BoxFit.cover,
              ),
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('up to 50% Off', style: TextStyles.font16w700Black),
                IconButton(
                  onPressed: () {
                    context.pushNamed(Routes.viweAllProductsScreen);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
