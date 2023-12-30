// sign_in_screen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'food_menu_screen.dart';

class SignInScreen extends StatelessWidget {
  User? firebaseAuth = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, )
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "E-mail",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, )
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Mot de passe",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: (){},
                child: Text("connexion")),
            // Ajoutez ici les champs de connexion nécessaires

    firebaseAuth !=null? ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodMenuScreen()),
                );
              },
              child: Text('Accéder au menu'),
            ):Container(),
          ],
        ),
      ),
    );
  }
}
