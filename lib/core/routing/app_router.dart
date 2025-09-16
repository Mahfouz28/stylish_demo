import 'package:flutter/material.dart';
import 'package:stylish_demo/core/routing/routs.dart';
import 'package:stylish_demo/fetuers/Splash_Screen/splash_screen.dart';
import 'package:stylish_demo/fetuers/home/ui/widgets/home_screen.dart';
import 'package:stylish_demo/fetuers/onbordingpages/on_boarding_page.dart';
import 'package:stylish_demo/fetuers/signin_signup/pages/creat_account_page.dart';
import 'package:stylish_demo/fetuers/signin_signup/pages/login_page.dart';
import 'package:stylish_demo/fetuers/started_page/page/started_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => CreateAccountPage());
      case Routes.startedPage:
        return MaterialPageRoute(builder: (_) => StartedPage());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No Route defined for this page')),
          ),
        );
    }
  }
}
