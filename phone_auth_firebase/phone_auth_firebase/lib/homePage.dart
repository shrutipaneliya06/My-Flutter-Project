import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phone_auth_firebase/main.dart';
import 'package:phone_auth_firebase/otp.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  static String verify = '';

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController countery = TextEditingController();
  var phone = '';
  @override
  void initState() {
    // TODO: implement initState
    countery.text = '+91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('phone')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                        width: 60,
                        child: Flexible(
                            child: TextFormField(
                          controller: countery,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ))),
                    Text(
                      '|',
                      style: TextStyle(fontSize: 50),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phone = value;
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter Phone Number',
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countery.text + phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      MyWidget.verify = verificationId;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => otp()));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: Text('Send OTP'),
              ),
            ],
          ),
        ));
  }
}
