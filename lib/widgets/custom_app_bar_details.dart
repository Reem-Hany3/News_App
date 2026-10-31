import 'package:flutter/material.dart';

import 'circle_icon.dart';
class CustomAppBarDetails extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
    leading: GestureDetector(
    onTap: () {
    Navigator.pop(context);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CircleIcon(icon: Icons.arrow_back_ios),
    )),
    leadingWidth: 50,
    title: const Text('News Detail',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
    centerTitle: true,
    actions: [
    Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.bookmark_border),
      ),
    ),
    ],
      backgroundColor: Colors.grey.shade200,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(56);
}
