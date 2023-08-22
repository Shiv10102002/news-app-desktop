import 'package:flutter/material.dart';
import 'package:newsapp/model/article_category.dart';

class NewsPage {
  final String title;
  final IconData iconData;
  final ArticleCategory category;

  const NewsPage(
      {required this.title, required this.iconData, required this.category});
}
