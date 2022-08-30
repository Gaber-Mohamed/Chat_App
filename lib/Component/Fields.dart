import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextformField extends StatelessWidget {
  TextEditingController controller=TextEditingController();
  String? hinttext;
  bool? passwordvisible;
 Function(String)? OnChange;
  TextformField({this.hinttext , this.OnChange , this.passwordvisible = false});
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordvisible!,
      controller: controller,
      validator: (data){
        if(data!.isEmpty)
        return 'field is required';
        else if(data.length < 8 )
        return '$hinttext must be at least 8 charactrs';
      },
      onChanged: OnChange,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.white)),
        hintText: '$hinttext',
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
