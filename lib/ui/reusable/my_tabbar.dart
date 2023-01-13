import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyTabBar extends StatefulWidget {
  final List<String> listData;
  final double? fontSize;
  const MyTabBar({
    Key? key,
    required this.listData,
    this.fontSize
  }) : super(key: key);

  @override
  State<MyTabBar> createState() => BrandsTabBarState();
}

class BrandsTabBarState extends State<MyTabBar>
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

      length: widget.listData.length,
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
            ...widget.listData.map((e) {
              final index = widget.listData.indexOf(e);
              final _isSelected = index == _tabIndex;
              return _tabItem(e, _isSelected);
            }).toList(),
          ],
        ));
  }

  Text _tabItem(String title, bool selected) {
    return Text(
      title,
      style: TextStyle(
        color: selected ? _selectedTextColor : _unSelectedTextColor,
        fontSize: widget.fontSize ?? _fontSize,
      ),
    );
  }
}