import 'dart:ui';

import 'package:appturista/pages/home.dart';
import 'package:appturista/pages/profile.dart';
import 'package:appturista/pages/profile_moments_full.dart';
import 'package:appturista/pages/profile_reels_full.dart';
import 'package:appturista/pages/recover.dart';
import 'package:appturista/pages/recover_enter_code.dart';
import 'package:appturista/pages/recover_shipping_notification.dart';
import 'package:appturista/pages/sign_in.dart';
import 'package:appturista/pages/sign_up.dart';
import 'package:appturista/pages/sign_up_data.dart';
import 'package:appturista/pages/sign_up_preferences.dart';
import 'package:appturista/pages/recover_update_password.dart';
import 'package:flutter/material.dart';
import 'package:appturista/pages/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Turista',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        dividerColor: const Color(0xFF939393),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        fontFamily: 'Proxima Nova',
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            color: Color(0xFF222423),
            fontWeight: FontWeight.w600,
          ),
          subtitle2: TextStyle(
            color: Color(0xFF939393),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RootPage(),
        '/signIn': (context) => const SignInPage(),
        '/signUp': (context) => const SignUpPage(),
        '/signUp/data': (context) => const SignUpDataPage(),
        '/signUp/preferences': (context) => const SignUpPreferencesPage(),
        '/recover': (context) => const RecoverPage(),
        '/recover/shippingNotification': (context) =>
            const RecoverShippingNotificationPage(),
        '/recover/enterCode': (context) => const RecoverEnterCode(),
        '/recover/updatePassword': (context) =>
            const RecoverUpdatePasswordPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/profile/view/moments': (context) => const ProfileMomentsFull(),
        '/profile/view/reels': (context) => const ProfileReelsFull(),
      },
    );
  }
}
