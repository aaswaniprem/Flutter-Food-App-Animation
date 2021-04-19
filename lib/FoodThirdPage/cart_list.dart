import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final String image;
  final String title;
  final String weight;
  final String rate;


  CartList({this.image, this.title, this.weight, this.rate});

  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;

    return Container(
        height: 110,
        width: screen_width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 140,
              decoration: BoxDecoration(
         shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover)),


            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(height: 5),

                  Text(
                  weight,
                    style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    rate,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0  ,top: 25 ),
              child: Container(
                height: 42,
                width: 100,
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
            )

            // Image(image: AssetImage("assets/meat_Salad.png" ) , height: 140 , width: 140, )
          ],
        ),

    );
  }
}
