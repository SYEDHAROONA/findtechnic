import 'package:findtechnic/states/authen.dart';
import 'package:findtechnic/states/create_account.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context)=>const Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),//ถ้าคีย์ว่า createAccount ให้ไปเอาค่าที่ class CreateAccount
};
