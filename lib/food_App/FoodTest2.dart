import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_page_animation/food_App/page_notifier.dart';
import 'package:flutter_page_animation/food_App/plate_list.dart';
import 'package:flutter_page_animation/size_config.dart';
import 'package:provider/provider.dart';

class FoodTest2 extends StatefulWidget {
  final Function(int) backViewBuilder;
  final Function(int) frontViewBuilder;
  final int itemCount;

  const FoodTest2(
      {Key key,
      @required this.backViewBuilder,
      @required this.frontViewBuilder,
      @required this.itemCount})
      : super(key: key);

  @override
  _FoodTestState createState() => _FoodTestState();
}

class _FoodTestState extends State<FoodTest2> {
  PageController _pageController = PageController(viewportFraction: 1);

  PageNotifier backPageNotifier = PageNotifier();
  PageNotifier frontPageNotifier = PageNotifier(viewportFraction: 1);

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
        .jumpTo(frontPageNotifier.pageController.offset / 1);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: frontPageNotifier,
        child: Stack(
          children: [
            //plates
            Positioned(
              top: 0.0,
              left: 2,
              right: 2,
              height: screenheight * 0.6,
              child: Container(
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: backPageNotifier.pageController,
                    itemCount: widget.itemCount,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return widget.backViewBuilder(index);
                    }
//return
                    //          Container(
                    //   child: Column(
                    //     children: <Widget>[
                    //       // image
                    //       Flexible(
                    //           fit: FlexFit.tight,
                    //           // child: Image.asset(
                    //           //   plates[index].image,
                    //           //   fit: BoxFit.cover,
                    //           // ),
                    //
                    //           child: ClipRRect(
                    //             child: Container(
                    //               width: screenWidth,
                    //               decoration: BoxDecoration(
                    //                 color: Colors.red,
                    //                 image: DecorationImage(
                    //                   image: AssetImage(plates[index].image),
                    //                   fit: BoxFit.cover,
                    //                 ),
                    //               ),
                    //               child: BackdropFilter(
                    //                 filter: ImageFilter.blur(
                    //                   sigmaX: 3.0,
                    //                   sigmaY: 3.0,
                    //                 ),
                    //                 child: Container(
                    //                   color: Colors.white.withOpacity(0.6),
                    //                 ),
                    //               ),
                    //             ),
                    //           )),
                    //
                    //       // text: title
                    //     ],
                    //   ),
                    // );

                    ),
              ),
            ),

            ///////////////////////////////////////////////
            //Bottom page view

            ////////////////////////////////////////////////////////////
            Positioned(
              top: getProportionateScreenHeight(120),
              left: 0,
              right: 0,
              height: getProportionateScreenHeight(320),
              child: Container(
                child: PageView.builder(
                    controller: frontPageNotifier.pageController,
                    itemCount: widget.itemCount,
                    itemBuilder: (context, index) => Consumer<PageNotifier>(
                          builder: (context, value, child) {
                            double angle = (value.currentPage - index) * 5.5;
                            return Transform.translate(
                                offset: Offset(
                                    0, (value.currentPage - index).abs() * 10),
                                child: Opacity(
                                  opacity: max(
                                      1 -
                                          (value.currentPage - index).abs() *
                                              0.5,
                                      0.75),
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.001)
                                      ..rotateZ(angle),
                                    alignment: FractionalOffset.center,
                                    child: child,
                                  ),
                                ));
                          },
                          child: widget.frontViewBuilder(index),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
