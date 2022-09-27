import 'package:findtechnic/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double? screenWidth, screenHeight;
  bool redEye = true; //สร้างเพื่อซ่อนการมองเห็นของรหัสผ่าน

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context)
        .size
        .width; //กำหนดให้ screenWidth มีขนาดเท่าความกว้างของจอ
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
          ),
          Text(
            'Non Account ?',
            style: MyStyle().whiteStyle(),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Create Account',
                style: MyStyle().blackStyle(),
              ))
        ],
      ),
      body: SafeArea(
        //widget SafeArea ใช้ในการทำให้โลโก้อยู่ในกรอบหน้าจอ
        child: Stack(
          children: [
            MyStyle().buildBackground(screenWidth!, screenHeight!),
            Positioned(
              top: 32,
              left: 16,
              child: buildLogo(),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildUser(),
                  buildPassword(),
                  buildSignInEmail(),
                  buildSignInGoogle(),
                  buildSignInFacebook(),
                  buildSignInlApple(),
                  SizedBox(
                    height: screenHeight! * 0.1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSignInEmail() => Container(
        margin: EdgeInsets.only(top: 8),
        child: SignInButton(
          Buttons.Email,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );

  Container buildSignInGoogle() => Container(
        margin: EdgeInsets.only(top: 8),
        child: SignInButton(
          Buttons.GoogleDark,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );

  Container buildSignInFacebook() => Container(
        margin: EdgeInsets.only(top: 8),
        child: SignInButton(
          Buttons.FacebookNew,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );

  Container buildSignInlApple() => Container(
        margin: EdgeInsets.only(top: 8),
        child: SignInButton(
          Buttons.AppleDark,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screenWidth! * 0.6,
      child: TextField(
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
        //สร้างช่องในการใส่ข้อความ
        obscureText:
            redEye, //เมื่อค่า redEye เป็น true ตัวอักษรจะถูกแทนที่ด้วย obscureText
        decoration: InputDecoration(
          suffix: IconButton(
            //suffix สร้างไอคอนที่สามารภเปลี่ยนแปลงได้
            icon: Icon(
              redEye
                  ? Icons.remove_red_eye_outlined
                  : Icons
                      .remove_red_eye_sharp, //กำหนดให้ไอคอน redEye เปลี่ยนไปเมื่อกดไอคอน
              color: MyStyle().darkColor,
            ),
            onPressed: () {
              setState(() {
                redEye = !redEye;
              });
            },
          ),
          prefixIcon: Icon(
            Icons
                .lock_outlined, // lock_outlined คือชื่อไอคอนที่อยู่ใน material.io (ของgoogle)
            color: MyStyle().darkColor,
          ),
          labelStyle: MyStyle().darkStyle(),
          labelText: 'Password :',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), //ขอบของช่องเป็นโค้งมน
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
        width: screenWidth! * (0.35), //ใช้ container เพื่อให้object มีSize ตามที่เราต้องการ
        child: MyStyle().showLogo());
  }
}
