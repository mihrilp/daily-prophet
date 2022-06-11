import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: 58,
            child: BottomAppBar(
                child: TabBar(
                    padding: EdgeInsets.zero,
                    indicatorColor: Colors.transparent,
                    labelStyle: TextStyle(fontSize: 14),
                    tabs: [
                  Tab(
                    text: 'News',
                    icon: Icon(Icons.newspaper_outlined),
                  ),
                  Tab(
                    text: 'Favorites',
                    icon: Icon(Icons.favorite_border_outlined),
                  ),
                ])),
          ),
        ));
  }
}
