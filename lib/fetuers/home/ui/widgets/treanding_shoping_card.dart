import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/styles.dart';

class TreandingShopingCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final String oldPrice;
  final String discount;
  final double? rate;
  final String? numberOfReview;

  const TreandingShopingCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    this.rate,
    this.numberOfReview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 142.w,

      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 142.w,
            height: 100.h,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(4.r),
              child: Image.asset(image),
            ),
          ),
          8.verticalSpace,
          Text(
            title,
            style: TextStyles.font12w500Black,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            description,
            style: TextStyles.font10w400Black,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text('₹$price', style: TextStyles.font12w500Black),

          Row(
            children: [
              Text(
                '₹$oldPrice',
                style: TextStyles.font12w500BLightGray.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              8.horizontalSpace,
              Text('$discount%Off', style: TextStyles.font10w400LightRed),
            ],
          ),
        ],
      ),
    );
  }
}
