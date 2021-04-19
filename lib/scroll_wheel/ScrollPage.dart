import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:list_wheel_scroll_view_x/list_wheel_scroll_view_x.dart';

class ScrollPage extends StatefulWidget {
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //   body: ListWheelScrollView(
        //       itemExtent: 50,
        //       diameterRatio: 1.2,
        //       children: List.generate(50, (index) => Container1())),
        // );

        body: CircleListScrollView(
          itemExtent: 250,
          radius: MediaQuery.of(context).size.width * 0.5,
          axis: Axis.horizontal,
          physics: CircleFixedExtentScrollPhysics(),
          children: List.generate(3, (index) => Container1()),
        ));
  }

  Widget Container1() {
    return Center(
        child: Image.asset(
      "assets/chicken_salad.png",
    ));
  }
}
