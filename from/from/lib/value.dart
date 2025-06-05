import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class valuee extends StatelessWidget {
  String? name1, email1, phone1, address1, pin1, check1, radio1;

  valuee({
    super.key,
    this.name1,
    this.email1,
    this.phone1,
    this.address1,
    this.pin1,
    this.check1,
    this.radio1,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'User Name : $name1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              'User Email : $email1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              'User Phone : $phone1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              'User Address : $address1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              'User pincode : $pin1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              'User Name : $check1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              'User Name : $radio1',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class checkstate {
  String title;
  bool value;
  checkstate({required this.title, required this.value});
}
