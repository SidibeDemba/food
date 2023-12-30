// main.dart
import 'package:fasfood/controllers/login_controller.dart';
import 'package:fasfood/firebase_options.dart';
import 'package:fasfood/food_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';

main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(RestaurantGalaxyApp());
}

class RestaurantGalaxyApp extends StatelessWidget {
  LoginController loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Restaurant Galaxy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:loginController.isSigningIn.value ? FoodMenuScreen() : AuthScreen(),
    );
  }
}
