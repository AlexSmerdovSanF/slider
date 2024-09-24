import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAqey7w3Jr1gPsgue_hKw0lJEuH9Ti-E68",
            authDomain: "efaria-c79d3.firebaseapp.com",
            projectId: "efaria-c79d3",
            storageBucket: "efaria-c79d3.appspot.com",
            messagingSenderId: "340136798702",
            appId: "1:340136798702:web:e668457e4adb439e5086ff",
            measurementId: "G-JEJC7MC051"));
  } else {
    await Firebase.initializeApp();
  }
}
