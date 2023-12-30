// auth_screen.dart
import 'package:fasfood/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'sign_in_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Galaxy'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ElevatedButton(
              //onPressed: () {

              //},
              //child: Text('S\'inscrire'),
            //),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }

}
