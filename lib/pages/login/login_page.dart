import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // ไล่เฉดจากสีแดงไปสีน้ำเงิน
            colors: [
              Colors.yellow.shade100,
              Colors.green.shade200,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 100.0,
                        color: Colors.green.shade300,
                      ),
                      Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.green.shade300,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Enter PIN to login',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 80.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 0; i < input.length; i++)
                            Container(
                              margin: EdgeInsets.all(4.0),
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade300,
                                  shape: BoxShape.circle),
                            ),
                          for (var i = input.length; i < 6; i++)
                            Container(
                              margin: EdgeInsets.all(4.0),
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: Colors.green.shade200,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //color: Colors.pinkAccent,
                child: Column(
                  children: [
                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [-2, 0, -1],
                  ].map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: item == -2
                              ? LoginButton(
                                  number: item,
                                  onClick: _handleClickButton,
                                )
                              : LoginButton(
                                  number: item,
                                  onClick: _handleClickButton,
                                ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String pin = '123456';
  var input = ''; //เก็บตัวเลขที่กดเข้ามา

  /*_dNumber() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: Colors.green[600],
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  _dNumber2() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: Colors.green[300],
          shape: BoxShape.circle,
        ),
      ),
    );
  }*/

  void _handleClickButton(int num) async {
    setState(() {
      if (num == -1) {
        if (input.length > 0) {
          input = input.substring(0, input.length - 1);
        }
      } else {
        input = '$input$num'; //ตัวเลขที่กดเข้ามา
      }
      if (input.length == 6) {
        //call API
        _api();
      }
    });
  }

  //check input == pin ?
  void _api() async{
    var url = Uri.parse('https://cpsu-test-api.herokuapp.com/login');
    //post = input, get = output
    var response = await http.post(url ,body: {
      'pin' : input
    });

    //connect
    if(response.statusCode == 200){
      Map<String, dynamic> jsonBody = json.decode(response.body);
      bool data = jsonBody['data']; // pin true or false

      if(data){
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }else{
        _showMaterialDialog('ERROR', 'Invalid PIN. Please try again.');
        setState(() {
          input = '';
        });
      }
    }
}

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

//คนละคลาส
class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2 ? null : () => onClick(number),
      //กำหนดฟังก์ชันให้ onClick คือเมื่อกดปุ่มก็จะส่งค่าคืนออกไป
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
                shape: BoxShape.circle,
                //border: Border.all(width: 2.0),
                color: Colors.white24),
        child: Center(
          child: number >= 0
              ? Text(
                  number.toString(),
                  style: Theme.of(context).textTheme.headline6,
                )
              : (number == -1
                  ? Icon(
                      Icons.backspace_outlined,
                      size: 24.0,
                    )
                  : SizedBox.shrink()), //ว่าง
        ),
      ),
    );
  }
}
