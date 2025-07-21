import 'package:flutter/material.dart';
import 'package:chocobuy/widgets/input_field.dart';
import 'package:chocobuy/screens/login_screnn.dart';
import 'dart:async';

import '../main.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  void initState() {
    super.initState();

    // Wait 7 seconds then navigate to home
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginScrenn()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Stack(
      fit: StackFit.expand,
      children: [
        Opacity(opacity: 0.5, child: Image.asset('./assets/images/background.jpg', fit: BoxFit.cover,)
          ,),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("co/choc", style: TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),),
              Text("A way to enjoy bitter and sweet of life", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
            ],
          ),
        )
        ,
      ],
    ),
    );
  }
}