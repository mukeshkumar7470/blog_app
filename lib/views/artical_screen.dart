import 'package:blog_app/views/widgets/latest_news_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/latest_news.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 80, bottom: 20),
                  child: Column(
                    children: latestNewsList.map((news) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: LatestNewsItem(latestNews: news),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: const Center(
                child: Text(
                  "Articles",
                  style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
