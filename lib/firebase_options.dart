// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBZF4wlC5vFzW3QnGQOpTnSGDPnHNoMpW4',
    appId: '1:530993434544:web:6f42e40122cac6a1191075',
    messagingSenderId: '530993434544',
    projectId: 'stylish_demo-9d380',
    authDomain: 'stylish_demo-9d380.firebaseapp.com',
    storageBucket: 'stylish_demo-9d380.firebasestorage.app',
    measurementId: 'G-10HHQY1R1R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzZYAPwuGyrWzAMVWR-gdVaA1DB_-0LdE',
    appId: '1:530993434544:android:702713a7cfc8c337191075',
    messagingSenderId: '530993434544',
    projectId: 'stylish_demo-9d380',
    storageBucket: 'stylish_demo-9d380.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzfzVUieSW_GNtN39EebRlm8C_QwkUNmM',
    appId: '1:530993434544:ios:d5bf78e3bfd28bb0191075',
    messagingSenderId: '530993434544',
    projectId: 'stylish_demo-9d380',
    storageBucket: 'stylish_demo-9d380.firebasestorage.app',
    iosBundleId: 'com.example.stylish_demo',
  );
}
