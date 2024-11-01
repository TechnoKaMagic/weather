import 'package:flutter/material.dart';
import 'package:weather_app/Widgets.dart';
import 'package:weather_app/data/images.dart';

class BottomInfo extends StatelessWidget {
  final String labelText;
  final String value;
  final String img;

BottomInfo ({
  required this.labelText,
  required this.value,
  required this.img
});
  @override
  Widget build(BuildContext context) {
    return Row(
                      children: [
                        Image.asset(
                          img ,
                          width: 55,
                          height: 55,
                        ),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           TextW(text: labelText, color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16,),
                        TextW(text: value, color: Colors.white)
                        ],
                       )
                      ],
                    );
  }
}