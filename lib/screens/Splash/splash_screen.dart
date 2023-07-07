import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/CustomWidgets/bottom_navigation.dart';

import 'Signp_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 1), () async {
      if (FirebaseAuth.instance.currentUser != null) {
        // wrong call in wrong place!
        Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
            builder: (context) => const BottomNavigationExample()));
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return const SLPage();
            },
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/spScreen.png',
        ),
        fit: BoxFit.fill,
      )),
    );
  }
}
