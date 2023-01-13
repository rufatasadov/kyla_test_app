import 'package:flutter/material.dart';

class ProductModel {
  String name;
  String brand;
  double price;
  bool isFavorite;
  String? image;
  Color? bkColor;
  String? category;
  List<int> gallery; 
  String? description;

  ProductModel(
      {required this.name,
      required this.brand,
      required this.price,
      this.isFavorite = false,
      this.image,
      this.bkColor = Colors.lightGreen,
      this.category = 'NEW',
      this.gallery = const [1,2,3,4],
      this.description
      });
}

