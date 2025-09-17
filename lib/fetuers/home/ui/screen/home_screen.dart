import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';

import 'package:stylish_demo/core/widgets/app_home_screen_bar.dart';
import 'package:stylish_demo/core/widgets/app_text_form_Field.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/catigory.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/sort_and_filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<String> banners = [
    'assets/images/Rectangle 48.png',
    'assets/images/image 10.png',
    'assets/images/image 12.png',
  ];

  @override
  void initState() {
    super.initState();
    // Auto page change every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentIndex + 1) % banners.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

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

                      /// 🔹 Banner Slider
                      SizedBox(
                        height: 200,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: banners.length,
                          onPageChanged: (index) {
                            setState(() => _currentIndex = index);
                          },
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Image.asset(
                                  banners[index],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
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
                                    label: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Shop Now'),
                                        SizedBox(width: 8),
                                        Icon(Icons.arrow_forward_rounded),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      12.verticalSpace,

                      /// 🔹 Dots Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          banners.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundColor: _currentIndex == index
                                  ? AppColors.pink
                                  : Colors.grey,
                              radius: 5,
                            ),
                          ),
                        ),
                      ),
                      16.verticalSpace,

                      /// 🔹 Deal of the Day
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff4392F9),
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
                                      const Icon(
                                        Icons.alarm,
                                        color: Colors.white,
                                      ),
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
                                label: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
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
                Container(
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
                          Text(
                            'Special Offers 😱',
                            style: TextStyles.font16w500black,
                          ),
                          Text(
                            'We make sure you get  the offer you \n sneed at best prices',
                            style: TextStyles.font12w300black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                Container(
                  width: double.infinity,
                  height: 157.h,

                  decoration: BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.r,
                          vertical: 8.r,
                        ),
                        child: Container(
                          color: Colors.grey.shade200,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        child: SvgPicture.asset('assets/svg/stars.svg'),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        right: 385,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffEFAD18), Color(0xffF8D7B4)],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 32,
                        left: 16,

                        child: Image.asset(
                          'assets/images/heals.png',
                          height: 108.h,
                          width: 144,
                        ),
                      ),
                      Positioned(
                        right: 19,
                        top: 35,
                        child: Text(
                          'Flat and Heels',
                          style: TextStyles.font16w500black,
                        ),
                      ),
                      Positioned(
                        right: 13,
                        top: 58,
                        child: Text(
                          'Stand a chance to get rewarded',
                          style: TextStyles.font10w400black,
                        ),
                      ),
                      Positioned(
                        right: 12,
                        bottom: 55,
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
                                Text(
                                  'Visit now',
                                  style: TextStyles.font12w500white,
                                ),
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
                ),
                16.verticalSpace,
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffFD6E87),
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
                              'Trending Products ',
                              style: TextStyles.font16w500white,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.white,
                                ),
                                4.horizontalSpace,
                                Text(
                                  'Last Date 29/02/22',
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
                          label: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
        ),
      ),
    );
  }
}
