import 'package:findtechnic/widget/my_signout.dart';
import 'package:flutter/material.dart';

class MyServiceUser extends StatefulWidget {
  const MyServiceUser({super.key});

  @override
  State<MyServiceUser> createState() => _MyServiceUserState();
}

class _MyServiceUserState extends State<MyServiceUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Welcome User'),
    ),drawer: Drawer(child: MySignOut(),),
    );
  }
}
