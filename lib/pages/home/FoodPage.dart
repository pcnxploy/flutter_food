import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/FoodListPage.dart';
import 'package:flutter_food/pages/home/OrderPage.dart';

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
