import 'package:flutter/material.dart';
import 'package:flutter_page_animation/food_App/plate_list.dart';
import 'package:flutter_page_animation/size_config.dart';

class MoviePreview extends StatelessWidget {
  final int index;

  const MoviePreview({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: getProportionateScreenHeight(250),
          child: Image.asset(
            plates[index].image,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
