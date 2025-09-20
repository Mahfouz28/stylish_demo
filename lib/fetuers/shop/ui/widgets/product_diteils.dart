import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/styles.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';
import 'package:stylish_demo/fetuers/shop/ui/widgets/size_slictor.dart';

class ProductDiteils extends StatelessWidget {
  final Product product;

  const ProductDiteils({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: SizedBox(
            height: 235.r,
            width: double.infinity,
            child: Image.network(product.image, height: 200),
          ),
        ),
        16.verticalSpace,
        SizeSelector(),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(product.title, style: TextStyles.font20w600Black),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(product.description),
        ),
        8.verticalSpace,
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
            Text('37465 Reviews', style: TextStyles.font10w400lightGray),
          ],
        ),
        8.verticalSpace,
        Row(
          children: [
            Text(
              "\$${product.oldPrice}",
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
            8.horizontalSpace,

            Text("\$${product.price}", style: TextStyles.font16w400Black),
            8.horizontalSpace,

            Text(
              "${product.discount}% Off",
              style: TextStyles.font10w400LightRed,
            ),
          ],
        ),
      ],
    );
  }
}
