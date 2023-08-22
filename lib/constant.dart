import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/model/article_category.dart';
import 'package:newsapp/model/news.dart';

import 'news_page.dart';

var myDrawer = Drawer(
  backgroundColor: Colors.white,
  width: 260,
  child: SingleChildScrollView(
    child: SizedBox(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // Get.to(() => NewsListPage(newsPage: pages[0]));
            },
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => NewsListPage(newsPage: pages[1]));
            },
            child: const ListTile(
              leading: Icon(Icons.business),
              title: Text("Business"),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => NewsListPage(newsPage: pages[2]));
            },
            child: const ListTile(
              leading: Icon(Icons.laptop),
              title: Text("Technology"),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => NewsListPage(newsPage: pages[3]));
            },
            child: const ListTile(
              leading: Icon(Icons.movie),
              title: Text("Entertainment"),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => NewsListPage(newsPage: pages[4]));
            },
            child: const ListTile(
              leading: Icon(Icons.sports),
              title: Text("Sports"),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => NewsListPage(newsPage: pages[5]));
            },
            child: const ListTile(
              leading: Icon(Icons.health_and_safety),
              title: Text("Science"),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => NewsListPage(newsPage: pages[6]));
            },
            child: const ListTile(
              leading: Icon(Icons.science),
              title: Text("Helth"),
            ),
          )
        ],
      ),
    ),
  ),
);

const List<NewsPage> pages = [
  NewsPage(
      title: 'Top Headlines',
      iconData: Icons.newspaper,
      category: ArticleCategory.general),
  NewsPage(
      title: 'Business',
      iconData: Icons.business,
      category: ArticleCategory.business),
  NewsPage(
      title: 'Technology',
      iconData: Icons.laptop,
      category: ArticleCategory.technology),
  NewsPage(
      title: 'Entertainment',
      iconData: Icons.movie,
      category: ArticleCategory.entertainment),
  NewsPage(
      title: 'Sports',
      iconData: Icons.sports,
      category: ArticleCategory.sports),
  NewsPage(
      title: 'Science',
      iconData: Icons.network_ping,
      category: ArticleCategory.science),
  NewsPage(
      title: 'Health',
      iconData: Icons.health_and_safety,
      category: ArticleCategory.health),
];
