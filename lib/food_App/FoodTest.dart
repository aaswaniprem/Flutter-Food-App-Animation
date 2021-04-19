import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_page_animation/food_App/page_notifier.dart';
import 'package:flutter_page_animation/food_App/plate_list.dart';
import 'package:provider/provider.dart';

class FoodTest extends StatefulWidget {

  final Function(int) backViewBuilder;
  final Function(int) frontViewBuilder;
  final int itemCount;

  const FoodTest(
      {Key key,
        @required this.backViewBuilder,
        @required this.frontViewBuilder,
        @required this.itemCount})
      : super(key: key);





  @override
  _FoodTestState createState() => _FoodTestState();
}

class _FoodTestState extends State<FoodTest> {
  PageController _pageController = PageController(viewportFraction: 1);

  PageNotifier backPageNotifier = PageNotifier();
  PageNotifier frontPageNotifier = PageNotifier(viewportFraction: 0.7);

  @override
  void initState() {
    super.initState();
    frontPageNotifier.pageController..addListener(_onMainScroll);
  }

  @override
  void dispose() {
    frontPageNotifier.pageController.dispose();
    super.dispose();
  }

  _onMainScroll() {
    backPageNotifier.pageController
        .jumpTo(frontPageNotifier.pageController.offset / 0.7);
  }








  @override
  Widget build(BuildContext context) {










    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: frontPageNotifier,

        child: Stack(
          children: [
            //plates
            Positioned(
              top: -150.0,
              left: 2,
              right: 2,
              height: 530,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plates.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Container(
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
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: AssetImage(plates[index].image),
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
                  );
                },
              ),
            ),

            ///////////////////////////////////////////////
            //Bottom page view

            Positioned(
              child: PageView.builder(
                  controller: frontPageNotifier.pageController,
                  itemCount: widget.itemCount,
                  itemBuilder: (context, index) => Consumer<PageNotifier>(
                        builder: (context, value, child) {
                          return Transform.translate(
                              offset: Offset(
                                  0, (value.currentPage - index).abs() * 50),
                              child: Opacity(
                                opacity: max(
                                    1 - (value.currentPage - index).abs() * 0.5,
                                    0.75),
                                child: child,
                              ));
                        },
                        child: widget.frontViewBuilder(index),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
