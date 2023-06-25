import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  TextInputType? keyboardType;
  String?text;
  CustomTextFormFiled({required this.keyboardType,required this.text});

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: text,
          hintText: text,
          hintStyle: TextStyle(fontSize: 15,color: Colors.white),
          labelStyle:  TextStyle(fontSize: 15,color: Colors.white),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
                color: Colors.blue,
                width: 3
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
        )
    ) ;
  }
}
