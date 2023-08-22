// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:newsapp/constant.dart';
import 'package:newsapp/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const primaryColor = Color(0xFF6252DA);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF7777B6);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Text("News"),
        ),
        drawer: MediaQuery.of(context).size.width < 640 ? myDrawer : null,
        body: Row(
          children: [
            if (MediaQuery.of(context).size.width > 640) myDrawer,
            Expanded(child: NewsListPage(newsPage: pages[0]))
          ],
        ));
  }
}
