import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:task2/constant/constant.dart';

import 'mainScreenView/accountView.dart';
import 'mainScreenView/bookView.dart';
import 'mainScreenView/homeViewWidget/homeView.dart';
import 'mainScreenView/shopsView.dart';

class MainView extends StatefulWidget {
  static final id = 'mainView';
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  List<Widget> screenListObject = [
    HomeView(),
    ShopsView(),
    BookView(),
    AccountView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: bottomBarObject,
      ),
      body: screenListObject[currentIndex],
    );
  }
}
