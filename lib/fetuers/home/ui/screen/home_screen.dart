import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';

import 'package:stylish_demo/core/widgets/app_home_screen_bar.dart';
import 'package:stylish_demo/core/widgets/app_text_form_Field.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/catigory.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/flat_and_heals_banner.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/new_arrivals.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/remainder_card.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/sort_and_filter.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/spcial_offer.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/sponserd.dart';

/// 🏠 Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController =
      PageController(); // للتحكم في الـ PageView
  int _currentIndex = 0; // الفهرس الحالي للبنر
  Timer? _timer; // عشان نعمل auto slide للبنر

  /// صور البنرات (slider)
  final List<String> banners = [
    'assets/images/Rectangle 48.png',
    'assets/images/image 10.png',
    'assets/images/image 12.png',
  ];

  @override
  void initState() {
    super.initState();
    // ⏳ Auto page change every 5 seconds
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
    _pageController.dispose(); // غلق الـ controller
    _timer?.cancel(); // إيقاف المؤقت
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // لحماية المحتوى من مناطق الـ notch
        child: SingleChildScrollView(
          // عشان نعمل scroll للصفحة كلها
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                /// 🔹 AppBar مخصص للهوم
                AppHomeScreenBar(),

                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      /// 🔍 Search bar
                      AppTextFormField(
                        hintText: 'Search any Product..',
                        prefixIcon: Icons.search,
                        suffixIcon: Icons.mic,
                      ),
                      16.verticalSpace,

                      /// ↕️ Sort & Filter Section
                      SortAndFilter(),
                      16.verticalSpace,

                      /// 🗂️ Categories Section
                      CategoriesGrid(),
                      16.verticalSpace,

                      /// 🖼️ Banner Slider (PageView)
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
                                /// صورة البنر
                                Image.asset(
                                  banners[index],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),

                                /// النصوص فوق الصورة
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

                                /// زرار "Shop Now"
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

                      /// 🔘 Dots Indicator تحت البنر
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

                      ReemainderCard(
                        text: 'Deal of the Day',
                        supText: '22h 55m 20s remaining ',
                        icon: Icons.alarm,
                        color: Color(0xff4392F9),
                      ),
                      16.verticalSpace,

                      /// 🏷️ Special Offers Section
                      SpcialOffer(),
                      16.verticalSpace,

                      /// 👠 Flat and Heels Banner
                      FlatAndHealsBanner(),
                      16.verticalSpace,

                      /// 🔥 Trending Products Section
                      ReemainderCard(
                        text: 'Trending Products',
                        supText: 'Last Date 29/02/22',
                        icon: Icons.date_range_outlined,
                        color: AppColors.pink,
                      ),
                      16.verticalSpace,

                      /// 🆕 New Arrivals Section
                      NewArrivals(),
                      16.verticalSpace,
                      // Sponerd Section
                      Sponserd(),
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
