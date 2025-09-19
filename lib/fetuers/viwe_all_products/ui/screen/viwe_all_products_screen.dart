import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stylish_demo/core/widgets/app_home_screen_bar.dart';
import 'package:stylish_demo/core/widgets/app_text_form_Field.dart';
import 'package:stylish_demo/core/widgets/shoping_card.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/nav_bar.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/sort_and_filter.dart';
import 'package:stylish_demo/fetuers/viwe_all_products/logic/cubit/product_cubit.dart';

class ViweAllProductsScreen extends StatefulWidget {
  const ViweAllProductsScreen({super.key});

  @override
  State<ViweAllProductsScreen> createState() => _ViweAllProductsScreenState();
}

class _ViweAllProductsScreenState extends State<ViweAllProductsScreen> {
  int navIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(currentIndex: navIndex, onTap: onItemTapped),
      floatingActionButton: FloatingActionButton(
        backgroundColor: navIndex == 2 ? const Color(0xffEB3030) : Colors.white,
        elevation: 4,
        onPressed: () {
          onItemTapped(2);
        },
        shape: CircleBorder(),
        child: Icon(
          Icons.shopping_cart_outlined,
          color: navIndex == 2 ? Colors.white : Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: Column(
          children: [
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
                  SortAndFilter(text: '52,082+ Iteams '),
                  16.verticalSpace,
                ],
              ),
            ),

            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is productLoading) {
                    return MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      padding: EdgeInsets.all(16.r),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const CardLoading(
                          height: 120,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          margin: EdgeInsets.only(bottom: 10),
                        );
                      },
                    );
                  } else if (state is ProductSuccess) {
                    final products = state.products;
                    return MasonryGridView.count(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.all(16.r),
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ShopingCard(
                          image: products[index].image,
                          title: products[index].title,
                          description: products[index].description,
                          price: products[index].price,
                          oldPrice: products[index].oldPrice,
                          discount: products[index].discount,
                          numberOfReview: products[index].numberOfReviews,
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
