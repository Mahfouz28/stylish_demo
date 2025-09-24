import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/helpers/extintions.dart';
import 'package:stylish_demo/core/routing/routs.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';
import 'package:stylish_demo/core/widgets/shoping_card.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/nav_bar.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/sort_and_filter.dart';
import 'package:stylish_demo/fetuers/shop/ui/widgets/custom_bottons.dart'
    show CustomBottons;
import 'package:stylish_demo/fetuers/shop/ui/widgets/product_diteils.dart';
import 'package:stylish_demo/fetuers/shop/ui/widgets/shoping_page_app_bar.dart';
import 'package:stylish_demo/fetuers/viwe_all_products/logic/cubit/product_cubit.dart';

class ShopPageScreen extends StatefulWidget {
  final Product product;

  const ShopPageScreen({super.key, required this.product});

  @override
  State<ShopPageScreen> createState() => _ShopPageScreenState();
}

class _ShopPageScreenState extends State<ShopPageScreen> {
  int navIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: NavBar(currentIndex: navIndex, onTap: onItemTapped),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShopingPageAppBar(),
                ProductDiteils(product: widget.product),
                16.verticalSpace,
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.cartScreen);
                      },
                      child: CustomBottons(
                        icon: Icons.shopping_cart_outlined,

                        color1: Color(0xff3F92FF),
                        color2: Color(0xff0B3689),
                        text: 'Go to cart',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          Routes.checkoutScreen,
                          arguments: widget.product,
                        );
                      },
                      child: CustomBottons(
                        icon: Icons.sell_outlined,
                        color1: Color(0xff71F9A9),
                        color2: Color(0xff31B769),
                        text: 'Buy Now',
                      ),
                    ),
                  ],
                ),
                16.verticalSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Similar Products',
                    style: TextStyles.font20w600Black,
                  ),
                ),
                16.verticalSpace,
                Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Delivery in ', style: TextStyles.font14w500Black),
                        Text(
                          '1 within Hour',
                          style: TextStyles.font20w600Black,
                        ),
                      ],
                    ),
                  ),
                ),
                16.verticalSpace,
                Text('Similar To', style: TextStyles.font20w600Black),
                SortAndFilter(text: '282+ Iteams '),
                16.verticalSpace,

                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is productLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductSuccess) {
                      final products = state.products;

                      return SizedBox(
                        height: 500.h,
                        child: GridView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: .6,
                              ),
                          itemBuilder: (context, index) {
                            final item = products[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                    Routes.shopPageScreen,
                                    arguments: item,
                                  );
                                },
                                child: ShopingCard(
                                  image: item.image,
                                  title: item.title,
                                  description: item.description,
                                  price: item.price,
                                  oldPrice: item.oldPrice,
                                  discount: item.discount,
                                  numberOfReview:
                                      '${item.numberOfReviews} Reviews',
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Failed to load products'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
