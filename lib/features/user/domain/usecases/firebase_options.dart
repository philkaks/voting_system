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
    apiKey: 'AIzaSyDUDhJKYRD55Dt_n1OFsuc_oTQmh-hX9Fw',
    appId: '1:133266154782:web:f3b9966b11ee6d493dd50f',
    messagingSenderId: '133266154782',
    projectId: 'finalprojectq',
    authDomain: 'finalprojectq.firebaseapp.com',
    databaseURL: 'https://finalprojectq-default-rtdb.firebaseio.com',
    storageBucket: 'finalprojectq.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBK5d9Sbod5rG80PZ4KxCY81o7eQsLn27A',
    appId: '1:133266154782:android:d7aceecb7b4e0ad13dd50f',
    messagingSenderId: '133266154782',
    projectId: 'finalprojectq',
    databaseURL: 'https://finalprojectq-default-rtdb.firebaseio.com',
    storageBucket: 'finalprojectq.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjpa1QTei5I5ZYdKsyXqe38iJJ2NBYEfw',
    appId: '1:133266154782:ios:35b561aeaa93f9053dd50f',
    messagingSenderId: '133266154782',
    projectId: 'finalprojectq',
    databaseURL: 'https://finalprojectq-default-rtdb.firebaseio.com',
    storageBucket: 'finalprojectq.appspot.com',
    iosBundleId: 'com.example.votingSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjpa1QTei5I5ZYdKsyXqe38iJJ2NBYEfw',
    appId: '1:133266154782:ios:4d07628ff959a02d3dd50f',
    messagingSenderId: '133266154782',
    projectId: 'finalprojectq',
    databaseURL: 'https://finalprojectq-default-rtdb.firebaseio.com',
    storageBucket: 'finalprojectq.appspot.com',
    iosBundleId: 'com.example.votingSystem.RunnerTests',
  );
}
