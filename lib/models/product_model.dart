import 'package:flutter/material.dart';

class ProductModel {
  String name;
  String brand;
  double price;
  bool isFavorite;
  String? image;
  Color? bkColor;

  ProductModel(
      {required this.name,
      required this.brand,
      required this.price,
      this.isFavorite = false,
      this.image,
      this.bkColor = Colors.lightGreen});
}
