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
        return macos;
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
    apiKey: 'AIzaSyDTCXtxk8SQ72--ttiDUtM-FwTj3k9B51E',
    appId: '1:590687055769:web:08da91d8f88f1005dc2d08',
    messagingSenderId: '590687055769',
    projectId: 'startupadda-dc02f',
    authDomain: 'startupadda-dc02f.firebaseapp.com',
    storageBucket: 'startupadda-dc02f.appspot.com',
    measurementId: 'G-QLDQYB11VB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1A9F2UGHo4SR2y3GKfveKLjWPFee8Htg',
    appId: '1:590687055769:android:3ab4afdcb4e2e266dc2d08',
    messagingSenderId: '590687055769',
    projectId: 'startupadda-dc02f',
    storageBucket: 'startupadda-dc02f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCduhmDpw8MpZnc5goq9cb3TePzkn2-4jk',
    appId: '1:590687055769:ios:55d4d002d8c501fadc2d08',
    messagingSenderId: '590687055769',
    projectId: 'startupadda-dc02f',
    storageBucket: 'startupadda-dc02f.appspot.com',
    iosClientId: '590687055769-thmppnathra2phe7sgj027tu4qfhnoqu.apps.googleusercontent.com',
    iosBundleId: 'www.startupadda.com.startupadda',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCduhmDpw8MpZnc5goq9cb3TePzkn2-4jk',
    appId: '1:590687055769:ios:55d4d002d8c501fadc2d08',
    messagingSenderId: '590687055769',
    projectId: 'startupadda-dc02f',
    storageBucket: 'startupadda-dc02f.appspot.com',
    iosClientId: '590687055769-thmppnathra2phe7sgj027tu4qfhnoqu.apps.googleusercontent.com',
    iosBundleId: 'www.startupadda.com.startupadda',
  );
}
