import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stylish_demo/my_app.dart';
import 'package:stylish_demo/fetuers/onbordingpages/cubit/cubit/login_cubit_cubit.dart';
import 'package:stylish_demo/fetuers/onbordingpages/cubit/on_bording_cubit.dart';
import 'package:stylish_demo/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  const supabaseUrl = 'https://csketexfmghsqsfwmbmn.supabase.co';
  const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNza2V0ZXhmbWdoc3FzZndtYm1uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgyMDMwNDksImV4cCI6MjA3Mzc3OTA0OX0.gCaJossSXvAvvo2sLXP3-pbHJFlTnQCR1tpRwAzoZ54';

  WidgetsFlutterBinding.ensureInitialized();
  WebViewPlatform.instance = AndroidWebViewPlatform();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

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
