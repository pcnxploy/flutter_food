import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FLUTTER FOOD',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
          'THIS IS A HOME PAGE',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
