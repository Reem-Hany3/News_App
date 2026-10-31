import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled1/Home/home.dart';
import 'package:untitled1/Nav%20Bar/Nav%20Bar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Navbar(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff001F3F),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(
              "assets/images/splash1.png",
            ),

            const SizedBox(
              width: 4,
            ),

            Image.asset(
              "assets/images/splash2.png",
            ),
          ],
        ),
      ),
    );
  }
}