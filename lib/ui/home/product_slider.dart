import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyle_test_app/config/constants.dart';
import 'package:kyle_test_app/models/product_model.dart';
import 'package:kyle_test_app/ui/product_detail.dart';
import 'package:kyle_test_app/ui/reusable/my_tabbar.dart';

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

  void cardClick(ProductModel item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetail(product: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CardConstants.height,
      child: Stack(alignment: Alignment.center, children: [
        _leftCategoryList(),
        _productSlider(),
      ]),
    );
  }

  Positioned _leftCategoryList() {
    return Positioned(
        left: 5,
        child: Container(
          width: 50,
          padding: EdgeInsets.all(8.0),
          child: RotatedBox(
              quarterTurns: 3,
              child: MyTabBar(
                listData: CATEGORIES,
                fontSize: 14,
              )),
        ));
  }

  PageView _productSlider() {
    return PageView.builder(
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
          // middle item
          if (position == _currentPageValue.floor()) {
            return TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.005, end: 0.0),
                duration: const Duration(milliseconds: 300),
                builder: (BuildContext context, double size, Widget? child) {
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
          }
          // right item
          else if (position == _currentPageValue.floor() + 1) {
            return TweenAnimationBuilder(
                tween: Tween<double>(begin: -0.005, end: 0.0),
                duration: const Duration(milliseconds: 300),
                builder: (BuildContext context, double size, Widget? child) {
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
            //left item
            return Container();
            _cardItem(position);
          }
        }));
  }

  Widget _cardItem(int index) {
    return GestureDetector(
      onTap: () {
        cardClick(PRODUCTS[index]);
      },
      child: Stack(alignment: Alignment.center, children: [
        Container(
          width: CardConstants.width,
          height: CardConstants.height,
          padding: EdgeInsets.all(8.0),
          child: Card(
            //  margin: EdgeInsets.symmetric(horizontal: 80),
            color: PRODUCTS[index].bkColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(CardConstants.borderRadius)),
          ),
        ),
        Positioned(
          left: 50,
          child: Container(
            width: CardConstants.width,
            child: PRODUCTS[index].image != null
                ? Hero(
                   tag: PRODUCTS[index].name,
                  child: Image.asset(
                      PRODUCTS[index].image!,
                      fit: BoxFit.fill,
                    ),
                )
                : const FlutterLogo(),
          ),
        ),
      ]),
    );
  }
}

class CardConstants {
  static const height = 300.0;
  static const width = 220.0;
  static const borderRadius = 15.0;
}
