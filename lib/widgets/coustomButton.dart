import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
String ?titelbutton;

CustomButton({required this.titelbutton});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child:
            Center(child: Text(titelbutton!)));
  }
}
