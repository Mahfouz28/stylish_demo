import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';
import 'package:stylish_demo/fetuers/shop/ui/widgets/product_diteils.dart';
import 'package:stylish_demo/fetuers/shop/ui/widgets/shoping_page_app_bar.dart';

class ShopPageScreen extends StatelessWidget {
  final Product product;

  const ShopPageScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShopingPageAppBar(),
                ProductDiteils(product: product),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
