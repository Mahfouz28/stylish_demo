import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/apbaravatar.png', height: 96.h, width: 96.w),
        Positioned(
          bottom: 2,
          right: 0,
          child: SvgPicture.asset('assets/svg/edit_back_ground.svg'),
        ),
        Positioned(
          bottom: -6,
          right: -8,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.white, size: 22.sp),
          ),
        ),
      ],
    );
  }
}
