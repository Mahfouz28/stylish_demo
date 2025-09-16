import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish_demo/core/widgets/app_home_screen_bar.dart';
import 'package:stylish_demo/core/widgets/app_text_form_Field.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/catigory.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/sort_and_filter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
