import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pra_login/models/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    createSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade200,
        child: Center(child: Text('Welcome',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700, color: Colors.white),)),
      ),
    );
  }

  Future<void> createSplashScreen() async {

    await Hive.initFlutter();

    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(UserAdapter());
    }

    await Hive.openBox<User>('usersBox');
    await Hive.openBox<String>('currentUserBox');

    var currentUserBox = Hive.box<String>('currentUserBox');
    String? email = currentUserBox.get('current_user');

    await Future.delayed(const Duration(seconds: 2), () {
      if (email != null) {
          Navigator.pushReplacementNamed(context, 'home');
      } else {
        Navigator.pushReplacementNamed(context, 'login');
      }
    });
  }
}