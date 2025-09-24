import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/styles.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';

class CheckoutProductItem extends StatefulWidget {
  final Product product;
  final ValueChanged<int> onQuantityChanged; // callback

  const CheckoutProductItem({
    super.key,
    required this.product,
    required this.onQuantityChanged,
  });

  @override
  State<CheckoutProductItem> createState() => _CheckoutProductItemState();
}

class _CheckoutProductItemState extends State<CheckoutProductItem> {
  int _quantity = 1;

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
              widget.product.image,
              height: 180.h,
              width: 153.w,
              fit: BoxFit.cover,
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
              Text(widget.product.title, style: TextStyles.font18w600Black),
              Text(
                'Checked Single-Breasted Blazer',
                style: TextStyles.font12w400Black,
              ),

              // هنا dropdown لتغيير الكمية
              DropdownButton<int>(
                value: _quantity,
                items: List.generate(10, (i) => i + 1).map((q) {
                  return DropdownMenuItem(value: q, child: Text(q.toString()));
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _quantity = value;
                    });
                    widget.onQuantityChanged(value); // send to parent
                  }
                },
              ),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Delivery by',
                      style: TextStyles.font12w400Black,
                    ),
                    TextSpan(
                      text: ' 24th February',
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
