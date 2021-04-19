import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_animation/Food-Second-Page/Ingredient_list.dart';

import 'package:sa_stateless_animation/sa_stateless_animation.dart';

import 'FoodThirdPage.dart';

class FoodSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -240,
              child: Container(
                height: 540,
                width: screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/chicken_salad.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 3.0,
                    sigmaY: 3.0,
                  ),
                  child: Container(
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              )),

          /////////////////////////////////
          //bottom-image

          Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/greek_Salad.png"),
                        fit: BoxFit.cover)),
              )),
          ///////////////////////////////////////////////////////
          Positioned(
            top: 140,
            left: 30,
            child: PlayAnimation(
                tween: Tween(begin: -1.0, end: 0.0),
                duration: Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
                builder: (context, child, scaleValue) {
                  return Transform(
                    transform: Matrix4.translationValues(
                        scaleValue * screenWidth, 0, 0),
                    child: Image.asset(
                      "assets/green.png",
                      width: screenWidth * 0.5,
                    ),
                  );
                }),
          ),

          Positioned(
              top: 120,
              right: 45,
              child: PlayAnimation(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
                builder: (context, child, scaleValue) {
                  return Transform(
                      transform: Matrix4.translationValues(
                          scaleValue * screenWidth, 0, 0),
                      child: Image.asset(
                        "assets/green.png",
                        width: screenWidth * 0.5,
                      ));
                },
              )),
          Positioned(
              top: 140,
              right: 90,
              child: PlayAnimation(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
                builder: (context, child, scaleValue) {
                  return Transform(
                      transform: Matrix4.translationValues(
                          scaleValue * screenWidth, 0, 0),
                      child: Image.asset(
                        "assets/tommato.png",
                        width: screenWidth * 0.08,
                      ));
                },
              )),

          Positioned(
              top: 270,
              left: 80,
              child: PlayAnimation(
                tween: Tween(begin: -1.0, end: 0.0),
                duration: Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
                builder: (context, child, scaleValue) {
                  return Transform(
                      transform: Matrix4.translationValues(
                          scaleValue * screenWidth, 0, 0),
                      child: Image.asset(
                        "assets/tommato.png",
                        width: screenWidth * 0.08,
                      ));
                },
              ))

///////////////////////////////////////////////////////////////////////
          ,
          Positioned(
              top: 360,
              left: 140,
              right: 140,
              child: PlayAnimation(
                  tween: Tween(begin: 1.0, end: 0.0),
                  duration: Duration(milliseconds: 700),
                  curve: Curves.fastOutSlowIn,
                  builder: (context, child, scaleValue) {
                    return Transform(
                      transform: Matrix4.translationValues(
                          0, scaleValue * screenHeight, 0),
                      child: Container(
                        height: 42,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: Color(0xffE9EAE8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                            Text(
                              "+",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),

          Positioned(
              top: 450,
              left: 30,
              right: 0,
              child: PlayAnimation(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: Duration(milliseconds: 700),
                curve: Curves.fastOutSlowIn,
                builder: (context, child, scaleValue) {
                  return Transform(
                      transform: Matrix4.translationValues(
                          0, scaleValue * screenHeight, 0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Ingredients",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              height: 80,
                              child: ListView.builder(
                                  itemCount: ingredient_image.length,
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Color(0xffE9EAE8),
                                        ),
                                        width: 70,
                                        child: Image.asset(
                                          ingredient_image[index],
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ));
                },
              )),

          Positioned(
              top: 590,
              left: 30,
              right: 30,
              child: PlayAnimation(
                  tween: Tween(begin: 1.0, end: 0.0),
                  duration: Duration(milliseconds: 700),
                  curve: Curves.fastOutSlowIn,
                  builder: (context, child, scaleValue) {
                    return Transform(
                      transform: Matrix4.translationValues(
                          0, scaleValue * screenHeight, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "The perfect pizza crust topped with homemade pizza sauce"
                                ", gooey cheese and tons of sausage, "
                                "pepperoni and crumbled bacon! A meat lovers dream come true..",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              // DetailNew(movie_data: movies[index])));
                                              FoodThirdPage()));
                                },
                                child: Center(
                                  child: Container(
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffB5DC63),
                                      ),
                                      child: Center(
                                        child: Icon(Icons.remove_shopping_cart),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
