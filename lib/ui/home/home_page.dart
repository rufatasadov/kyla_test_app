import 'package:flutter/material.dart';
import 'package:kyle_test_app/config/constants.dart';
import 'package:kyle_test_app/ui/home/more_slider.dart';
import 'package:kyle_test_app/ui/home/product_slider.dart';
import 'package:kyle_test_app/ui/reusable/card_widget.dart';
import 'package:kyle_test_app/ui/reusable/my_tabbar.dart';
import 'package:kyle_test_app/ui/transition.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final _appBarTitle = 'Discover';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: _bottomNavBar(context),
      body: false
          ? MyTransition()
          : Column(children: const [
               MyTabBar(listData: BRANDS),
               Expanded(child: ProductSlider()),
               MoreWidget(),
            ]),
    );
  }

 

  Theme _bottomNavBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.grey[300],
      ),
      child: BottomNavigationBar(
          fixedColor: Colors.red,
          showSelectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                label: 'Favorite', icon: Icon(Icons.favorite_outline)),
            BottomNavigationBarItem(
                label: 'Location', icon: Icon(Icons.home_work_outlined)),
            BottomNavigationBarItem(
                label: 'Shopping Card',
                icon: Icon(Icons.shopping_cart_outlined)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ]),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        _appBarTitle,
      ),
      elevation: 0.0,
      actions: [_searchAction(), _notificationAction()],
    );
  }

  Widget _searchAction() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(iconSearch),
    );
  }

  Widget _notificationAction() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(iconNotification),
    );
  }
}
