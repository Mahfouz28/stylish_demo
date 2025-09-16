import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';

import 'package:stylish_demo/core/widgets/app_home_screen_bar.dart';
import 'package:stylish_demo/core/widgets/app_text_form_Field.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/catigory.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/sort_and_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppHomeScreenBar(),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: 'Search any Product..',
                        prefixIcon: Icons.search,
                        suffixIcon: Icons.mic,
                      ),
                      16.verticalSpace,
                      SortAndFilter(),
                      16.verticalSpace,

                      CategoriesGrid(),
                      16.verticalSpace,

                      Stack(
                        children: [
                          Image(
                            image: AssetImage('assets/images/Rectangle 48.png'),
                          ),
                          Positioned(
                            top: 40.r,
                            left: 14.r,
                            child: Text(
                              '50-40% OFF',
                              style: TextStyles.font20w700white,
                            ),
                          ),
                          Positioned(
                            top: 70.r,
                            left: 14.r,
                            child: Text(
                              'Now in (product)\nAll colours',
                              style: TextStyles.font12w400white,
                            ),
                          ),
                          Positioned(
                            top: 112.r,
                            left: 14.r,
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                              icon: const SizedBox.shrink(),
                              label: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('Shop Now'),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward_rounded),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            3,

                            (index) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                backgroundColor: index == 1
                                    ? AppColors.pink
                                    : Colors.grey,
                                radius: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff4392F9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Deal of the Day',
                                    style: TextStyles.font16w500white,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.alarm, color: Colors.white),
                                      4.horizontalSpace,
                                      Text(
                                        '22h 55m 20s remaining',
                                        style: TextStyles.font12w400white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              OutlinedButton.icon(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                                icon: const SizedBox.shrink(),
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('View all'),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward_rounded),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
