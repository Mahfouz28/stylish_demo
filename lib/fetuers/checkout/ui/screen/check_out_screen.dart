import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_demo/core/helpers/extintions.dart';
import 'package:stylish_demo/core/routing/routs.dart';
import 'package:stylish_demo/core/theme/appcolors.dart';
import 'package:stylish_demo/core/theme/styles.dart';

import 'package:stylish_demo/fetuers/checkout/ui/widgets/add_coupon.dart';
import 'package:stylish_demo/fetuers/checkout/ui/widgets/chechout_app_bar.dart';
import 'package:stylish_demo/fetuers/checkout/ui/widgets/order_ditailes.dart';
import 'package:stylish_demo/fetuers/checkout/ui/widgets/qyt_down.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';

class CheckOutScreen extends StatefulWidget {
  final Product? product;
  const CheckOutScreen({super.key, this.product});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(17.r),
          child: Column(
            children: [
              CheckOutAppBar(),
              32.verticalSpace,
              CheckoutProductItem(
                product: widget.product!,
                onQuantityChanged: (q) {
                  setState(() {
                    _quantity = q;
                  });
                },
              ),
              54.verticalSpace,

              AddCoupon(),
              36.verticalSpace,
              Divider(),
              35.verticalSpace,
              Column(
                children: [
                  OrderDetails(product: widget.product!, quantity: _quantity),
                ],
              ),

              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    final total =
                        double.parse(widget.product!.price) * _quantity;

                    context.pushNamed(
                      Routes.paymentScreen,
                      arguments: {
                        'product': widget.product,
                        'quantity': _quantity,
                        'total': total,
                      },
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Proceed to Payment',
                    style: TextStyles.font16w500white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
