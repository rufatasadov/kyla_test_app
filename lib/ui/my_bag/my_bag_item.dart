import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kyle_test_app/config/constants.dart';
import 'package:kyle_test_app/models/shopping_card_model.dart';
import 'package:kyle_test_app/provider/my_bag_provider.dart';

class MyBagItemWidget extends StatefulWidget {
  final ShoppingCardItemModel myBagItem;
  final Animation<double> animation;
  Function(ShoppingCardItemModel item)? callbackRemove;

  MyBagItemWidget({
    Key? key,
    required this.myBagItem,
    required this.animation,
    this.callbackRemove,
  }) : super(key: key);

  @override
  State<MyBagItemWidget> createState() => _MyBagItemWidgetState();
}

class _MyBagItemWidgetState extends State<MyBagItemWidget> {
  final _amountHeigth = 20.0;
  final imageSize = 120.0;

  MyBagProvider _myBagProvider = MyBagProvider();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final GlobalKey<AnimatedListState> _listAmountKey = GlobalKey();

  final ScrollController _amountListController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  void _animateToIndex(ScrollController scrll, int index) {
    scrll.animateTo(
      index * _amountHeigth,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    ShoppingCardItemModel item = widget.myBagItem;
    Future.delayed(Duration.zero).then((value) {
      _animateToIndex(_amountListController, item.amount);
    });
    return _buildItem(item, widget.animation);
  }

  Widget _buildItem(ShoppingCardItemModel item, Animation<double> animation) {
    final myTween = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    );
    return SizeTransition(
      sizeFactor: animation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScaleTransition(
            scale: animation,
            child: _itemLeft(item.product.image),
          ),
          SlideTransition(
            position: myTween.animate(animation),
            child: _itemRight(item),
          ),
        ],
      ),
    );
  }

  Container _itemRight(ShoppingCardItemModel item) {
    return Container(
      height: imageSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.product.name,
            style: styleMyBagProductTitle,
          ),
          Text(item.product.priceFixed, style: styleMyBagPrice),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _amountButton(-1, item, _amountListController),
              const SizedBox(
                width: 15,
              ),

              Container(
                height: 20,
                width: 10,
                child: AnimatedList(
                    key: _listAmountKey,
                    controller: _amountListController,
                    initialItemCount: List<int>.generate(
                            10, (int index) => index,
                            growable: true)
                        .length,
                    itemBuilder: (context, index, animation) {
                      return _buildAmountItem(
                          List<int>.generate(10, (int index) => index,
                              growable: true)[index],
                          animation);
                    }),
              ),
              //Text(item.amount.toString(), style: styleMyBagAmount),
              const SizedBox(
                width: 15,
              ),
              _amountButton(1, item, _amountListController),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAmountItem(int item, Animation<double> animation) {
    final myTween = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    );

    return SlideTransition(
      position: myTween.animate(animation),
      child: SizedBox(
          height: 20, child: Text(item.toString(), style: styleMyBagAmount)),
    );
  }

  Widget _amountButton(
      int value, ShoppingCardItemModel item, ScrollController scrll) {
    return GestureDetector(
      onTap: () {
        item.amount += value;
        _animateToIndex(scrll, item.amount);
        print(item.product.id);
        widget.callbackRemove!(item);

        //  int removeIndex = myBagItemList.indexOf(item);
        //     _myBagProvider.updFromMyBag(item);
        //     if (item.amount <= 0) {
        //       ShoppingCardItemModel removedItem =
        //           myBagItemList.removeAt(removeIndex);
        //       AnimatedListRemovedItemBuilder builder = (context, animation) {
        //         return _buildItem(removedItem, animation);
        //       };
        //       _listKey.currentState!.removeItem(removeIndex, builder);
        //     }
      },
      child: Container(
        width: 40,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
            child: Text(value > 0 ? '+' : '-', style: styleMyBagProductTitle)),
      ),
    );
  }

  Container _itemLeft(String image) {
    return Container(
      width: imageSize + 60,
      height: imageSize + 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 5,
            child: Container(
              height: imageSize * 1.2,
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}
