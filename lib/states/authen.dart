import 'package:findtechnic/utility/my_style.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double? screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width; //กำหนดให้ screenWidth มีขนาดเท่าความกว้างของจอ
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: MyStyle().buildBackground(screenWidth!, screenHeight!),
    );
  }
}
