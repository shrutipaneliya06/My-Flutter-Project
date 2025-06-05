import 'package:email_auth_firebase/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _signOut();
                });
              },
              icon: Icon(Icons.sign_language_outlined)),
        ],
        title: Text('welcome'),
      ),
    );
  }
}
