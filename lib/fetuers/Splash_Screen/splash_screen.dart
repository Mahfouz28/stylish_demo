import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stylish_demo/fetuers/onbordingpages/on_boarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  @override
  void initState() {
    setState(() {
      Timer(Duration(seconds: 1), () {
        setState(() {
          _opacity = 1.0;
        });
      });
    });
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => OnboardingPage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        duration: Duration(seconds: 1),

        opacity: _opacity,
        child: Center(
          child: Image.asset(
            "assets/images/logoipsum.png",
            height: 100,
            width: 280,
          ),
        ),
      ),
    );
  }
}
