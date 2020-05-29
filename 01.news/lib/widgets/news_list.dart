import 'package:flutter/material.dart';
import 'package:news/screens/news_article_detail_screen.dart';
import 'package:news/viewmodels/news_article_view_model.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsList({this.articles});

  void _showNewsArticleDetails(BuildContext context, NewsArticleViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailScreen(article: vm,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        final article = articles[index];
        return ListTile(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          leading: Image.network(
            article.imageUrl ?? '',
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
          title: Text(article.title),
        );
      },
      itemCount: articles.length,
    );
  }
}
