import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_item.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);
  static const routeName = '/foodDetails';

  @override
  Widget build(BuildContext context) {
    var food = ModalRoute.of(context)!.settings.arguments as FoodItem;
    return Scaffold(
      appBar: AppBar(
        title: Text('${food.name}'),
        backgroundColor: Colors.green.shade300,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/${food.image}'),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 8),
              child: Text(
                'ชื่อเมนู: ${food.name}',
                style: GoogleFonts.sarabun(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'ราคา: ${food.price} บาท',
                style: GoogleFonts.sarabun(fontSize: 20.0),
                //style: GoogleFonts.prompt(fontSize: 50.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
