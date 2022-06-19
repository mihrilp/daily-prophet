import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../screens/news_detail.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required NewsModel? model,
  })  : _model = model,
        super(key: key);

  final NewsModel? _model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetail(news: _model!))),
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                _model?.urlToImage ??
                    'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              )),
          title: Text(
            _model?.title ?? '',
            style: TextStyle(fontWeight: FontWeight.w500, height: 1.2),
          ),
        ),
      ),
    );
  }
}
