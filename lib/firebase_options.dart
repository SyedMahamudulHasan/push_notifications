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
    apiKey: 'AIzaSyBdHIa_GoIPYuNIDYeQrGGC6CB4oetf56A',
    appId: '1:518821065725:web:c2dcad3f89c5667365df94',
    messagingSenderId: '518821065725',
    projectId: 'amadia-push-notifications',
    authDomain: 'amadia-push-notifications.firebaseapp.com',
    storageBucket: 'amadia-push-notifications.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3n4sI71Rrxpt9JcO397VkHYlzKUS-6iI',
    appId: '1:518821065725:android:65bf72402852ce2e65df94',
    messagingSenderId: '518821065725',
    projectId: 'amadia-push-notifications',
    storageBucket: 'amadia-push-notifications.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCC0bxyevx7tw38fl1wvlb4DNbioHXqwBQ',
    appId: '1:518821065725:ios:d904e9103ac447c665df94',
    messagingSenderId: '518821065725',
    projectId: 'amadia-push-notifications',
    storageBucket: 'amadia-push-notifications.appspot.com',
    iosClientId: '518821065725-hbetrkj94ji1qq1vi0avrujgiaec9p95.apps.googleusercontent.com',
    iosBundleId: 'com.example.pushNotifications',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCC0bxyevx7tw38fl1wvlb4DNbioHXqwBQ',
    appId: '1:518821065725:ios:d904e9103ac447c665df94',
    messagingSenderId: '518821065725',
    projectId: 'amadia-push-notifications',
    storageBucket: 'amadia-push-notifications.appspot.com',
    iosClientId: '518821065725-hbetrkj94ji1qq1vi0avrujgiaec9p95.apps.googleusercontent.com',
    iosBundleId: 'com.example.pushNotifications',
  );
}
