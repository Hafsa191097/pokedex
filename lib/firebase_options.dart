// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBJCsr3LO1wEBKM3SisEXj1Fn7xNb2Vgu8',
    appId: '1:34772600149:web:d98ed7511564c2f8d79bdc',
    messagingSenderId: '34772600149',
    projectId: 'pokedex-app-d16fa',
    authDomain: 'pokedex-app-d16fa.firebaseapp.com',
    storageBucket: 'pokedex-app-d16fa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAreY2m2hv54JMb9s9He-aV6xyK5K_VnZM',
    appId: '1:34772600149:android:db5ccb5429e01d83d79bdc',
    messagingSenderId: '34772600149',
    projectId: 'pokedex-app-d16fa',
    storageBucket: 'pokedex-app-d16fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACbGLYYHUf4es50Js9NCdAaNmLzGTAhUA',
    appId: '1:34772600149:ios:e3261a4fb6b17924d79bdc',
    messagingSenderId: '34772600149',
    projectId: 'pokedex-app-d16fa',
    storageBucket: 'pokedex-app-d16fa.appspot.com',
    iosBundleId: 'com.example.pokedex',
  );
}
