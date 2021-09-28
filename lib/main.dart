import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/homepage.dart';
import 'package:flutter_food/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 20.0, color: Colors.white,fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 15.0),
          bodyText2: TextStyle(fontSize: 14.0),
        ),
      ),
      //home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => const HomePage(),
      },
      //ตั้งค่าหน้าเริ่มต้น(หน้าแรกที่เปิดแอพ)
      initialRoute: '/login',
    );
  }
}

//การเปลี่ยนไปหน้าถัดไปโดยย้อนกลับไม่ได้
/* Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),*/
