import 'package:flutter/material.dart';
import 'package:kyle_test_app/config/constants.dart';
import 'package:kyle_test_app/ui/home/product_slider.dart';
import 'package:kyle_test_app/ui/reusable/card_widget.dart';
import 'package:kyle_test_app/ui/transition.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final _appBarTitle = 'Discover';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: Theme(
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
              BottomNavigationBarItem(
                  label: 'Profile', icon: Icon(Icons.person)),
            ]),
      ),
      body: false
          ? MyTransition()
          : Column(children: [
              BrandsTabBar(),
              ProductSlider(),
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

class BrandsTabBar extends StatefulWidget {
  const BrandsTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BrandsTabBar> createState() => BrandsTabBarState();
}

class BrandsTabBarState extends State<BrandsTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  static const _selectedTextColor = Colors.black;
  static const _unSelectedTextColor = Colors.black38;
  static const _fontSize = 16.0;
  static const _tabHeight = 80.0;

  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: BRANDS.length,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: _tabHeight,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicator: const BoxDecoration(color: Colors.transparent),
          tabs: [
            ...BRANDS.map((e) {
              final index = BRANDS.indexOf(e);
              final _isSelected = index == _tabIndex;
              return _brandTabItem(e, _isSelected);
            }).toList(),
          ],
        ));
  }

  Text _brandTabItem(String title, bool selected) {
    return Text(
      title,
      style: TextStyle(
        color: selected ? _selectedTextColor : _unSelectedTextColor,
        fontSize: _fontSize,
      ),
    );
  }
}
