import 'package:findtechnic/states/authen.dart';
import 'package:findtechnic/states/create_account.dart';
import 'package:findtechnic/states/my_service_technician.dart';
import 'package:findtechnic/states/my_service_user.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context)=>const Authen(),
  '/createAccount': (BuildContext context) => const CreateAccount(),//ถ้าคีย์ว่า createAccount ให้ไปเอาค่าที่ class CreateAccount
  '/myServiceUser': (BuildContext context) => const MyServiceUser(),
  '/myServiceTechnician': (BuildContext context) => const MyServiceTechnician(),
};
