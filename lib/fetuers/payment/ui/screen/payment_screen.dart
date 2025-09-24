import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';
import 'package:stylish_demo/fetuers/payment/ui/widgets/payment_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  final Product product;
  final double total;
  final int quantity;

  const PaymentScreen({
    super.key,
    required this.product,
    required this.total,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top AppBar
              PaymentAppBar(),

              24.verticalSpace,

              /// Order Info
              Text("Order Summary", style: TextStyles.font18w500Gray),
              16.verticalSpace,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product:", style: TextStyles.font16w400Black),
                  Text(product.title, style: TextStyles.font16w400LightRed),
                ],
              ),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price:", style: TextStyles.font16w400Black),
                  Text(
                    "\$${product.price}",
                    style: TextStyles.font16w400LightRed,
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quantity:", style: TextStyles.font16w400Black),
                  Text(
                    quantity.toString(),
                    style: TextStyles.font16w400LightRed,
                  ),
                ],
              ),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:", style: TextStyles.font18w500Gray),
                  Text(
                    "\$${total.toStringAsFixed(2)}",
                    style: TextStyles.font18w500Gray.copyWith(
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),

              24.verticalSpace,
              Divider(thickness: 1, color: AppColors.lightGray),

              24.verticalSpace,

              /// Payment Methods
              Text(
                "Payment Methods",
                style: TextStyles.font18w500Gray,
              ), // Corrected style
              16.verticalSpace,

              _buildPaymentMethod(context, "💵  Cash on Delivery"),
              12.verticalSpace,
              _buildPaymentMethod(context, "💳  Credit / Debit Card"),
              12.verticalSpace, // Added missing vertical space
              _buildPaymentMethod(context, "📱  PayPal"),
              12.verticalSpace, // Added missing vertical space
              _buildPaymentMethod(context, "🏦  Bank Transfer"),
              30.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 60.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          title: Text(
                            "Confirm Payment",
                            style: TextStyles.font18w500Gray,
                          ),
                          content: Text(
                            "You selected: ${product.title}\nDo you want to proceed?",
                            style: TextStyles.font16w400Black,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Cancel",
                                style: TextStyles.font18w500Gray,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // TODO: handle payment flow here
                              },
                              child: Text(
                                "Continue",
                                style: TextStyles.font16w400LightRed,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(BuildContext context, String title) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              title: Text("Confirm Payment", style: TextStyles.font18w500Gray),
              content: Text(
                "You selected: $title\nDo you want to proceed?",
                style: TextStyles.font16w400Black,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel", style: TextStyles.font18w500Gray),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: handle payment logic
                  },
                  child: Text("Confirm", style: TextStyles.font12w400white),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.lightGray, width: 1),
        ),
        child: Text(title, style: TextStyles.font16w400Black),
      ),
    );
  }
}
