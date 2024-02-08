import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SplashScreen2()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 53.h),
            height: 307.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/Rick_and_Morty.png'),
              ),
            ),
          ),
          Container(
            height: 200.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/chel.png"),
              ),
            ),
          ),
          Container(
            height: 199.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/proff.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const AuthorizationScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 53.h),
            height: 307.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/Rick_and_Morty.png'),
              ),
            ),
          ),
          Container(
            height: 327.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/professor.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
