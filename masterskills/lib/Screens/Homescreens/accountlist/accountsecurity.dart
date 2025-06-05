import 'package:flutter/material.dart';

class AccountSecurity extends StatefulWidget {
  const AccountSecurity({Key key}) : super(key: key);

  @override
  State<AccountSecurity> createState() => _AccountSecurityState();
}

class _AccountSecurityState extends State<AccountSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Account Security',
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'images/accsec.png',
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '\n\n You can\'t get in to your account, and you want to reset your password\n\n You\'ve signed up for 2-Step Verification\n\n You\'re creating an account, and we want to make sure you\'re not a robot\n\n You\'re signing in, and we want to make sure that you\'re really you\n\n You\'ve made changes to your account',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
