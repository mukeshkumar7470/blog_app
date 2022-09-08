import 'package:blog_app/services/routes/app_routes.dart';
import 'package:blog_app/views/widgets/latest_news_item.dart';
import 'package:blog_app/views/widgets/status_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/SignInController.dart';
import '../models/latest_news.dart';
import '../models/slider_image.dart';

class DashboardContentScreen extends StatefulWidget {
  final int? id;
  final bool first;

  const DashboardContentScreen({Key? key, this.id, required this.first})
      : super(key: key);

  @override
  State<DashboardContentScreen> createState() => _DashboardContentScreenState();
}

class _DashboardContentScreenState extends State<DashboardContentScreen> {
  final SignInController _signInController = Get.find<SignInController>();

  void getSignedUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("USER_NAME")) {
      _signInController.userName.value = prefs.getString("USER_NAME")!;
    } else {
      _signInController.userName.value = "User";
    }
  }

  @override
  void initState() {
    getSignedUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: ListView(
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Obx(() {
                        return Text(
                          "❤ Hi, ${_signInController.userName.value} !",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        );
                      }),
                    ),
                    GestureDetector(
                      onTap: () {
                        _signInController.logoutGoogle();
                      },
                      child: const Icon(
                        Icons.notifications_none_outlined,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Explore today's",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 92,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SizedBox(width: 24),
                    StatusItem(imgUrl: 'assets/images/slide_image_1.png'),
                    StatusItem(imgUrl: 'assets/images/slide_image_2.png'),
                    StatusItem(imgUrl: 'assets/images/slide_image_3.jpg'),
                    StatusItem(imgUrl: 'assets/images/slide_image_1.png'),
                    StatusItem(imgUrl: 'assets/images/slide_image_1.png'),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              CarouselSlider(
                items: imageSliderList.map((item) {
                  return Stack(
                    children: [
                      Positioned(
                        left: 20,
                        bottom: 30,
                        child: Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                blurRadius: 15,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Image.asset(item.imgUrl,
                            height: 273, width: 236, fit: BoxFit.cover),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 20,
                        child: Text(
                          item.title,
                        ),
                      ),
                    ],
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  initialPage: 5,
                  viewportFraction: 0.7,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Latest Blog",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "More",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 18, color: Colors.blueGrey),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: latestNewsList.sublist(0, 3).map((news) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: LatestNewsItem(latestNews: news),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.toNamed(AppRoutes.addBlog);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
