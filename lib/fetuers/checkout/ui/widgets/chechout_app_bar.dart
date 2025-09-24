import 'package:flutter/material.dart';

class CheckOutAppBar extends StatelessWidget {
  const CheckOutAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        const Text(
          'Checkout',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
      ],
    );
  }
}
