import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_auth/authentication.dart';
import 'package:google_auth/googlebutton.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign in'),
      ),
      body: FutureBuilder(
        future: Authentication.initializeFirebase(context: context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error ');
          } else if (snapshot.connectionState == ConnectionState.done) {
            return GoogleSigninButton();
          }
          return CircularProgressIndicator(
            color: Colors.blue,
          );
        },
      ),
    );
  }
}
