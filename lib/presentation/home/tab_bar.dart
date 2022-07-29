import 'package:flutter/material.dart';
import 'package:icm_app/presentation/home/home_screen.dart';

import '../../components/bottom_tab_bar.dart';
import '../../res/colors.dart';
import 'shop_screen.dart';

class TabBarCustom extends StatefulWidget {
  final int? index;
  const TabBarCustom({this.index, Key? key}) : super(key: key);

  @override
  _TabBarCustomState createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4,
        vsync: this,
        initialIndex: widget.index == null ? 0 : widget.index!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const <Widget>[
          HomeScreen(),
          ShopScreen(),
          Icon(Icons.ac_unit),
          Icon(Icons.ac_unit),
        ],
      ),
      bottomNavigationBar: MainTabBar(
        tabController: _tabController,
      ),
    );
  }
}
