import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/styles.dart';

/// موديل البيانات لكل عنصر
class CategoryModel {
  final String image;
  final String name;

  CategoryModel({required this.image, required this.name});
}

/// قائمة الكاتيجوريز
final List<CategoryModel> categories = [
  CategoryModel(image: 'assets/category pic/beauty.png', name: 'Beauty'),
  CategoryModel(image: 'assets/category pic/Fashion.png', name: 'Fashion'),
  CategoryModel(image: 'assets/category pic/Kids.png', name: 'Kids'),
  CategoryModel(image: 'assets/category pic/Mens.png', name: 'Mens'),
  CategoryModel(image: 'assets/category pic/Womens.png', name: 'Womens'),
];

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
          category.image,
          fit: BoxFit.cover,
          height: 56.h,
          width: 56.w,
        ),
        SizedBox(height: 10.h),
        Text(category.name, style: TextStyles.font10w400Black),
        SizedBox(height: 8.h),
      ],
    );
  }
}

/// Widget يعرض كل العناصر في Grid
class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
        ),
      ),
      child: GridView.builder(
        padding: EdgeInsets.all(16.w),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: .6,
          crossAxisSpacing: 8.r,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(category: categories[index]);
        },
      ),
    );
  }
}
