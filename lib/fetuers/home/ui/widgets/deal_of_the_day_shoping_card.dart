import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/styles.dart';

class DealOfTheDayShopingCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final String oldPrice;
  final String discount;
  final double? rate;
  final String numberOfReview;

  final VoidCallback onAddToCart;
  const DealOfTheDayShopingCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    this.rate,
    required this.numberOfReview,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 170.w,
            height: 124.h,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(4.r),
              child: Image.network(image),
            ),
          ),
          8.verticalSpace,
          Text(title, style: TextStyles.font12w500Black),
          Text(description, style: TextStyles.font10w400Black),
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
          Row(
            children: [
              AnimatedRatingStars(
                initialRating: 3.5,
                minRating: 0.0,
                maxRating: 5.0,
                filledColor: Colors.amber,
                emptyColor: Colors.grey,
                filledIcon: Icons.star,
                halfFilledIcon: Icons.star_half,
                emptyIcon: Icons.star_border,
                onChanged: (double rating) {
                  // Handle the rating change here
                  print('Rating: $rating');
                },
                displayRatingValue: true,
                interactiveTooltips: true,
                customFilledIcon: Icons.star,
                customHalfFilledIcon: Icons.star_half,
                customEmptyIcon: Icons.star_border,
                starSize: 16.0,
                animationDuration: Duration(milliseconds: 300),
                animationCurve: Curves.easeInOut,
                readOnly: false,
              ),
              Text(numberOfReview, style: TextStyles.font10w400lightGray),
            ],
          ),
          8.verticalSpace,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 6.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
