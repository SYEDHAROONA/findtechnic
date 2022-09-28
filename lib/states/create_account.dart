import 'package:findtechnic/utility/dialog.dart';
import 'package:findtechnic/utility/my_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double? screenWidth, screenHeight;
  String? typeUser, name, user, password;

  Container buildDisplayName() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.6,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        //สร้างช่องในการใส่ข้อความ
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons
                .fingerprint, //perm คือช่อไอคอนที่อยู่ใน material.io (ของgoogle)
            color: MyStyle().darkColor,
          ),
          labelStyle: MyStyle().darkStyle(),
          labelText: 'Display Name : ',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), //ขอบของช่องเป็นโค้งมน
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.6,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        //สร้างช่องในการใส่ข้อความ
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons
                .perm_identity, //perm คือช่อไอคอนที่อยู่ใน material.io (ของgoogle)
            color: MyStyle().darkColor,
          ),
          labelStyle: MyStyle().darkStyle(),
          labelText: 'User :',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), //ขอบของช่องเป็นโค้งมน
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.6,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        //สร้างช่องในการใส่ข้อความ
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons
                .lock_outline, //perm คือช่อไอคอนที่อยู่ใน material.io (ของgoogle)
            color: MyStyle().darkColor,
          ),
          labelStyle: MyStyle().darkStyle(),
          labelText: 'Password : ',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), //ขอบของช่องเป็นโค้งมน
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //return Scaffold เพราะเราต้องการใช้ธีมของมัน
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: MyStyle().primaryColor,
      ),
      body: Stack(
        children: [
          MyStyle().buildBackground(screenWidth!, screenHeight!),
          buildContent(),
        ],
      ),
    );
  }

  Center buildContent() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildDisplayName(),
            buildTitle(),
            buildTypeUser(),
            buildTypeTechnichian(),
            buildUser(),
            buildPassword(),
            buildCreateAccount(),
          ],
        ),
      ),
    );
  }

  Container buildCreateAccount() {
    return Container(
        margin: EdgeInsets.only(top: 8),
        width: screenWidth! * 0.6,
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: MyStyle().darkColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: () {
              if ((name?.isEmpty ?? true) ||
                  (user?.isEmpty ?? true) ||
                  (password?.isEmpty ?? true)) {
                print('Have space');
                normalDialog(context, 'Have space?', 'Please Fill Every Blank');
              } else if (typeUser == null) {
                //ยังไม่ทำการเลือก typeUser
                normalDialog(context, 'No TypeUser',
                    'Please Choose Type User By Click User or Technichian');
              } else {
                createAccountAndInsertInformation();
              }
            },
            icon: Icon(Icons.cloud_upload),
            label: Text('Create Account')));
  }

  Future<Null> createAccountAndInsertInformation() async {
    //method ตัวนี้ทำหน้าที่สร้าง account บน firebase
    await Firebase.initializeApp()
        .then((value) => print('##Firebase Initialize Success##'));
  }

  Container buildTypeUser() {
    return Container(
      width: screenWidth! * 0.6,
      child: RadioListTile(
        //ช่องกลมเพื่อติ๊ก
        value: 'user',
        groupValue: typeUser,
        onChanged: (value) {
          setState(() {
            typeUser = value;
          });
        },
        title: Text(
          'User',
          style: MyStyle().darkStyle(),
        ),
      ),
    );
  }

  Container buildTypeTechnichian() {
    return Container(
      width: screenWidth! * 0.6,
      child: RadioListTile(
        //ช่องกลมเพื่อติ๊ก
        value: 'Technichian',
        groupValue: typeUser,
        onChanged: (value) {
          setState(() {
            typeUser = value;
          });
        },
        title: Text(
          'Technichian',
          style: MyStyle().darkStyle(),
        ),
      ),
    );
  }

  Container buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.6,
      child: Text(
        'Type User:',
        style: MyStyle().darkStyle(),
      ),
    );
  }
}
