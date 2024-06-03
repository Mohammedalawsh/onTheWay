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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjDFx1cDoninQ2LrAJTeeF56_RyJ1joDA',
    appId: '1:586308391675:android:ea7655df8f75c17ab7165e',
    messagingSenderId: '586308391675',
    projectId: 'otw1-63cab',
    storageBucket: 'otw1-63cab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0TuADNdvLzxi9dA85X2IqnD59z_9mKLY',
    appId: '1:586308391675:ios:131ceb5f744dee3eb7165e',
    messagingSenderId: '586308391675',
    projectId: 'otw1-63cab',
    storageBucket: 'otw1-63cab.appspot.com',
    iosBundleId: 'com.example.otw1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAemQs2WH04l54a7iEvtudRF4tn8zpBRvg',
    appId: '1:586308391675:web:ba22b875a67e9a8bb7165e',
    messagingSenderId: '586308391675',
    projectId: 'otw1-63cab',
    authDomain: 'otw1-63cab.firebaseapp.com',
    storageBucket: 'otw1-63cab.appspot.com',
  );

}