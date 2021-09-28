import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('FOOD MENU',style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
