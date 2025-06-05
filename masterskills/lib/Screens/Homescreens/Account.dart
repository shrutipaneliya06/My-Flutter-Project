import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/accountlist/aboutmaster.dart';
import 'package:masterskills/Screens/Homescreens/accountlist/accountsecurity.dart';
import 'package:masterskills/Screens/Homescreens/accountlist/emailnotification.dart';
import 'package:masterskills/Screens/Homescreens/accountlist/needhelp.dart';
import 'package:masterskills/Screens/signinoptions/Signin.dart';
import 'package:masterskills/Screens/splashScreen.dart';
import 'package:masterskills/Services/Authentication.dart';
import 'package:masterskills/Services/Storage.dart';
import 'package:page_transition/page_transition.dart';

class Account extends StatefulWidget {
  const Account({Key key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Authentication authentication = Authentication();
  SecureStorage secureStorage = SecureStorage();
  void getUser() async {
    secureStorage.readSecureData('email').then((value) {
      setState(() {
        finalEmail = value;
      });
    });
    secureStorage.readSecureData('name').then((value) {
      setState(() {
        finalName = value;
      });
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Account',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 100,
                          ),
                        ),
                        Text(
                          finalName != null ? finalName : 'shruti patel',
                          // finalName,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                EvaIcons.google,
                                color: Colors.white,
                              ),
                              Text(
                                finalEmail != null
                                    ? finalEmail
                                    : 'UserName@gmail.com',
                                // finalEmail,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              'MasterSkill Users',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Account Settings',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AccountSecurity();
                      }));
                    }),
                    child: ListTile(
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Account Security',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EmailNotification();
                      }));
                    }),
                    child: ListTile(
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Email Notification Preferences',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Support',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AboutMaster();
                      }));
                    }),
                    child: ListTile(
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      title: Text(
                        'About Master Skills',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NeedHelp();
                      }));
                    }),
                    child: ListTile(
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      title: Text(
                        'FAQs',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: MaterialButton(
                      onPressed: () async {
                        await authentication.googleSignOut().whenComplete(() {
                          secureStorage.deleteSecureData('email');
                        }).whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: SignIn(),
                                  type: PageTransitionType.leftToRight));
                        });
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text(
                        'Master Skills v1.0.0',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
