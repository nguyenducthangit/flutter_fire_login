import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_signup_login/LoginSinup/LoginScreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Delay 3 giây trước khi chuyển sang màn hình chính
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // Màu nền khớp với splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: 150, // Tùy chỉnh kích thước logo
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white, // Màu chỉ báo tải
            ),
          ],
        ),
      ),
    );
  }
}
