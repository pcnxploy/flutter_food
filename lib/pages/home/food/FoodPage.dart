
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_item.dart';
import 'package:flutter_food/pages/home/food/FoodListPage.dart';
import 'package:flutter_food/pages/home/OrderPage.dart';
import 'package:http/http.dart' as http;

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        child: Icon(Icons.add),
      ),
      body: Center(
          child: _selectedBottomNavIndex == 0 ? FoodListPage() : OrderPage()),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Your Order'),
        ],
        currentIndex: _selectedBottomNavIndex, //สีปุ่มที่เลือก
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}

void _test() async {

  var url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
  var response = await http.get(url); //await >> then

  if (response.statusCode == 200) {

    //ดึงค่า response.body(เป็น String) ออกมา
    Map<String, dynamic> jsonBody = json.decode(response.body);
    //json.decode แปลง json(String) >> dart,list
    String status = jsonBody['status'];
    String? message = jsonBody['message'];
    List<dynamic> data = jsonBody['data'];

    //print('STATUS: $status');
    //print('MESSAGE: $message');
    //print('data: $data');

    //element คือ map แต่ละตัวใน list
    var foodList = data.map((element) =>
        FoodItem(
          id: element['id'],
          name: element['name'],
          price: element['price'],
          image: element['image'],
        )).toList();

    /*data.forEach((element) {
      FoodItem(
        id: element['id'],
        name: element['name'],
        price: element['price'],
        image: element['image'],
      );
    });*/
  }
}
