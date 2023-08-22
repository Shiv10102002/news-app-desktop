import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/homepage.dart';
import 'package:newsapp/model/article.dart';
import 'package:newsapp/model/news.dart';
import 'package:newsapp/news_item.dart';
import 'package:newsapp/service/news_api.dart';

class NewsListPage extends StatefulWidget {
  final NewsPage newsPage;
  final NewsAPI newsAPI = const NewsAPI();
  const NewsListPage({super.key, required this.newsPage});

  @override
  State<NewsListPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsListPage> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = widget.newsAPI.fetchArticles(widget.newsPage.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: canvasColor,
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            "Top Headlines",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: FutureBuilder<List<Article>>(
          future: futureArticles,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 270,
                      mainAxisExtent: 290,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  padding: const EdgeInsets.all(16),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) {
                    return NewsItem(article: snapshot.data![index]);
                  });
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  const Spacer(),
                  Center(
                      child: Text(
                    '$snapshot.error',
                    textAlign: TextAlign.center,
                  )),
                  const SizedBox(height: 10),
                  FilledButton(
                      child: const Text('Refresh'),
                      onPressed: () {
                        setState(() {
                          futureArticles = widget.newsAPI
                              .fetchArticles(widget.newsPage.category);
                        });
                      }),
                  const Spacer()
                ],
              );
            }
            return const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ));
  }
}
