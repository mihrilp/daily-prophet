import 'package:flutter/material.dart';
import "../screens/home.dart";
import "../screens/favorites.dart";

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Color(0xfffff8ed),
          child: _tabbar(),
        ),
        body: _tabbarView(),
      ),
    );
  }

  TabBar _tabbar() {
    return TabBar(
      padding: EdgeInsets.zero,
      indicatorColor: Colors.transparent,
      labelStyle: TextStyle(fontSize: 12),
      controller: _tabController,
      tabs: [
        Tab(
          text: 'News',
          icon: Icon(Icons.newspaper_outlined),
        ),
        Tab(
          text: 'Favorites',
          icon: Icon(Icons.favorite_border_outlined),
        ),
      ],
      unselectedLabelColor: Colors.grey,
    );
  }

  TabBarView _tabbarView() {
    return TabBarView(
        controller: _tabController,
        children: [const Home(), const Favorites()]);
  }
}
