import 'package:flutter/material.dart';
import 'package:task2/constant/reuseableWidget.dart';
import 'widgets.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeViewFirstSection(),
          JustClickSearchSection(
            margin: MediaQuery.of(context).size.width * 0.08,
          ),
          ThirdSection(),
        ],
      ),
    );
  }
}
