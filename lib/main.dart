import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findtechnic/models/user_models.dart';
import 'package:findtechnic/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

String initRoute =
    '/authen'; //กำหนดเพื้่อการใช้งานฟังก์ชั่นต่างๆในอนาคต เช่น การล็อคอิน

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event != null) {
        //login
        String uid = event.uid;
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .snapshots()
            .listen((event) {
          UserModel model = UserModel.fromMap(event.data()!);
          switch (model.typeuser) {
            case 'user':
              initRoute = '/myServiceUser';
              runApp(MyApp());
              break;
            case 'Technician':
              initRoute = '/myServiceTechnician';
              runApp(MyApp());
              break;
            default:
          }
        });
      } else {
        //Logout
        runApp(const MyApp());
      }
    });
  });
} //ถ้า main method ทำงาน จะทำการรันตัว MyApp

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
