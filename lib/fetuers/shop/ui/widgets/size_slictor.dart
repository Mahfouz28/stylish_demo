import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  SizeSelectorState createState() => SizeSelectorState();
}

class SizeSelectorState extends State<SizeSelector> {
  int tag = 1;
  List<String> options = ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child:
              /// النص اللي بيتغير حسب الاختيار
              Text('Size : ${options[tag]}', style: TextStyles.font16w500black),
        ),
        10.verticalSpace,
        ChipsChoice<int>.single(
          spacing: 5,

          value: tag,
          onChanged: (val) => setState(() => tag = val),
          choiceItems: C2Choice.listFrom<int, String>(
            source: options,
            value: (i, v) => i,
            label: (i, v) => v,
          ),
          choiceStyle: C2ChipStyle.outlined(
            foregroundStyle: TextStyles.font16w500Pink,
            borderWidth: 2,
            overlayColor: AppColors.pink,
            backgroundColor: AppColors.pink,
            color: AppColors.pink,
            selectedStyle: const C2ChipStyle(
              foregroundStyle: TextStyles.font16w500white,
              backgroundOpacity: 1,
              overlayColor: AppColors.pink,
              avatarBackgroundColor: AppColors.pink,
              backgroundColor: AppColors.pink,
              foregroundColor: Colors.white,
              borderColor: AppColors.pink,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          wrapped: true,
        ),
      ],
    );
  }
}
