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
    apiKey: 'AIzaSyATbuq4WLhgwPeyvODfPQvqAYErXy7EYqU',
    appId: '1:292963527549:web:28cc300717bac27d93fa14',
    messagingSenderId: '292963527549',
    projectId: 'microhack-usthb',
    authDomain: 'microhack-usthb.firebaseapp.com',
    storageBucket: 'microhack-usthb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzYwEwSpFRm_JyjLbX_Pde4WIQbiQMsbc',
    appId: '1:292963527549:android:07e34ae9a53e9efd93fa14',
    messagingSenderId: '292963527549',
    projectId: 'microhack-usthb',
    storageBucket: 'microhack-usthb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmVR1nNKUcvH3B69EgklJUJnS54BuZc9c',
    appId: '1:292963527549:ios:fa45f29204c60b6593fa14',
    messagingSenderId: '292963527549',
    projectId: 'microhack-usthb',
    storageBucket: 'microhack-usthb.appspot.com',
    iosClientId: '292963527549-6d0rervv5kvobl51jhdu4valnjb3tur7.apps.googleusercontent.com',
    iosBundleId: 'com.example.microhack',
  );
}
