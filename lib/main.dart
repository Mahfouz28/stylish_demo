import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stylish_demo/my_app.dart';
import 'package:stylish_demo/fetuers/onbordingpages/cubit/cubit/login_cubit_cubit.dart';
import 'package:stylish_demo/fetuers/onbordingpages/cubit/on_bording_cubit.dart';
import 'package:stylish_demo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Try to initialize Firebase only once
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on FirebaseException catch (e) {
    // If already initialized, just ignore the duplicate error
    if (e.code != 'duplicate-app') rethrow;
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OnBordingCubit()),
        BlocProvider(create: (_) => LoginCubitCubit()),
      ],
      child: const MyApp(),
    ),
  );
}
