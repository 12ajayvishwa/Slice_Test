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
    apiKey: 'AIzaSyAASDpnas3gXDMyW8qG78wwqXa0gzpz2xk',
    appId: '1:40084704726:web:917f5098cafead21e76877',
    messagingSenderId: '40084704726',
    projectId: 'slice-17e55',
    authDomain: 'slice-17e55.firebaseapp.com',
    storageBucket: 'slice-17e55.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7DeghBtyvauq5EyHkxursJv_tYckpm2A',
    appId: '1:40084704726:android:96dec673a6ea5c2ee76877',
    messagingSenderId: '40084704726',
    projectId: 'slice-17e55',
    storageBucket: 'slice-17e55.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXtrPelii4ENNHy8nXgzZmSJxPM8IfD28',
    appId: '1:40084704726:ios:d6b9971bbf788ddde76877',
    messagingSenderId: '40084704726',
    projectId: 'slice-17e55',
    storageBucket: 'slice-17e55.appspot.com',
    iosBundleId: 'com.example.slice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXtrPelii4ENNHy8nXgzZmSJxPM8IfD28',
    appId: '1:40084704726:ios:d6b9971bbf788ddde76877',
    messagingSenderId: '40084704726',
    projectId: 'slice-17e55',
    storageBucket: 'slice-17e55.appspot.com',
    iosBundleId: 'com.example.slice',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAASDpnas3gXDMyW8qG78wwqXa0gzpz2xk',
    appId: '1:40084704726:web:4fd4641fb3afb9ebe76877',
    messagingSenderId: '40084704726',
    projectId: 'slice-17e55',
    authDomain: 'slice-17e55.firebaseapp.com',
    storageBucket: 'slice-17e55.appspot.com',
  );
}