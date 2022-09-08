import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/latest_news.dart';
import '../dashboard_screen.dart';

class LatestNewsItem extends StatelessWidget {
  final LatestNews latestNews;

  const LatestNewsItem({Key? key, required this.latestNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(SettingsNavigation.dialog, id: SettingsNavigation.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Image.asset(
              latestNews.imgUrl,
              width: 92,
              height: 110,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    latestNews.category,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    latestNews.title,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}