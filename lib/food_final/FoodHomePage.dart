import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_page_animation/food_App/FoodTest2.dart';
import 'package:flutter_page_animation/food_App/movie_preview.dart';
import 'package:flutter_page_animation/food_App/plate_list.dart';



import '../size_config.dart';
import 'FoodSecondPage.dart';

class FoodHomePage extends StatefulWidget {
  @override
  _FoodHomePageState createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          FoodTest2(
              itemCount: plates.length,
              backViewBuilder: (index) => Stack(
                    children: [
                      Positioned(
                        top: -150,
                        height: 480,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              // image
                              Flexible(
                                  fit: FlexFit.tight,
                                  // child: Image.asset(
                                  //   plates[index].image,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  child: ClipRRect(
                                    child: Container(
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage(plates[index].image),
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
                                    ),
                                  )),

                              // text: title
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 420,
                          child: Container(
                            height: 150,
                            width: screenWidth,
                            child: Column(
                              children: [
                                Text(
                                  plates[index].title,
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffB5DC63),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  plates[index].price,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
              frontViewBuilder: (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                // DetailNew(movie_data: movies[index])));
                                FoodSecondPage()));
                  },
                  child: MoviePreview(index: index))),
          Positioned(
              bottom: 200,
              left: 50,
              right: 50,
              child: Column(
                children: [
                  Container(
                    height: 75,
                    width: screenWidth * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffB5DC63),
                    ),
                    child: Center(
                        child: Text(
                      "Add To Cart",
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Swipe to See Recipe",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black45,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
