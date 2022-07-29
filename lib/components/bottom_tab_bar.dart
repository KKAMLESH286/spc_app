import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/constants.dart';
import '../res/images.dart';

class MainTabBar extends StatelessWidget {
  final TabController? tabController;
  const MainTabBar({this.tabController, Key? key}) : super(key: key);

  Widget _buildTabBar(context) {
    return TabBar(
      key: const Key('mainTabBar'),
      isScrollable: false,
      onTap: onTap,
      controller: tabController,
      indicatorColor: kPrimaryColor,
      labelStyle: kSubTitleStyle.copyWith(color: kSecondaryColor),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
        Tab(
          iconMargin: EdgeInsets.only(bottom: 5),
          icon: Image(
            image: AssetImage(AppImages.homeIcon),
            width: 30,
          ),
        ),
        Tab(
          iconMargin: EdgeInsets.only(bottom: 5),
          icon: Image(
            image: AssetImage(AppImages.categoryIcon),
            width: 30,
          ),
        ),
        Tab(
          iconMargin: EdgeInsets.only(bottom: 5),
          icon: Image(
            image: AssetImage(AppImages.searchIcon),
            width: 30,
          ),
        ),
        Tab(
          iconMargin: EdgeInsets.only(bottom: 5),
          icon: Image(
            image: AssetImage(AppImages.profileIcon),
            width: 30,
          ),
        ),
      ],
      // isScrollable: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(
        top: 8,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
      ),
      child: SafeArea(
        bottom: true,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutQuint,
          height: 45,
          constraints: const BoxConstraints(maxHeight: 45),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                flex: 12,
                child: _buildTabBar(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap(int value) {}
}
