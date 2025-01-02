import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (Platform.isAndroid) {
      return FirebaseOptions(
        apiKey: 'AIzaSyBZSUEd2N-PaCKLM-HkALouS6DbwtAKlhk',
        appId: '1:727138512904:android:9a6d69a09a82f2cdd4a1bd',
        messagingSenderId: '727138512904', 
        projectId: 'mis-lab2-master',
      );
    } else {
      throw UnsupportedError('This platform is not supported.');
    }
  }
}

