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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyChcI70T1YwJDfNPHcx8EASbtUQp_xcLCM',
    appId: '1:665058402234:web:04ad9dad08f62c8b504783',
    messagingSenderId: '665058402234',
    projectId: 'internship-d3387',
    authDomain: 'internship-d3387.firebaseapp.com',
    storageBucket: 'internship-d3387.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJH3XY9gh31rkz1NmTRLx9bjbAsStBxf4',
    appId: '1:665058402234:android:cb936145f9385085504783',
    messagingSenderId: '665058402234',
    projectId: 'internship-d3387',
    storageBucket: 'internship-d3387.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9gxEQznNOdXdsRpIVhbhZ4LZPb6b4ZtQ',
    appId: '1:665058402234:ios:ca1d937d8e886be1504783',
    messagingSenderId: '665058402234',
    projectId: 'internship-d3387',
    storageBucket: 'internship-d3387.firebasestorage.app',
    iosBundleId: 'com.example.internship',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9gxEQznNOdXdsRpIVhbhZ4LZPb6b4ZtQ',
    appId: '1:665058402234:ios:ca1d937d8e886be1504783',
    messagingSenderId: '665058402234',
    projectId: 'internship-d3387',
    storageBucket: 'internship-d3387.firebasestorage.app',
    iosBundleId: 'com.example.internship',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyChcI70T1YwJDfNPHcx8EASbtUQp_xcLCM',
    appId: '1:665058402234:web:42b366e7694faf96504783',
    messagingSenderId: '665058402234',
    projectId: 'internship-d3387',
    authDomain: 'internship-d3387.firebaseapp.com',
    storageBucket: 'internship-d3387.firebasestorage.app',
  );

}