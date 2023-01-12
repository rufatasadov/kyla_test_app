import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyle_test_app/config/constants.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _controller;
  double _currentPageValue = 0.0;

  double x = 0;
  double x2 = 0;
  double y = 0;
  double z = 0;

  late Animation animationCard;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      viewportFraction: 0.7,
    );

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animationCard = Tween(begin: 1, end: 0.001).animate(_controller);

    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CardConstants.height,
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
            left: 5,
            child: Container(
              width: 50,
              padding: EdgeInsets.all(8.0),
              color: Colors.orange,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text('sample'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text('sample'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text('sample'),
                      ),
                    ),
                  ]),
            ))
      ]),
    );
  }

  Widget _cardItem(int index) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: CardConstants.width,
        height: CardConstants.height,
        padding: EdgeInsets.all(8.0),
        child: Card(
          //  margin: EdgeInsets.symmetric(horizontal: 80),
          color: PRODUCTS[index].bkColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(CardConstants.borderRadius)),
        ),
      ),
      Container(
        width: CardConstants.width,
        child: PRODUCTS[index].image != null
            ? Image.asset(
                PRODUCTS[index].image!,
                fit: BoxFit.fill,
              )
            : const FlutterLogo(),
      ),
    ]);
  }
}

class CardConstants {
  static const height = 300.0;
  static const width = 220.0;
  static const borderRadius = 15.0;
}
