import 'package:icm_app/presentation/dashboard/dashboard.dart';
import 'package:icm_app/presentation/home/home.dart';
import 'package:icm_app/res/constants.dart';
import 'package:icm_app/presentation/Search/search.dart';
import 'package:icm_app/presentation/cart/cart_screen.dart';
import 'package:icm_app/presentation/categories/categories.dart';
import 'package:icm_app/presentation/home/vendor_home.dart';
import 'package:flutter/material.dart';
import 'package:icm_app/presentation/profile/profile_screen.dart';

import '../../res/colors.dart';
import '../../size_config.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
//     VendorHomeScreen(),
//     DashboardScreen(),
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen()
    // Talking(),
    // EventHappening(),
    // InviteFriend(),
    // MyEvents(),
    // EminentSetting()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search from 10,000+ products",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Color(0xff202020),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: kPrimaryColor,
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: kPrimaryColor,
              icon: Icon(
                Icons.category_outlined,
                color: Colors.white,
              ),
              // ImageIcon(
              //   AssetImage(AppImages.star),
              //   color: Colors.white,
              // ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: kPrimaryColor,
              icon: Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: kPrimaryColor,
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              backgroundColor: kPrimaryColor,
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              label: ' Profile',
            ),
            // BottomNavigationBarItem(
            //   backgroundColor: Colors.white,
            //   icon: Icon(
            //     Icons.more_horiz,
            //     color: Colors.white,
            //   ),
            //   label: 'More',
            // ),
          ],
          // fixedColor: Colors.black,
          currentIndex: _selectedIndex,
          selectedItemColor: kWhite,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          unselectedItemColor: kPrimaryColor,
          unselectedLabelStyle: TextStyle(color: Colors.white),
        ));
  }
}
