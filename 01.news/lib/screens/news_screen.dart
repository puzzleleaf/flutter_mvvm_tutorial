import 'package:flutter/material.dart';
import 'package:news/utils/constants.dart';
import 'package:news/viewmodels/news_article_list_view_model.dart';
import 'package:news/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  Widget _buildList(NewsArticleListViewModel vs) {
    switch (vs.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: NewsGrid(
            articles: vs.articles,
          ),
        );
      case LoadingStatus.empty:
      default:
        return Center(
          child: Text("No results found"),
        );
    }
  }

  void _selectCountry(NewsArticleListViewModel vs, String country) {
    vs.topHeadlinesByCountry(Constants.Countries[country]);
  }

  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              _selectCountry(vs, value);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.Countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'News',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Divider(
              height: 40,
              color: Color(0xffFF8A30),
              thickness: 8,
              indent: 30,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Text(
                'Headline',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: _buildList(vs),
            ),
          ],
        ),
      ),
    );
  }
}
