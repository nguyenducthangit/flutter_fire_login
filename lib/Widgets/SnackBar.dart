import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.red, // Màu nền để nhấn mạnh lỗi
      duration: Duration(seconds: 2),
    ),
  );
}
