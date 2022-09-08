import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/AddBlogController.dart';
import '../../core/utils/constants.dart';
import '../../models/latest_news.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({Key? key}) : super(key: key);

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final AddBlogController _addBlogController = Get.find<AddBlogController>();
  late LatestNews latestNews;

  @override
  void dispose() {
    _addBlogController.selectedIndex = (-1).obs;
    _addBlogController.titleEditingController.text = '';
    _addBlogController.bodyEditingController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        title: const Text('Add Blog',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15.0, left: 8.0, right: 8.0, bottom: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return false;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 45,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: latestNewsList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    _addBlogController.selectedIndex.value =
                                        index;
                                    _addBlogController.updateIndex(index);
                                  },
                                  child: Obx(() {
                                    return Container(
                                      margin:
                                          const EdgeInsets.only(right: 16.0),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: _addBlogController
                                                        .selectedIndex.value ==
                                                    index
                                                ? Colors.blue.withOpacity(0.8)
                                                : Colors.blue.shade50),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 16.0),
                                        child: Text(
                                          latestNewsList[index].category,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: _addBlogController
                                                          .selectedIndex
                                                          .value ==
                                                      index
                                                  ? Colors.blue[400]
                                                  : null),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: kTextFormFieldStyle(),
                          controller: _addBlogController.titleEditingController,
                          decoration: const InputDecoration(
                            hintText: 'Blog Title',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _addBlogController.bodyEditingController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            hintText: 'Blog Description',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                          maxLines: 7,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Body field can't be empty";
                            }
                            return val;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [loginButton()],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
        },
        child: const Text('Publish'),
      ),
    );
  }
}
