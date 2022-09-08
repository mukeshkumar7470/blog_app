import 'package:blog_app/views/artical_screen.dart';
import 'package:blog_app/views/widgets/latest_news_item.dart';
import 'package:blog_app/views/widgets/status_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/latest_news.dart';
import '../models/slider_image.dart';
import 'package:get/get.dart';

import 'dashboard_content_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(SettingsNavigation.id),
      onGenerateRoute: (settings) {
        if (settings.name != SettingsNavigation.dialog) {
          return GetPageRoute(
            routeName: SettingsNavigation.dialog,
            page: () => const DashboardContentScreen(id: SettingsNavigation.id, first: false),
          );
        } else {
          return GetPageRoute(
            routeName: SettingsNavigation.settings,
            page: () => const ArticlesScreen(),
          );
        }
      },
    );
  }
}

class SettingsNavigation {
  SettingsNavigation._();

  static const id = 0;

  static const settings = '/settings';
  static const dialog = '/dialog';
}
