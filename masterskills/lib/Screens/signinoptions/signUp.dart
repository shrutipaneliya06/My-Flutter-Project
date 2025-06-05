import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:masterskills/Screens/signinoptions/Signin.dart';
import 'package:page_transition/page_transition.dart';

import '../../Services/Authentication.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // width: 500.0,
                height: 350.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/signin.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  ),
                  color: Colors.redAccent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    await authentication.googleSignIn();
                  },
                  icon: Icon(
                    EvaIcons.google,
                    size: 30,
                  ),
                  label: Text(
                    'Sign up With Google',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have Account?',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: SignIn(),
                              type: PageTransitionType.leftToRight),
                        );
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
