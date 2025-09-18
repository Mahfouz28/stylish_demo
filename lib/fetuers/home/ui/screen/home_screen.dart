import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';

import 'package:stylish_demo/core/widgets/app_home_screen_bar.dart';
import 'package:stylish_demo/core/widgets/app_text_form_Field.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/catigory.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/flat_and_heals_banner.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/nav_bar.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/new_arrivals.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/remainder_card.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/deal_of_the_day_shoping_card.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/sort_and_filter.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/spcial_offer.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/sponserd.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/treanding_shoping_card.dart';

/// 🏠 Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      navIndex = index;
    });
  }

  final PageController _pageController =
      PageController(); // للتحكم في الـ PageView
  int _currentIndex = 0; // الفهرس الحالي للبنر
  Timer? _timer; // عشان نعمل auto slide للبنر
  final List<String> shopingImages = [
    'assets/shoping images/shose.png',
    'assets/shoping images/girl.png',
  ];
  final List<String> shopingTitels = [
    'HRX by Hrithik Roshan',
    'Women Printed Kurta',
  ];
  final List<String> prices = ['2499', '1500'];
  final List<String> oldPrices = ['4999', '2499'];
  final List<String> discounts = ['50', '40'];
  final List<String> numberOfReviews = ['35235', '42000'];

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
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          onItemTapped(2);
        },

        backgroundColor: Colors.white,
        elevation: 4,

        child: Icon(
          Icons.shopping_cart_outlined,
          color: navIndex == 2 ? const Color(0xffEB3030) : Colors.black,
          size: 24.sp,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBar(currentIndex: navIndex, onTap: onItemTapped),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      // Deal of the day
                      ReemainderCard(
                        text: 'Deal of the Day',
                        supText: '22h 55m 20s remaining ',
                        icon: Icons.alarm,
                        color: Color(0xff4392F9),
                      ),
                      16.verticalSpace,
                      // shoping card
                      SizedBox(
                        height: 250,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return DealOfTheDayShopingCard(
                              image: dealOFTheDayProducts[index].image,
                              title: dealOFTheDayProducts[index].title,
                              description:
                                  dealOFTheDayProducts[index].description,
                              price: dealOFTheDayProducts[index].price,
                              oldPrice: dealOFTheDayProducts[index].oldPrice,
                              discount: dealOFTheDayProducts[index].discount,
                              numberOfReview:
                                  dealOFTheDayProducts[index].numberOfReviews,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 12.w);
                          },
                          itemCount: dealOFTheDayProducts.length,
                        ),
                      ),
                      16.horizontalSpace,
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
                      SizedBox(
                        height: 189.h,
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, index) {
                            return TreandingShopingCard(
                              image: trendingProducts[index].image,
                              title: trendingProducts[index].title,
                              description: trendingProducts[index].description,
                              price: trendingProducts[index].price,
                              oldPrice: trendingProducts[index].oldPrice,
                              discount: trendingProducts[index].discount,
                            );
                          },
                          separatorBuilder: (BuildContext context, index) {
                            return SizedBox(width: 8.w);
                          },
                          itemCount: trendingProducts.length,
                          scrollDirection: Axis.horizontal,
                        ),
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
