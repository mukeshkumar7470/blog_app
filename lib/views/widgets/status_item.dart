import 'package:flutter/material.dart';

class StatusItem extends StatelessWidget {
  final String imgUrl;

  const StatusItem({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff376AED),
              Color(0xff49B0E2),
              Color(0xff9CECFB),
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(imgUrl, height: 50, width: 70, fit: BoxFit.fill,)),
        ),
      ),
    );
  }
}