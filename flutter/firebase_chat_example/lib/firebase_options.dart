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
    apiKey: 'AIzaSyAIbFcQTHRoW5mjqzog0ClEXTsnoY3Vw6k',
    appId: '1:272890391961:web:8004dc55bc2a30b18f3708',
    messagingSenderId: '272890391961',
    projectId: 'test-6143c',
    authDomain: 'test-6143c.firebaseapp.com',
    storageBucket: 'test-6143c.appspot.com',
    measurementId: 'G-1JXWZDRVC3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGdfV2TkAFe5PBWlLc8K8iYQ2jlqAe9_0',
    appId: '1:272890391961:android:b5a63fac51ff3f688f3708',
    messagingSenderId: '272890391961',
    projectId: 'test-6143c',
    storageBucket: 'test-6143c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtNoII56jEhIxlgw1RjpwKbMTxN_26rT4',
    appId: '1:272890391961:ios:2ec0ad507d789e7c8f3708',
    messagingSenderId: '272890391961',
    projectId: 'test-6143c',
    storageBucket: 'test-6143c.appspot.com',
    iosClientId: '272890391961-jvukil9knmjddipdpfvskaaslm8eu4tq.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChatExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtNoII56jEhIxlgw1RjpwKbMTxN_26rT4',
    appId: '1:272890391961:ios:18eb68436cf0dce48f3708',
    messagingSenderId: '272890391961',
    projectId: 'test-6143c',
    storageBucket: 'test-6143c.appspot.com',
    iosClientId: '272890391961-dtmu77emjjbtq1bemr0ddi3driii8d2v.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChatExample.RunnerTests',
  );
}