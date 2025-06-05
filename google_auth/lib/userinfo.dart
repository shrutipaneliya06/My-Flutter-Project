import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_auth/authentication.dart';
import 'package:google_auth/signin.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('welcome')),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Text(
            _user.displayName!,
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '( ${_user.email!} )',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 24.0),
          _isSigningOut
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await Authentication.signOut(context: context);

                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => signin()));
                  },
                  child: Text('sign out'))
        ],
      ),
    );
  }
}
