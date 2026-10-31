import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/search/Search.dart';

import '../Home/Home.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<Widget> screen = [Home(), Search()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.amber,
        color: Color(0xff001F3F),
        items: <Widget>[
          Icon(Icons.home, size: 30,color:Colors.white,),
          Icon(Icons.search, size: 30,color:Colors.white,),

        ],
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex=index;
          });
        },
      ),
    );
  }
}
