import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_demo/core/routing/routs.dart';
import 'package:stylish_demo/fetuers/Splash_Screen/splash_screen.dart';
import 'package:stylish_demo/fetuers/home/data/models/product_model.dart';
import 'package:stylish_demo/fetuers/home/logic/cubit/home_cubit.dart';
import 'package:stylish_demo/fetuers/home/data/repo/product_repo.dart';
import 'package:stylish_demo/fetuers/home/ui/screen/home_screen.dart';
import 'package:stylish_demo/fetuers/onbordingpages/on_boarding_page.dart';
import 'package:stylish_demo/fetuers/shop/ui/screen/shop_page_screen.dart';
import 'package:stylish_demo/fetuers/signin_signup/pages/creat_account_page.dart';
import 'package:stylish_demo/fetuers/viwe_all_products/logic/cubit/product_cubit.dart';
import 'package:stylish_demo/fetuers/viwe_all_products/ui/screen/viwe_all_products_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:stylish_demo/fetuers/signin_signup/pages/login_page.dart';
import 'package:stylish_demo/fetuers/started_page/page/started_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case Routes.viweAllProductsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProductCubit(ProductRepository(Supabase.instance.client))
                  ..fetchProducts(),
            child: ViweAllProductsScreen(),
          ),
        );

      case Routes.shopPageScreen:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ShopPageScreen(product: product),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => CreateAccountPage());
      case Routes.startedPage:
        return MaterialPageRoute(builder: (_) => StartedPage());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider<ProductRepository>(
            create: (context) => ProductRepository(Supabase.instance.client),
            child: BlocProvider(
              create: (context) => HomeCubit(context.read<ProductRepository>()),
              child: HomeScreen(),
            ),
          ),
        );

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
