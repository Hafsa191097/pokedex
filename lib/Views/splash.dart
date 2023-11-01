import 'dart:async';
import 'dart:developer';
import 'package:Pokedex/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        if(AuthService().user != null){
          log("User is logged in");
          Navigator.pushNamed(context, '/home');
          log('next page');
        }else{
          Navigator.pushReplacementNamed(context, '/signup');
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Lottie.network(
            'https://lottie.host/0998b21f-62ea-4e8a-ae97-bd13b3c7bcbb/KMMf6WjSX1.json'),
      ),
    );
  }
}
