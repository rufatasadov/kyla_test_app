import 'package:flutter/material.dart';
import 'package:kyle_test_app/models/shopping_card_model.dart';

class MyBagProvider extends ChangeNotifier {
  List<ShoppingCardItemModel> myBagData = [];

  Future<void> addToMyBag(ShoppingCardItemModel item) async {
    final index = myBagData
        .indexWhere((element) => element.product.id == item.product.id);
    if (index >= 0) {
      return;
    }
    myBagData.add(item);
    notifyListeners();
  }

  Future<void> removeFromMyBag(ShoppingCardItemModel item) async {
    myBagData.removeWhere((element) => element.product.id == item.product.id);
    notifyListeners();
  }

  Future<void> updFromMyBag(ShoppingCardItemModel item) async {
    myBagData
        .firstWhere((element) => element.product.id == item.product.id)
        .amount = item.amount;
    notifyListeners();
  }
}
