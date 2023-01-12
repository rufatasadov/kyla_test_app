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

    _pageController = PageController(viewportFraction: 0.7,);

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
      child: PageView.builder(
        
          onPageChanged: (val) {
            // _controller.animateTo(0.001);
            // setState(() {
            //   x = animationCard.value;
            // });
          },
          itemCount: PRODUCTS.length,
          controller: _pageController,
        //  pageSnapping: true,
          itemBuilder: ((context, position) {

            print(position);
            print(_currentPageValue.floor());
            if (position == _currentPageValue.floor()) {
             
              return TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.005, end: 0.0),
                  duration: const Duration(milliseconds: 300),
                  builder: (BuildContext context,double size, Widget? child) {
                    return Transform(
                      transform: Matrix4(
                          1, 0, 0, size, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
                        ..rotateX(size)
                        ..rotateY(y)
                        ..rotateZ(z),
                      alignment: FractionalOffset.center,
                      child: _cardItem(position),
                    );
                  });
            } else if (position == _currentPageValue.floor() + 1) {
              return TweenAnimationBuilder(
                  tween: Tween<double>(begin: -0.005, end: 0.0),
                  duration: const Duration(milliseconds: 300),
                  builder: (BuildContext context,double size, Widget? child) {
                    return Transform(
                      transform: Matrix4(
                          1, 0, 0, size, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
                        ..rotateX(size)
                        ..rotateY(y)
                        ..rotateZ(z),
                      alignment: FractionalOffset.center,
                      child: _cardItem(position),
                    );
                  });
            } else {
                
              return _cardItem(position);
            }
          })),
    );
  }

  Widget _cardItem(int index) {
    double x= 0;
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
  static const height = 250.0;
  static const width = 210.0;
  static const borderRadius = 15.0;
}
