import 'package:flutter/material.dart';
import '../../core/utils/size_config.dart';

class DefaultButton extends StatelessWidget {
   DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  var press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      //height: SizeConfig.screenHeight / 16,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          primary: Colors.pinkAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 2.0,
        ),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Sign In',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
