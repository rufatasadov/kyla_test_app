import 'package:flutter/material.dart';
import 'package:kyle_test_app/models/product_model.dart';

const iconSearch = Icons.search;
const iconNotification = Icons.notifications_outlined;

const List<String> BRANDS = [
  'Nike',
  'Adidas',
  'Puma',
  'Jordan',
  'Reebok',
  'Greyder'
];

// ignore: constant_identifier_names
const PRODUCT_PICTURE_PATH1 = 'assets/sneaker_01.png';
// ignore: constant_identifier_names
const PRODUCT_PICTURE_PATH2 = 'assets/sneaker_02.png';
// ignore: constant_identifier_names
const PRODUCT_PICTURE_PATH3 = 'assets/sneaker_03.png';
// ignore: constant_identifier_names
const PRODUCT_PICTURE_PATH4 = 'assets/sneaker_04.png';

List<ProductModel> PRODUCTS = [
  ProductModel(
      name: 'AIR - 100',
      brand: BRANDS[1],
      price: 150.0,
      image: PRODUCT_PICTURE_PATH1),
  ProductModel(
      name: 'AIR - 200',
      brand: BRANDS[2],
      price: 140.0,
      image: PRODUCT_PICTURE_PATH2),
  ProductModel(
      name: 'AIR - 300',
      brand: BRANDS[3],
      price: 130.0,
      image: PRODUCT_PICTURE_PATH3,
      bkColor: Colors.lightBlue),
  ProductModel(
      name: 'AIR - 400',
      brand: BRANDS[4],
      price: 120.0,
      image: PRODUCT_PICTURE_PATH4),
];
