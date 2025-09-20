import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({super.key, required this.currentIndex, required this.onTap});

  final List<IconData> icons = const [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.shopping_cart,
    Icons.search_sharp,
    Icons.settings,
  ];

  final List<String> labels = const [
    'Home',
    'Favorite',
    'Cart',
    'Search',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      notchMargin: 8.r,
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(0),
            buildNavBarItem(1),
            SizedBox(width: 48.w), // مكان للـ FAB
            buildNavBarItem(3),
            buildNavBarItem(4),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(int index) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons[index],
            size: 22.sp,
            color: isSelected ? const Color(0xffEB3030) : Colors.black,
          ),
          SizedBox(height: 4.h),
          Text(
            labels[index],
            style: TextStyle(
              fontSize: 12.sp,
              color: isSelected ? const Color(0xffEB3030) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
