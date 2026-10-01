import 'package:flutter/material.dart';

class Customtextfeild extends StatelessWidget {
  const Customtextfeild({super.key, required this.componentController, required this.hintText});

final TextEditingController componentController;

  final String hintText;
  @override
  
  Widget build(BuildContext context) {
    return TextField(
      controller: componentController,
              decoration:  InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black45, width: 5),
                ),
              ),
    );
  }
}
