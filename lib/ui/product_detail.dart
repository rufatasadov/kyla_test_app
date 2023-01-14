import 'package:flutter/material.dart';
import 'package:kyle_test_app/config/constants.dart';
import 'package:kyle_test_app/models/product_model.dart';
import 'package:kyle_test_app/models/shopping_card_model.dart';
import 'package:kyle_test_app/provider/my_bag_provider.dart';
import 'package:kyle_test_app/ui/my_bag/my_bag.dart';
import 'package:kyle_test_app/ui/reusable/my_tabbar.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double galleryItemSize = 0;
  final horizontalPadding = 10.0;
  final verticalPadding = 8.0;
  final bottomHeight = 60;
  final appbarHeight = 120.0;
  final preferredSizeH = 250.0;

  final strNoDescription = 'No Description';
  final strMoreDetails = 'MORE DETAILS';
  final strAddToBag = 'ADD TO BAG';
  final strSize = 'Size';
  final strTryIt = 'Try it';
  final sizeStandarts = ['UK', 'USA'];
  final sizeList = ['7.5', '8', '9.5'];

  int _selectedSizeIndex = -1;

  MyBagProvider _myBagProvider = MyBagProvider();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      _myBagProvider = Provider.of<MyBagProvider>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    galleryItemSize = (MediaQuery.of(context).size.width -
            2 * horizontalPadding -
            3 * horizontalPadding) /
        4;
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _galleryRow(),
                const Divider(
                  thickness: 2.0,
                ),
                SizedBox(
                  height: verticalPadding,
                ),
                ..._detailInfoRow(),
                ..._sizeRow(),
                _add2BagButton(),
              ]),
        ),
      ),
    );
  }

  Container _add2BagButton() {
    return Container(
      height: heightButton,
      padding: paddingButton,
      child: ElevatedButton(
          child: Center(child: Text(strAddToBag)),
          onPressed: () {
            final item =
                ShoppingCardItemModel(product: widget.product, amount: 1);
            _myBagProvider.addToMyBag(item);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBagPage()),
            );
          }),
    );
  }

  List<Widget> _detailInfoRow() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.product.name,
            style: styleProductTitleDetail,
          ),
          Text(
            ' \$${widget.product.price.toStringAsFixed(2)}',
            style: styleProductTitleDetail,
          ),
        ],
      ),
      SizedBox(
        height: verticalPadding,
      ),
      Text(
        widget.product.description ?? 'No description',
        style: styleProductDescDetail,
      ),
      SizedBox(
        height: verticalPadding,
      ),
      GestureDetector(
        onTap: () {},
        child: const Text(
          'MORE DETAILS',
          style: styleProductMoreDetails,
        ),
      ),
      SizedBox(
        height: verticalPadding * 2,
      ),
    ];
  }

  Container _galleryRow() {
    return Container(
        height: 80,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: widget.product.gallery
              .map(
                (e) => Stack(alignment: Alignment.center, children: [
                  Container(
                    margin: EdgeInsets.only(right: horizontalPadding),
                    width: galleryItemSize,
                    height: galleryItemSize * 0.8,
                    child: RotatedBox(
                      quarterTurns: e,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.grey.shade100,
                        child: Image.asset(widget.product.image),
                      ),
                    ),
                  ),
                  e == 4 // check type  video or not
                      ? Container(
                          margin: EdgeInsets.only(right: horizontalPadding),
                          width: galleryItemSize,
                          height: galleryItemSize * 0.8,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.grey.shade600.withOpacity(0.5),
                            child: const Icon(
                              Icons.play_circle,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container()
                ]),
              )
              .toList(),
        ));
  }

  List<Widget> _sizeRow() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            strSize,
            style: styleProductTitleDetail,
          ),
          const Spacer(),
          MyTabBar(listData: sizeStandarts, fontSize: 14),
        ],
      ),
      SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            _sizeCard(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      strTryIt,
                      style: styleProductSizeDetail,
                    ),
                    Icon(Icons.follow_the_signs_sharp)
                  ],
                ),
                -2),
            ...sizeList.map(
              (e) {
                var index = sizeList.indexOf(e);
                final widget = Text(e,
                    style: TextStyle(
                        color: _selectedSizeIndex == index
                            ? Colors.white
                            : Colors.black));
                return _sizeCard(widget, index);
              },
            ).toList(),
          ])),
    ];
  }

  Widget _sizeCard(Widget widget, int index) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          _selectedSizeIndex = index;
        });
      }),
      child: Container(
        margin: EdgeInsets.only(right: horizontalPadding),
        width: galleryItemSize,
        height: galleryItemSize * 0.6,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey.shade200,
              ),
              borderRadius: BorderRadius.circular(10)),
          color: _selectedSizeIndex == index
              ? Colors.grey.shade600
              : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: widget),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      flexibleSpace: Container(
        color: widget.product.bkColor,
        height: appbarHeight,
      ),
      elevation: 0.0,
      actions: [_favoriteActionWidget()],
      centerTitle: true,
      title: Text(
        widget.product.brand,
        style: styleAppBarTitle.copyWith(color: LIGHT_COLOR),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(preferredSizeH),
        child: SizedBox(
          width: double.maxFinite,
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
                top: -380,
                left: -40,
                child: CircleAvatar(
                  backgroundColor: widget.product.bkColor,
                  radius: 290,
                )),
            SizedBox(
              height: 240,
              width: 240,
              child: Hero(
                tag: widget.product.name,
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Padding _favoriteActionWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.black12,
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              iconFavoriteEmpty,
              color: Colors.white,
            )),
      ),
    );
  }
}
