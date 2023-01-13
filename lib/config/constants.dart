import 'package:flutter/material.dart';
import 'package:kyle_test_app/models/product_model.dart';

const iconFavorite = Icons.favorite;
const iconFavoriteEmpty = Icons.favorite_outline;
const iconForward = Icons.arrow_forward;
const iconSearch = Icons.search;
const iconNotification = Icons.notifications_outlined;





// ignore: constant_identifier_names
const List<String> BRANDS = [
  'Nike',
  'Adidas',
  'Puma',
  'Jordan',
  'Reebok',
  'Greyder'
];

// ignore: constant_identifier_names
const List<String> CATEGORIES = [
  'New',
  'Featured',
  'Upcoming',
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
      image: PRODUCT_PICTURE_PATH1,
      description: 'Nike Air Max 220 Women\'s size 6.5 Nike Air Max 220 brand new without box Nike Shoes Sneakers. Visit. Save. More like this.',
      ),
  ProductModel(
      name: 'AIR - 200',
      brand: BRANDS[2],
      price: 140.0,
      image: PRODUCT_PICTURE_PATH2,
      description: 'Nike Air Max 220 Women\'s size 6.5 Nike Air Max 220 brand new without box Nike Shoes Sneakers. Visit. Save. More like this. Nike Air Max 220 Women\'s size 6.5 Nike Air Max 220 brand new without box Nike Shoes Sneakers. Visit. Save. More like this. ',),
  ProductModel(
      name: 'AIR - 300',
      brand: BRANDS[3],
      price: 130.0,
      image: PRODUCT_PICTURE_PATH3,
      bkColor: Colors.lightBlue,
      description: 'Nike Air Max 220 Women\'s size 6.5 Nike Air Max 220 brand new without box Nike Shoes Sneakers. Visit. Save. More like this. Nike Air Max 220 Women\'s size 6.5 Nike Air Max 220 brand new without box Nike Shoes Sneakers. Visit. Save. More like this.',),
  ProductModel(
      name: 'AIR - 400',
      brand: BRANDS[4],
      price: 120.0,
      image: PRODUCT_PICTURE_PATH4,
      description: 'Nike Air Max 220 Women\'s size 6.5 Nike Air Max 220 brand new without box Nike Shoes Sneakers. Visit. Save. More like this. Nike Air Max 220 Women\'s size 6.5 Nike Air Max 220 brand new without box Nike Shoes Sneakers. Visit. Save. More like this.',),
];

 const  styleAppBarTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold,); 
 const  styleProductTitleMore = TextStyle(fontSize: 14, fontWeight: FontWeight.bold,  );
 const  styleProductPriceMore = TextStyle(fontSize: 12, fontWeight: FontWeight.bold,  );
 const  styleProductStickerMore =  TextStyle(fontSize: 8, color: Colors.white);

 const  styleProductTitleDetail = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  );
 const  styleProductDescDetail = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey,  height: 1.5  );
 const  styleProductSizeDetail = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, );

 const  styleProductPriceDetail = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  );
const  styleProductMoreDetails = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black,  decoration: TextDecoration.underline );
 

 const  styleMyBagTitle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold,  );
const   styleMyBagTotalItem = TextStyle(fontSize: 12, fontWeight: FontWeight.bold,  );
const   styleMyBagTotalLabel = TextStyle(fontSize: 14,   );
const   styleMyBagPrice = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,  );
const   styleMyBagProductTitle = TextStyle(fontSize: 14,   );


 const LIGHT_COLOR = Colors.white;
