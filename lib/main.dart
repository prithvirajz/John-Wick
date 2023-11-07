// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kingsberg/mobile/landing_page_mobile.dart';
import 'package:kingsberg/routes.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'package:kingsberg/web/landing_page_web.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:js/js.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDzlz1p8HZ0hRbst6BFi5C-KIf_wDUVNX8",
            authDomain: "nomore-e268c.firebaseapp.com",
            projectId: "nomore-e268c",
            storageBucket: "nomore-e268c.appspot.com",
            messagingSenderId: "384623447557",
            appId: "1:384623447557:web:5c00d8e9f5226086de166c",
            measurementId: "G-19FQM0RJ7X"));
  } else {
    GoogleFonts.config.allowRuntimeFetching = false;
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: '/',
    );
  }
}
