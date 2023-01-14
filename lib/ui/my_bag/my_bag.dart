import 'package:flutter/material.dart';
import 'package:kyle_test_app/config/constants.dart';
import 'package:kyle_test_app/models/shopping_card_model.dart';
import 'package:kyle_test_app/provider/my_bag_provider.dart';
import 'package:kyle_test_app/ui/my_bag/my_bag_item.dart';
import 'package:provider/provider.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({Key? key}) : super(key: key);

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  final _horizontalPadding = 16.0;
  final _verticalPadding = 2.0;
  final imageSize = 120.0;

  final strMyBag = 'My Bag';
  final strTotal = 'TOTAL';
  final strNext = 'NEXT';

  List<ShoppingCardItemModel> myBagItemList = [];

  MyBagProvider _myBagProvider = MyBagProvider();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void removeItem(ShoppingCardItemModel item) {
    final removeIndex = myBagItemList.indexOf(item);
    _myBagProvider.updFromMyBag(item);
    if (item.amount <= 0) {
      ShoppingCardItemModel removedItem = myBagItemList.removeAt(removeIndex);

      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return MyBagItemWidget(myBagItem: removedItem, animation: animation);
      };
      _listKey.currentState!.removeItem(removeIndex, builder);
    }
  }

  void insertItem(ShoppingCardItemModel item) {
    // final item = myBagItemList[0];
    int insertIndex = 0;
    myBagItemList.insert(insertIndex, item);
    _listKey.currentState!.insertItem(insertIndex);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _myBagProvider = Provider.of<MyBagProvider>(context, listen: true);
    myBagItemList = _myBagProvider.myBagData;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _horizontalPadding, vertical: _verticalPadding),
        child: Column(
          children: [
            _headerRow(),
            const Divider(
              thickness: 2.0,
            ),
            _itemList(),
            _totalRow(),
            SizedBox(
              height: 15,
            ),
            _nextButton()
          ],
        ),
      ),
    );
  }

  Expanded _itemList() {
    return Expanded(
      child: AnimatedList(
        key: _listKey,
        initialItemCount: myBagItemList.length,
        itemBuilder: (context, index, animation) {
          return MyBagItemWidget(
            myBagItem: myBagItemList[index],
            animation: animation,
            callbackRemove: removeItem,
          );
          //_buildItem(myBagItemList[index], animation);
        },
      ),
    );
  }

  Row _totalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          strTotal,
          style: styleMyBagTotalLabel,
        ),
        Text(
          ' \$ ${_getSumValue()}',
          style: styleMyBagPrice,
        ),
      ],
    );
  }

  String _getSumValue() {
    final result = myBagItemList.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + element.amount * element.product.price);

    return result.toStringAsFixed(2);
  }

  Row _headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          strMyBag,
          style: styleMyBagTitle,
        ),
        Text(
          '$strTotal ${myBagItemList.length} item',
          style: styleMyBagTotalItem,
        ),
      ],
    );
  }

  Container _nextButton() {
    return Container(
      height: heightButton,
      padding: paddingButton,
      child:
          ElevatedButton(child: Center(child: Text(strNext)), onPressed: () {}),
    );
  }
}
