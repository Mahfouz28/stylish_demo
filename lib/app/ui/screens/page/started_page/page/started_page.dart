import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/login_page.dart';
import 'package:stylish_demo/app/ui/screens/page/signin_signup/pages/widget/custom_sign_bottom.dart';
import 'package:stylish_demo/app/ui/screens/page/started_page/wedgits/back_ground_images.dart';
import 'package:stylish_demo/app/ui/screens/page/started_page/wedgits/coutom_overlay_text1.dart';
import 'package:stylish_demo/app/ui/screens/page/started_page/wedgits/coutom_overlay_text2.dart';
import 'package:stylish_demo/app/ui/screens/page/started_page/wedgits/custom_gradiant.dart';
import 'package:stylish_demo/core/appcolors.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            BackgroundImages(),
            CustomGradiant(),
            IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pop(); // Close dialog
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(color: AppColors.kPrimaryColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cancel logout
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: AppColors.kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout, color: Colors.white),
            ),

            // Overlay Text Widgets
            CoutomOverlayText1(),
            // Second Overlay Text Widget
            CoutomOverlayText2(),
            // Positioned Sign Button
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                  bottom: 21,
                  top: 530,
                ),
                // Sign Button
                child: CustomSignButton(
                  text: 'Get Started',
                  onPressed: () => '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
