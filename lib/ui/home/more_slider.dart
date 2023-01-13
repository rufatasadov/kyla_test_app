import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyle_test_app/config/constants.dart';

class MoreWidget extends StatefulWidget {
  const MoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  late ScrollController _scrollController;
  late PageController _pageController;

  final moreTitle = 'More';
  final moreHeigth = 250.0;

  final _horizontalPadding = 15.0;
  final _verticalPadding = 0.0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );

    _pageController = PageController(
      viewportFraction: 1 / 3,
      keepPage: true,
    );
  }

  void _stepNext() {
    _scrollController.animateTo(
      _scrollController.position.extentInside,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: moreHeigth,
      padding: EdgeInsets.symmetric(
          horizontal: _horizontalPadding, vertical: _verticalPadding),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(moreTitle, style: TextStyle(fontWeight: FontWeight.bold)),
            IconButton(
                onPressed: () {
                  _stepNext();
                },
                icon: Icon(iconForward))
          ],
        ),
        Expanded(
            child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10),
          scrollDirection: Axis.horizontal,
          itemCount: PRODUCTS.length,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return _cardItem(index);
          },
        )),
      ]),
    );
  }

  Widget _cardItem(int index) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: CardConstants.width,
        height: CardConstants.height,
        // padding: EdgeInsets.all(8.0),
        child: Card(
          //  margin: EdgeInsets.symmetric(horizontal: 80),
          color: CardConstants.bkColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(CardConstants.borderRadius)),
        ),
      ),
      _cardImage(PRODUCTS[index].image),
      // need to check if null
      _categorySticker(PRODUCTS[index].category!),
      _favoriteSticker(PRODUCTS[index].isFavorite),
      Positioned(
        bottom: 40,
        child: Column(
          
          children: [
            Text(PRODUCTS[index].name, style: styleProductTitleMore),
            const SizedBox(height: 5.0,),
            Text(' \$${PRODUCTS[index].price.toStringAsFixed(2)}',style: styleProductPriceMore,),
          ],
        ),
      )
    ]);
  }

  Positioned _cardImage(image) {
    return Positioned(
      top: 10,
      child: Container(
        width: CardConstants.imageWidth,
        child: image != null
            ? Image.asset(
                image,
                fit: BoxFit.fill,
              )
            : const FlutterLogo(),
      ),
    );
  }

  Positioned _favoriteSticker(bool isFavorite) {
    return Positioned(
        right: 15,
        top: 20,
        child: isFavorite
            ? Icon(
                iconFavorite,
                color: Theme.of(context).primaryColor,
              )
            : Icon(
                iconFavoriteEmpty,
                color: Colors.black,
              ));
  }

  Positioned _categorySticker(String title) {
    return Positioned(
      left: 15,
      top: 15,
      child: Container(
        width: 15,
        height: 60,
        color: Colors.red,
        child: RotatedBox(
          quarterTurns: 3,
          child: Center(
            child: Text(
              title,
              style: styleProductStickerMore,
            ),
          ),
        ),
      ),
    );
  }
}

class CardConstants {
  static const height = 180.0;
  static const width = 160.0;
  static const imageWidth = width * 0.7;
  static const borderRadius = 12.0;
  static const bkColor = Colors.white;
}
