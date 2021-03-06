import 'package:daily_prophet/models/favorites_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'widgets/tabbar.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoritesModel>(
        create: (context) => FavoritesModel(),
        child: MaterialApp(
          title: 'News App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
                  fontFamily: 'Rubik',
                  scaffoldBackgroundColor: Color(0xfffff8ed),
                  canvasColor: Color(0xfffff8ed))
              .copyWith(
                  appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  tabBarTheme: const TabBarTheme(
                      labelColor: Colors.black,
                      labelPadding: EdgeInsets.all(2))),
          home: const MyTabBar(),
        ));
  }
}
