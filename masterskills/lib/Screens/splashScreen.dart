import 'dart:async';

import 'package:flutter/material.dart';
import 'package:masterskills/Screens/HomeScreen.dart';
import 'package:masterskills/Screens/landingPage.dart';
import 'package:masterskills/Services/Storage.dart';
import 'package:page_transition/page_transition.dart';

String finalEmail, finalName;

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  final SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
    });
    secureStorage.readSecureData('name').then((value) {
      finalName = value;
    });

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              PageTransition(
                  child: finalEmail == null ? landingPage() : Homescreen(),
                  type: PageTransitionType.rightToLeftWithFade),
            ));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300.0,
                child: Image.asset('images/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
