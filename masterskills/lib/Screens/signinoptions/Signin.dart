import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:masterskills/Screens/HomeScreen.dart';
import 'package:masterskills/Screens/signinoptions/signUp.dart';
import 'package:masterskills/Services/Authentication.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authentication authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: 500.0,
              height: 350.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/signin.png'), fit: BoxFit.cover),
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
                'Sign In',
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
                  await authentication.googleSignIn().then((value) {
                    if (value == 'success') {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Homescreen(),
                              type: PageTransitionType.leftToRight));
                    } else {
                      print("Google Log in failed");
                    }
                  });
                },
                icon: Icon(
                  EvaIcons.google,
                  size: 30,
                ),
                label: Text(
                  'Sign in With Google',
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
                    'New Here?',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: SignUp(),
                            type: PageTransitionType.leftToRight),
                      );
                    },
                    child: Text(
                      'Create An Account',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
