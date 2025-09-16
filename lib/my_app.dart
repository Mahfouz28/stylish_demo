import 'package:flutter/material.dart';
import 'package:stylish_demo/core/routing/app_router.dart';
import 'package:stylish_demo/core/routing/routs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
