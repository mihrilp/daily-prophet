import 'package:daily_prophet/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/favorites_model.dart';

class NewsDetail extends StatelessWidget {
  final NewsModel news;
  const NewsDetail({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesList = context.watch<FavoritesModel>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          flexibleSpace: Image.network(
            news.urlToImage ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Text(
                "${news.title}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${news.author}",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    "${news.publishedAt}",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "${news.content}",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 30),
              TextButton(onPressed: () {}, child: Text('View the News Source')),
            ]),
          )),
          BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_rounded),
                  onPressed: () {
                    favoritesList.add(news);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    Share.share("${news.url}");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Column(children: [          Text(

//   ),
//   SizedBox(height: 20),
//   Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       Text(
//         "${news.author}",
//         style: TextStyle(fontSize: 15, color: Colors.grey),
//       ),
//       Text(
//         "${news.publishedAt}",
//         style: TextStyle(fontSize: 15, color: Colors.grey),
//       ),
//     ],
//   ),
//   SizedBox(height: 30),
//   Expanded(
//     child: Text(
//       "${news.content}",
//       style: TextStyle(fontSize: 15),
//     ),]),))

//   ),
//   BottomAppBar(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         IconButton(
//           icon: Icon(Icons.favorite_rounded),
//           onPressed: () {
//             favoritesList.add(news);
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.share),
//           onPressed: () {
//             Share.share("${news.url}");
//           },
//         ),
//       ],
//     ),
//   ),
