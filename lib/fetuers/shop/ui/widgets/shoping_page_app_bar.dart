import 'package:flutter/material.dart';
import 'package:stylish_demo/core/helpers/extintions.dart';

class ShopingPageAppBar extends StatelessWidget {
  const ShopingPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ),
      ],
    );
  }
}
