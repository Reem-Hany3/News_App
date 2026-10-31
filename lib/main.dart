import 'package:flutter/material.dart';
import 'package:untitled1/search/Search.dart';

import 'Home/Home.dart';
import 'Home/Splash.dart';
import 'Nav Bar/Nav Bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home:Splash(),
    );
  }
}


