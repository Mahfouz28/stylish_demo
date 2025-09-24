import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/styles.dart';

import '../../../home/data/models/product_model.dart';

class OrderDetails extends StatelessWidget {
  final Product product;
  final int quantity;
  final double shipping;
  final double discount;

  const OrderDetails({
    super.key,
    required this.product,
    required this.quantity,
    this.shipping = 20.0,
    this.discount = 0.0,
  });

  double get orderAmount => double.parse(product.price) * quantity;

  double get total => orderAmount - discount + shipping;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order Amount
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Amount', style: TextStyles.font16w400Black),
            Text(
              '\$${orderAmount.toStringAsFixed(2)}',
              style: TextStyles.font16w400LightRed,
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Coupon Discount
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Coupon Discount', style: TextStyles.font16w400Black),
            Text(
              '-\$${discount.toStringAsFixed(2)}',
              style: TextStyles.font16w400LightRed,
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Shipping
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping', style: TextStyles.font16w400Black),
            Text(
              '\$${shipping.toStringAsFixed(2)}',
              style: TextStyles.font16w400LightRed,
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Divider
        Divider(),
        SizedBox(height: 12.h),

        // Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Amount', style: TextStyles.font16w500black),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: TextStyles.font16w500black,
            ),
          ],
        ),
      ],
    );
  }
}
