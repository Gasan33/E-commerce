// ignore: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping/presintation/Screens/onBoarding_Screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const OnBoardingScreens())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: 250.0,
            width: MediaQuery.of(context).size.width / 2,
            // child: Image.asset("assets/images/img.jpg"),
            child: Image.asset("assets/images/shop.png"),
          ),
        ),
      ),
    );
  }
}
