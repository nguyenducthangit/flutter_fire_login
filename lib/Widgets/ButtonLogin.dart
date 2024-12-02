import 'package:flutter/material.dart';

class Buttonlogin extends StatelessWidget {
  final VoidCallback onTad;
  final String text;
  const Buttonlogin({
    super.key,
    required this.onTad,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTad,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.blue,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
