import 'package:flutter/material.dart';
import 'FoodHomePage.dart';

class FoodLastPage extends StatefulWidget {
  @override
  _FoodLastPageState createState() => _FoodLastPageState();
}

class _FoodLastPageState extends State<FoodLastPage> {
  @override
  Widget build(BuildContext context) {
    String _image = "assets/great_success_animation.gif";

    double padding = 16.0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(context: context, image: _image, padding: padding),
    );
  }

  Widget buildBody({BuildContext context, String image, double padding}) {
    return FutureBuilder(
      future: _login(),
      builder: (context, snapshot) {
        return Center(
          child: Padding(
            padding: EdgeInsets.only(top: padding * 2),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
        );
      },
    );
  }

//////////////////////////////////////////////////////
  Future<String> _login() async {
    await Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return FoodHomePage();
          },
        ),
      );
    });

    return "Logined";
  }
}
