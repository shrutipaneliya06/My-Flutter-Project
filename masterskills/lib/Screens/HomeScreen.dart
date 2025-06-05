import 'package:flutter/material.dart';
import 'package:masterskills/Screens/Homescreens/Featured.dart';
import 'package:masterskills/Screens/Homescreens/Read.dart';

import 'package:masterskills/Screens/Homescreens/Search.dart';
import 'package:masterskills/Screens/Homescreens/Wishlist.dart';
import 'package:masterskills/Screens/Homescreens/quizzz.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  PageController pageController = new PageController();
  int currentIndex = 0;

  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  // void initState() {
  //   super.initState();
  //   _firebaseMessaging.configure(
  //     onLaunch: (Map<String, dynamic> message) async {
  //       setState(() {
  //         _message = message['title'];
  //       });
  //       print(_message);
  //     },
  //     onResume: (Map<String, dynamic> message) async {
  //       setState(() {
  //         _message = message['title'];
  //       });
  //       print(_message);
  //     },
  //     onMessage: (Map<String, dynamic> message) async {
  //       setState(() {
  //         _message = message['title'];
  //       });
  //       print(_message);
  //     },
  //   );

  //   _firebaseMessaging.getToken().then((value) {
  //     print(value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children: [
          Featured(),
          Search(),
          quizzz(),
          Wishlist(),
          read(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.grey),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.black,
        iconSize: 30.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Featured',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            label: 'WishList',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.read_more),
            label: 'Read',
          ),
        ],
      ),
    );
  }
}
