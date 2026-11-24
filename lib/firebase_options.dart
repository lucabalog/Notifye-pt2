import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.android:
        return android;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCXZ1VBwTjAx1YiOfNl4x3hmc5-lwNMzr0',
    appId: '1:538067499467:web:17d8a2e56472122abd9e4e',
    messagingSenderId: '538067499467',
    projectId: 'animated-spot-rmn89',
    authDomain: 'animated-spot-rmn89.firebaseapp.com',
    storageBucket: 'animated-spot-rmn89.firebasestorage.app',
  );

  // Replace with your iOS/Android Firebase app IDs after running `flutterfire configure`
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXZ1VBwTjAx1YiOfNl4x3hmc5-lwNMzr0',
    appId: '1:538067499467:web:17d8a2e56472122abd9e4e',
    messagingSenderId: '538067499467',
    projectId: 'animated-spot-rmn89',
    storageBucket: 'animated-spot-rmn89.firebasestorage.app',
    iosBundleId: 'com.notifye.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXZ1VBwTjAx1YiOfNl4x3hmc5-lwNMzr0',
    appId: '1:538067499467:web:17d8a2e56472122abd9e4e',
    messagingSenderId: '538067499467',
    projectId: 'animated-spot-rmn89',
    storageBucket: 'animated-spot-rmn89.firebasestorage.app',
  );
}
