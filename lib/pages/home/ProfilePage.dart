import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    child: Image.asset('assets/images/profile.jpg'),
                  )),
              SizedBox(height: 15.0),
              Text(
                'Pornchanok Onsanit',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 5.0),
              Text(
                'onsanit_p@silpakorn.edu',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}