import 'package:flutter/material.dart';
import 'package:news/viewmodels/news_article_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsArticleDetailScreen({@required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.article.title),
      ),
      body: WebView(
        initialUrl: this.article.url,

      ),
    );
  }
}
