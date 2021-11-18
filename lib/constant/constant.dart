import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

final String firstFont = 'YujiBoku-Regular';
final String secondFont = '';

final Color firstColor = Color(0xFFfc4549);

final TextStyle pTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

final AssetImage iconImage = AssetImage('assets/images/barber-shop.png');

List<SalomonBottomBarItem> bottomBarObject = [
  SalomonBottomBarItem(
      icon: Icon(Ionicons.bulb_outline),
      title: Text('Home'),
      activeIcon: Icon(Ionicons.bulb),
      selectedColor: Colors.blue),
  SalomonBottomBarItem(
      icon: Icon(Ionicons.cut),
      title: Text('barberShop'),
      selectedColor: firstColor),
  SalomonBottomBarItem(
      icon: Icon(Ionicons.bookmark),
      title: Text('Booked'),
      selectedColor: Colors.pinkAccent),
  SalomonBottomBarItem(
      icon: Icon(Icons.person),
      title: Text('account'),
      selectedColor: Colors.blueGrey),
];
