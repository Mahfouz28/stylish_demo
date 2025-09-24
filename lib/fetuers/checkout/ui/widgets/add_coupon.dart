import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';

class AddCoupon extends StatelessWidget {
  const AddCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.card_giftcard),
        10.horizontalSpace,

        Text('Apply Coupons', style: TextStyles.font16w500black),
        Spacer(),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                final TextEditingController couponController =
                    TextEditingController();
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Enter Discount Coupon",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: couponController,
                          decoration: InputDecoration(
                            hintText: "Enter coupon code",
                            hintStyle: TextStyle(color: AppColors.lightGray),
                            filled: true,
                            fillColor: AppColors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.lightRed,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                final code = couponController.text.trim();
                                if (code.isNotEmpty) {
                                  print("Coupon code: $code");
                                }
                                Navigator.pop(context);
                              },
                              child: const Text("Apply"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text('Select', style: TextStyle(color: AppColors.lightRed)),
        ),
      ],
    );
  }
}
