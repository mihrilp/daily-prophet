import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsSource extends StatefulWidget {
  final String newsUrl;
  const NewsSource({Key? key, required this.newsUrl}) : super(key: key);

  @override
  State<NewsSource> createState() => _NewsSourceState();
}

class _NewsSourceState extends State<NewsSource> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WebView(initialUrl: widget.newsUrl));
  }
}
