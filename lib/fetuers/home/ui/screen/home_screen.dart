import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/helpers/extintions.dart';
import 'package:stylish_demo/core/routing/routs.dart';

import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';

import 'package:stylish_demo/core/widgets/app_home_screen_bar.dart';
import 'package:stylish_demo/core/widgets/app_text_form_Field.dart';
import 'package:stylish_demo/fetuers/home/logic/cubit/home_cubit.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/catigory.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/flat_and_heals_banner.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/nav_bar.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/new_arrivals.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/remainder_card.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/deal_of_the_day_shoping_card.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';
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

  List<Product> cart = [];

  void addToCart(Product product) {
    setState(() {
      if (!cart.any((item) => item.title == product.title)) {
        cart.add(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: AppColors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${product.title} added to cart',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: AppColors.kPrimaryColor,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(12),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.info, color: AppColors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${product.title} is already in the cart',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: AppColors.lightGray, // لون محايد للتحذير
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(12),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

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

    // Fetch products from supabase
    context.read<HomeCubit>().fetchProducts();
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
          Navigator.pushNamed(
            context,
            Routes.cartScreen, // لازم تكون عامله في routes
            arguments: cart,
          );
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

                      /// ↕️ Sort & Filter Section
                      SortAndFilter(text: 'All Featured'),
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
                                    onPressed: () {
                                      context.pushNamed(
                                        Routes.viweAllProductsScreen,
                                      );
                                    },
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
                        height: 270.h,
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            if (state is HomeProductsLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is HomeProductsSuccessState) {
                              final products = state.products;
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      context.pushNamed(
                                        Routes.shopPageScreen,
                                        arguments: products[index],
                                      );
                                    },
                                    child: DealOfTheDayShopingCard(
                                      image: products[index].image,
                                      title: products[index].title,
                                      description: products[index].description,
                                      price: products[index].price,
                                      oldPrice: products[index].oldPrice,
                                      discount: products[index].discount,
                                      numberOfReview:
                                          products[index].numberOfReviews,
                                      onAddToCart: () {
                                        addToCart(products[index]);
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                      return SizedBox(width: 12.w);
                                    },
                                itemCount: 4,
                              );
                            } else if (state is HomeProductsFailure) {
                              return Center(
                                child: Text('Error: ${state.error}'),
                              );
                            }
                            return const SizedBox.shrink(); // Fallback for initial state or other states
                          },
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
                        height: 220.h,
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            if (state is HomeProductsLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is HomeProductsSuccessState) {
                              final products = state.products;

                              if (products.length <= 3) {
                                return const Center(
                                  child: Text("No Trending Products Available"),
                                );
                              }

                              return ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  final product = products[index + 4];
                                  return GestureDetector(
                                    onTap: () {
                                      context.pushNamed(
                                        Routes.shopPageScreen,
                                        arguments: product,
                                      );
                                    },

                                    child: TreandingShopingCard(
                                      image: product.image,
                                      title: product.title,
                                      description: product.description,
                                      price: product.price.toString(),
                                      oldPrice: product.oldPrice.toString(),
                                      discount: product.discount.toString(),
                                      onAddToCart: () {
                                        // هنا تستدعي function تضيف المنتج للكارت
                                        addToCart(product);
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, index) {
                                      return SizedBox(width: 8.w);
                                    },
                                itemCount: products.length - 4, // هنا صح
                                scrollDirection: Axis.horizontal,
                              );
                            } else if (state is HomeProductsFailure) {
                              return Center(
                                child: Text("Error: ${state.error}"),
                              );
                            }
                            return const SizedBox.shrink();
                          },
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
