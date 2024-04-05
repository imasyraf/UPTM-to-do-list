import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBBMbir6I5qC2_R53QDPY2lbqv7gVWaQ4I",
            authDomain: "flutter-authentication-a5c9a.firebaseapp.com",
            projectId: "flutter-authentication-a5c9a",
            storageBucket: "flutter-authentication-a5c9a.appspot.com",
            messagingSenderId: "272484652951",
            appId: "1:272484652951:web:0cb50b0942c283cf0496d2",
            measurementId: "G-JSWL7HWDKV"));
  } else {
    await Firebase.initializeApp();
  }
}
