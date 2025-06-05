import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phone_auth_firebase/homePage.dart';
import 'package:phone_auth_firebase/main.dart';
import 'package:phone_auth_firebase/welcome.dart';
import 'package:pinput/pinput.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  var code = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('otp')),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              length: 6,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onChanged: ((value) {
                code = value;
              }),
              onCompleted: (pin) => print(pin),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: MyWidget.verify, smsCode: code);
                  await auth.signInWithCredential(credential);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => welcome()));
                } catch (e) {
                  print('wrong OTP');
                }
              },
              child: Text('Verify Number'),
            ),
            InkWell(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homepage()));
                }),
                child: Text('Edit Number'))
          ],
        ),
      )),
    );
  }
}
