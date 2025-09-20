import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';
import 'package:stylish_demo/fetuers/profile/ui/widgets/app_bar_profile.dart';
import 'package:stylish_demo/fetuers/profile/ui/widgets/avatar.dart';
import 'package:stylish_demo/fetuers/profile/ui/widgets/custom_text_form_Field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBarProfile(),
                Avatar(),
                28.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Personal Details', style: TextStyles.font18w600Black),
                    16.verticalSpace,
                    CustomTextFormField(
                      text: 'Email Address',
                      hint: 'Enter your email address',
                    ),
                    CustomTextFormField(
                      text: 'Password ',
                      hint: 'Enter your password',
                    ),
                    16.verticalSpace,
                    Align(
                      alignment: AlignmentGeometry.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Cahnge Password',
                          style: TextStyles.font16w400LightRed.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    Divider(),
                    16.verticalSpace,
                    Text(
                      'Bank Account Details',
                      style: TextStyles.font18w600Black,
                    ),
                    16.verticalSpace,
                    CustomTextFormField(
                      text: 'Bank name',
                      hint: 'Enter your bank name',
                    ),
                    CustomTextFormField(
                      text: 'Bank Account Number',
                      hint: 'Enter your account number',
                    ),
                    CustomTextFormField(
                      text: 'IFSC Code',
                      hint: 'Enter your IFSC code',
                    ),

                    16.verticalSpace,
                    Divider(),
                    16.verticalSpace,
                    Text('Address', style: TextStyles.font18w600Black),
                    16.verticalSpace,
                    CustomTextFormField(
                      text: 'Address',
                      hint: 'Enter your address',
                    ),
                    CustomTextFormField(text: 'City', hint: 'Enter your city'),
                    16.verticalSpace,
                    CustomTextFormField(
                      text: 'Pin code',
                      hint: 'Enter your pin code',
                    ),
                    16.verticalSpace,
                    CustomTextFormField(
                      text: 'state',
                      hint: 'Enter your state',
                    ),
                    16.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Save', style: TextStyles.font20w700white),
                      ),
                    ),
                    50.verticalSpace,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
