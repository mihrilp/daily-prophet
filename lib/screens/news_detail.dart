import 'package:daily_prophet/models/news_model.dart';
import 'package:daily_prophet/screens/news_source.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Text(
                "${news.title}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      news.author ?? 'Unknown',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Text(
                    DateFormat.yMMMEd()
                        .format(DateTime.parse(news.publishedAt!)),
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "${news.content}",
                style: TextStyle(fontSize: 18, height: 1.4),
              ),
              SizedBox(height: 40),
              Text(
                "Source: ${news.source?.name}",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewsSource(newsUrl: news.url!))),
                  child: Text('View the News Source',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xfffbb03b),
                      ))),
            ]),
          )),
          BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: favoritesList.contains(news)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_outline),
                  onPressed: () {
                    favoritesList.contains(news)
                        ? favoritesList.remove(news)
                        : favoritesList.add(news);
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
