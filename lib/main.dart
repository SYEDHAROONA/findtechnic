import 'package:findtechnic/router.dart';
import 'package:flutter/material.dart';

String initRoute =
    '/authen'; //กำหนดเพื้่อการใช้งานฟังก์ชั่นต่างๆในอนาคต เช่น การล็อคอิน

main() => runApp(const MyApp());//ถ้า main method ทำงาน จะทำการรันตัว MyApp

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map, //ทำการ rout ค่ามาจาก router.dart
      initialRoute: initRoute,
    );
  }
}
