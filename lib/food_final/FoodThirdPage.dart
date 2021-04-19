import 'package:animate_do/animate_do.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_animation/FoodThirdPage/cart_list.dart';
import 'package:flutter_page_animation/food_App/plate_list.dart';


import 'FoodLastPage.dart';





class FoodThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 30),
              child: Text("Your Order",
                  style: TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      color: Color(0xffB5DC63))),
            ),
            SizedBox(height: 20),
            Container(
              child: ListView.builder(
                  itemCount:plates.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeInDown(
                        duration: Duration(milliseconds: 600 * index),
                        child: CartList(
                            image: plates[index].image,
                            title: plates[index].title,
                            rate: plates[index].price,
                            weight: plates[index].weight),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 50,
            ),
            DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                  Text(
                    "₹ 205.0",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // DetailNew(movie_data: movies[index])));
                            FoodLastPage()));
              },
              child: Center(
                child: Container(
                  height: 75,
                  width: screenWidth * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffB5DC63),
                  ),
                  child: Center(
                      child: Text(
                    "Checkout",
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
