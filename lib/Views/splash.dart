import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Sources/signup_form.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
  Timer(
  const Duration(seconds: 5),
      () =>
  Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) =>const SignupForm())));
    return Scaffold(
      body: Center(
        child: Lottie.network('https://lottie.host/0998b21f-62ea-4e8a-ae97-bd13b3c7bcbb/KMMf6WjSX1.json'),
      ),
    );
  }
}