import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/styles.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';

class CheckoutProuductItem extends StatelessWidget {
  final Product product;
  const CheckoutProuductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.image,
              height: 180.h,
              width: 153.w,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 40),
                );
              },
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(product.title, style: TextStyles.font18w600Black),
              Text(
                'Checked Single-Breasted Blazer',
                style: TextStyles.font12w400Black,
              ),
              // QtyDropdown(), // This widget is not defined in this context
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Delivery by',
                      style: TextStyles.font12w400Black,
                    ),
                    TextSpan(
                      text: ' 24th Feburary',
                      style: TextStyles.font13w600Black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
