import 'package:flutter/material.dart';

class Custombtn extends StatelessWidget {
  const Custombtn({
    super.key,
    this.onbtnTap,
    this.label,
    this.buttonicon,
    required this.customcolor,
    this.width = 40,
  });

  final void Function()? onbtnTap;
  final String? label;
  final IconData? buttonicon;
  final Color customcolor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onbtnTap,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: customcolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: buttonicon == null
            ? Center(
                child: Text(
                  label ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    buttonicon,
                    color: Colors.white,
                  ),
                ],
              ),
      ),
    );
  }
}