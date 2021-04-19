import 'package:flutter/material.dart';
import 'package:flutter_page_animation/food_App/size_config.dart';
import 'LinkedPageView.dart';

class FoodHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Colors.green,
        body: Stack(
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.6,
              width: SizeConfig.screenWidth,
              child: LinkedPageView(),
            ),
          ],
        ));
  }
}
