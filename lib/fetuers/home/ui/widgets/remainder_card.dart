import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/styles.dart';

class ReemainderCard extends StatelessWidget {
  final String text;
  final String supText;
  final IconData icon;
  final Color color;
  const ReemainderCard({
    super.key,
    required this.text,
    required this.supText,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return
    /// 🛍️ Deal of the Day Section
    Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// نصوص القسم
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: TextStyles.font16w500white),
                Row(
                  children: [
                    Icon(icon, color: Colors.white),
                    4.horizontalSpace,
                    Text(supText, style: TextStyles.font12w400white),
                  ],
                ),
              ],
            ),

            /// زر "View All"
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              icon: const SizedBox.shrink(),
              label: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('View all'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
