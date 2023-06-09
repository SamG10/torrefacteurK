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
    apiKey: 'AIzaSyDED0v4EHKr3UC7SGgBP1jK3OugBMeKpkU',
    appId: '1:132923279838:web:1414384ecdbf0f54eaf54f',
    messagingSenderId: '132923279838',
    projectId: 'torrefacteur-k',
    authDomain: 'torrefacteur-k.firebaseapp.com',
    databaseURL: 'https://torrefacteur-k-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'torrefacteur-k.appspot.com',
    measurementId: 'G-6P875REHMD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpW4QkFqnD_rWqxD0xNzbassTZ3BcJso8',
    appId: '1:132923279838:android:e4ad539dd5cff5ddeaf54f',
    messagingSenderId: '132923279838',
    projectId: 'torrefacteur-k',
    databaseURL: 'https://torrefacteur-k-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'torrefacteur-k.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnBRLJtj69zE8f8rR32aH2gefbd5yFkTs',
    appId: '1:132923279838:ios:3d3df3890b40687aeaf54f',
    messagingSenderId: '132923279838',
    projectId: 'torrefacteur-k',
    databaseURL: 'https://torrefacteur-k-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'torrefacteur-k.appspot.com',
    iosBundleId: 'com.example.torrefacteurk',
  );
}
