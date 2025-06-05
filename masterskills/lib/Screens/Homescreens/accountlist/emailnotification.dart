import 'package:flutter/material.dart';

class EmailNotification extends StatefulWidget {
  const EmailNotification({Key key}) : super(key: key);

  @override
  State<EmailNotification> createState() => _EmailNotificationState();
}

class _EmailNotificationState extends State<EmailNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Email Notification Preferences',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'images/emailnoti.png',
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '\nOpen the Gmail app. \nAt the top left, tap Menu Menu and then Settings Settings. \nSelect the account you want to change. \nUnder “Notifications,'
                ' tap Notification sounds. \nTap Email or Chat and spaces. \nIn the window that opens, tap Go to settings. \nTap Sound or Advanced Drop down arrow and then Sound. \nUnder “My sounds,” pick a sound. \nTo turn off Notification sounds, select None.',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
