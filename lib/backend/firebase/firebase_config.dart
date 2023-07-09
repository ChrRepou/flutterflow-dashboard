import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBePo3S_NdG6GRUZVD5Zb6nPh3AuipLXYM",
            authDomain: "shopmate-b42a1.firebaseapp.com",
            projectId: "shopmate-b42a1",
            storageBucket: "shopmate-b42a1.appspot.com",
            messagingSenderId: "1078115987955",
            appId: "1:1078115987955:web:1042078b876b0b1a40e286",
            measurementId: "G-8CW1XRNEYQ"));
  } else {
    await Firebase.initializeApp();
  }
}
