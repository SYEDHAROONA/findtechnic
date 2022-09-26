import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Color(0xff005400);
  Color primaryColor = Color(0xff39821a);
  Color lightColor = Color(0xff6bb249);
  
 SafeArea buildBackground(double screenWidth, double screenHeight) { //มาสร้าง background ไว้ตรงนี้เพื่อง่ายต่อการแก้พื้นหลังในอนาคต
    return SafeArea(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image(image: AssetImage('images/top1.png')),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image(image: AssetImage('images/top2.png')),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image(image: AssetImage('images/bottom1.png')),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image(image: AssetImage('images/bottom2.png')),
            ),
        ],
      ),
    ));
  }
  
  MyStyle();
}
