import 'package:flutter/material.dart';


class MyServiceTechnician extends StatefulWidget {
  const MyServiceTechnician({super.key});

  @override
  State<MyServiceTechnician> createState() => _MyServiceTechnicianState();
}

class _MyServiceTechnicianState extends State<MyServiceTechnician> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome  Technician'),)
    );
  }
}