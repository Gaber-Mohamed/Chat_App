import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String hintText;
  VoidCallback ontap;
  Button({required this.hintText, required this.ontap});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Text(
          hintText,
          style: TextStyle(
              color: Color(0XFF2B475E),
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
