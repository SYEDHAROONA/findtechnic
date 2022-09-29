import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MySignOut extends StatelessWidget {
  const MySignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(onTap: ()async {
          await Firebase.initializeApp().then((value) async{
            await FirebaseAuth.instance.signOut().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/authen', (route) => false));
          });
        },
          leading: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 36,
          ),
          title: const Text(
            'Sign out',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          tileColor: Colors.red.shade700,
        ),
      ],
    );
  }
}
